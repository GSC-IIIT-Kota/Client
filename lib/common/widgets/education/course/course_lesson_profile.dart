import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/images/rounded_image.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class PLessonProfile extends StatefulWidget {
  const PLessonProfile(
      {super.key,
      this.isVideo = false,
      this.videoUrl = '',
      this.isArticle = false,
      required this.lessonTitle,
      required this.lessonCategory,
      required this.lessonAuthor,
      required this.lessonDescription,
      this.lessonThumbnail = 'https://d1ymz67w5raq8g.cloudfront.net/Pictures/480xany/3/8/9/511389_gettyimages808994144_462043.jpg'});

  final bool isVideo;
  final String videoUrl;
  final bool isArticle;
  final String lessonThumbnail;
  final String lessonTitle;
  final String lessonCategory;
  final String lessonAuthor;
  final String lessonDescription;

  @override
  State<PLessonProfile> createState() => _PLessonProfileState();
}

class _PLessonProfileState extends State<PLessonProfile> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoID != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoID,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ),
      );
    } else {
      // Handle the case when the video ID is null
      // You can show an error message or take appropriate action here
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const PAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            children: [
              if (widget.isVideo)
                PRoundedContainer(
                  backgroundColor: Colors.white,
                  child: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: const ProgressBarColors(
                          playedColor: TColors.brightpink,
                          handleColor: TColors.accent,
                        ),
                      ),
                      const PlaybackSpeedButton(),
                      FullScreenButton(),
                    ],
                  ),
                ),
              if (widget.isArticle)
                PRoundedImage(isNetworkImage: true,imageUrl: widget.lessonThumbnail),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PCardIconText(
                      iconData: Iconsax.category,
                      iconColor: TColors.rani,
                      iconSize: 14,
                      title: widget.lessonCategory,
                      titleStyle: Theme.of(context).textTheme.labelLarge!.apply(
                            color: TColors.rani,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      widget.lessonTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    PRoundedContainer(
                      borderColor: TColors.rani,
                      backgroundColor: TColors.rani,
                      child: PCardIconText(
                        iconData: Iconsax.user,
                        title: widget.lessonAuthor,
                        titleStyle:
                            Theme.of(context).textTheme.labelLarge!.apply(
                                  color: Colors.white,
                                ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      translatedStrings?[71] ?? 'Description',
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: dark ? TColors.brightpink : TColors.burgandy,
                            fontWeightDelta: 2,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      widget.lessonDescription,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.8)
                                : TColors.dimgrey,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
