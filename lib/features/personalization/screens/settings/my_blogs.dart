import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/blogs/blogs_card.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/models/blog.dart';
import 'package:solution_challenge/services/user_favorites.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/provider/userProvider.dart';

import '../../../../utils/helpers/helper_functions.dart';

class MyBlogsScreen extends StatelessWidget {
  const MyBlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    final String userId = user?.id ?? '';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      'My Blogs',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: TSizes.defaultSpace,
            ),
            FutureBuilder<List<Blog>?>(
              future: UserFavorites().getUserBlogs(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No blogs found'));
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final blog = snapshot.data![index];
                      return PBlogCard(
                        cardWidth: PHelperFunctions.screenWidth(),
                        bottomMargin: const EdgeInsets.only(
                            bottom: TSizes.spaceBtwItems),
                        imageUrl: blog.image,
                        blogTitle: blog.title,
                        blogCategory: blog.category,
                        blogAuthor: blog.authorID,
                        blogDate: blog.date.toString(),
                        blogContent: blog.content,
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
