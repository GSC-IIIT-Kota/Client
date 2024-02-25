import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/models/blog.dart';
import 'package:solution_challenge/services/blog_service.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

import '../../../utils/provider/userProvider.dart';

class UploadBlogScreen extends StatefulWidget {
  const UploadBlogScreen({super.key});

  @override
  _UploadBlogScreenState createState() => _UploadBlogScreenState();
}

class _UploadBlogScreenState extends State<UploadBlogScreen> {
  final ImagePicker _picker = ImagePicker();
  late File _imageFile;

  String imageUrl='';

  String title = '';
  String content = '';
  String category = ''; // New category field
  DateTime? date;

  Future<void> _pickImage() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

      Reference referenceRoot = FirebaseStorage.instance.ref();
      Reference referenceDirImages = referenceRoot.child('blogs');

      Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);

      try{
        await referenceImageToUpload.putFile(File(pickedImage.path));
        imageUrl = await referenceImageToUpload.getDownloadURL();
        print(imageUrl);
      }catch(error){}

    }
  }

  @override
  void initState() {
    super.initState();
    _imageFile = File(''); // Initial empty file
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(translatedStrings?[78] ?? 'Upload Blog'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Upload Image Button
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.image),
              label: Text(translatedStrings?[79] ?? 'Upload Image'),
            ),
            const SizedBox(height: 20.0),

            // Display selected image
            _imageFile.path.isNotEmpty
                ? Image.file(_imageFile)
                : const SizedBox.shrink(),

            // Title Input
            TextFormField(
              decoration: InputDecoration(
                labelText: translatedStrings?[80] ?? 'Title',
                prefixIcon: const Icon(Icons.text_fields),
              ),
              onChanged: (value) => title = value,
            ),
            const SizedBox(height: 20.0),

            // Content Input
            TextField(
              maxLines: null, // Allow multiline input
              decoration: InputDecoration(
                labelText: translatedStrings?[81] ?? 'Content',
                prefixIcon: const Icon(Icons.text_format),
              ),
              onChanged: (value) => content = value,
            ),
            const SizedBox(height: 20.0),

            // Category Input
            TextFormField(
              decoration: InputDecoration(
                labelText: translatedStrings?[82] ?? 'Category',
                prefixIcon: const Icon(Icons.category),
              ),
              onChanged: (value) => category = value,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: ElevatedButton(
          onPressed: () async {
            final user = Provider.of<UserProvider>(context, listen: false).user;
            if (user == null) {
              // Handle null user case
              return;
            }

            final blog = Blog(
              title: title,
              content: content,
              authorName: "${user.profile.firstName} ${user.profile.lastName}",
              image: imageUrl,
              category: category,
              authorID: user.id,
              // date: date!.toLocal(),
              // date: DateTime.now().millisecondsSinceEpoch, // Convert DateTime to timestamp
            );

            try {
              await BlogService.createBlog(blog);
              Navigator.pop(context, true); // Go back to the previous screen
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(translatedStrings?[83] ?? 'Failed to upload blog post'),
                ),
              );
            }
          },
          child: Text(translatedStrings?[84] ?? 'Upload Blog'),
        ),
      ),
    );
  }
}
