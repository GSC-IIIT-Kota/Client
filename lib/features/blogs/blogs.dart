import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/blogs/blogs_card.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/white_search_container.dart';
import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
import 'package:solution_challenge/features/blogs/screens/blogs_create.dart';
import 'package:solution_challenge/models/blog.dart';
import 'package:solution_challenge/services/blog_service.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/provider/userProvider.dart';
import 'package:solution_challenge/utils/datetime/date_time.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PPrimaryNgoContainer(
              child: Column(
                children: [
                  SizedBox(height: TSizes.spaceBtwItems),
                  PBlogAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  PWhiteSearchContainer(text: "Search Blogs"),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: TSizes.spaceBtwItems),
                  PSectionHeading(
                    title: 'Latest Blogs',
                    textColor: dark ? Colors.white : Colors.black,
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  FutureBuilder<List<Blog>>(
                    future: BlogService.getAllBlogs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
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
                              blogDate: formatTimeString(blog.date.toString()),
                              blogContent: blog.content,
                              blogId: blog.id,
                            );
                          },
                        );
                      } else {
                        return const SizedBox(); // Empty container when no data
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PBlogAppBar extends StatelessWidget {
  const PBlogAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "How you doing'?",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.accent),
          ),
          Text(
            user!.profile.firstName,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .apply(color: Colors.white),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Get.to(() => const UploadBlogScreen()),
          icon: const Icon(Icons.edit, color: Colors.white),
        ),
      ],
    );
  }
}
