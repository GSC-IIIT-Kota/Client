import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/models/blog.dart';
import 'package:solution_challenge/services/blog_service.dart';

import '../../../utils/provider/userProvider.dart';

class UploadBlogScreen extends StatefulWidget {
  const UploadBlogScreen({Key? key}) : super(key: key);

  @override
  _UploadBlogScreenState createState() => _UploadBlogScreenState();
}

class _UploadBlogScreenState extends State<UploadBlogScreen> {
  final ImagePicker _picker = ImagePicker();
  late File _imageFile;

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
    }
  }

  @override
  void initState() {
    super.initState();
    _imageFile = File(''); // Initial empty file
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Blog'),
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
              label: const Text('Upload Image'),
            ),
            const SizedBox(height: 20.0),

            // Title Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Title',
                prefixIcon: Icon(Icons.text_fields),
              ),
              onChanged: (value) => title = value,
            ),
            const SizedBox(height: 20.0),

            // Content Input
            TextField(
              maxLines: null, // Allow multiline input
              decoration: const InputDecoration(
                labelText: 'Content',
                prefixIcon: Icon(Icons.text_format),
              ),
              onChanged: (value) => content = value,
            ),
            const SizedBox(height: 20.0),

            // Category Input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category),
              ),
              onChanged: (value) => category = value,
            ),
            const SizedBox(height: 20.0),

            // Display selected image
            _imageFile.path.isNotEmpty
                ? Image.file(_imageFile)
                : const SizedBox.shrink(),
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
              image: _imageFile.path,
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
                const SnackBar(
                  content: Text('Failed to upload blog post'),
                ),
              );
            }
          },
          child: const Text('Upload Blog'),
        ),
      ),
    );
  }
}
