import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import '../../../../common/widgets/blogs/blogs_card.dart';
import '../../../../models/blog.dart';
import '../../../../services/blog_service.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../../utils/provider/userProvider.dart';

class FavouriteBlogsScreen extends StatelessWidget {
  const FavouriteBlogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    List<String>? fblogs = user?.favouriteBlogs;
    print(fblogs);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  ///Appbar
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      'Favorite Blogs',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: fblogs?.length ?? 0,
              itemBuilder: (context, index) {
                if (fblogs == null) {
                  return const SizedBox(); // Return an empty widget if fblogs is null
                }
                String blogid = fblogs[index];
                print(blogid);
                return FutureBuilder<Blog>(
                  future: BlogService.getBlogById(blogid),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data == null) {
                      return const SizedBox(); // Return an empty widget if no data
                    } else {
                      Blog blog = snapshot.data!;
                      return PBlogCard(
                        cardWidth: PHelperFunctions.screenWidth(),
                        bottomMargin:
                        const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                        imageUrl: blog.image,
                        blogTitle: blog.title,
                        blogCategory: blog.category,
                        blogAuthor: blog.authorID,
                        blogDate: blog.date.toString(),
                        blogContent: blog.content,
                      );
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
