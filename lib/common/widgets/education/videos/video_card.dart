import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_profile.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/models/education/video.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import '../../../../utils/datetime/date_time.dart';

class PVideoCard extends StatelessWidget {
  const PVideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => PVideoProfile(
            videoCategory: video.category,
            uploadTime: video.uploadDate.toString(),
            videoTitle: video.title,
            videoUploader: video.uploader,
            videoDescription: video.description,
            videoThumbnailUrl: video.thumbnailUrl,
            videoComments: video.comments,
            videoLikes: video.likes,
            videoTranscripts: video.transcripts,
            videoUrl: video.videoUrl,
            videoTags: video.tags,
          )),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? Colors.black : Colors.white,
        ),
        child: Column(
          children: [
            PRoundedContainer(
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  ///Thumbnail
                  PRoundedImage(
                    isNetworkImage: true,
                    imageUrl: video.thumbnailUrl,
                    applyImageRadius: true,
                    aspectRatio: 16 / 9,
                  ),

                  /// Play icon
                  Center(
                    heightFactor: 2,
                    child: Container(
                      width: 60, // Adjust the size as needed
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: TColors.brightpink
                            .withOpacity(0.8), // You can change the color
                      ),
                      child: const Icon(
                        Iconsax.play5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            ///VideoBody
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.md, right: TSizes.md, top: TSizes.sm, bottom: TSizes.md),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Video Title
                  Column(
                    children: [
                      Text(
                        video.title,
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                            color: dark ? Colors.white : TColors.dimgrey,),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                    ],
                  ),


                  ///Video Category, Upload time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(
                        width: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PCardIconText(
                              iconData: Iconsax.category,
                              iconSize: 14,
                              iconColor: dark ? TColors.brightpink : TColors.rani,
                              title: video.title,
                              titleStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(
                                      color: dark
                                          ? TColors.brightpink
                                          : TColors.rani),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwItems / 2,
                            ),
                            PCardIconText(
                              iconData: Iconsax.clock,
                              iconSize: 14,
                              iconColor: dark
                                  ? Colors.white.withOpacity(0.9)
                                  : TColors.dimgrey,
                              title: calculateTimeSince(video.uploadDate.toString()),
                              titleStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .apply(
                                      color: dark
                                          ? Colors.white.withOpacity(0.9)
                                          : TColors.dimgrey),
                            ),
                          ],
                        ),
                      ),
                    ],
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
