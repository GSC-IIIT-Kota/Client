import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PVideoProfile extends StatefulWidget {
  const PVideoProfile({super.key, required this.videoCategory, required this.uploadTime, required this.videoTitle, required this.hasAuthor, required this.videoUploader, required this.videoDescription});

  final String videoCategory;
  final String uploadTime;
  final String videoTitle;
  final bool hasAuthor;
  final String videoUploader;
  final String videoDescription;


  @override
  State<PVideoProfile> createState() => _PVideoProfileState();
}

class _PVideoProfileState extends State<PVideoProfile> {
  final String videoURL = 'https://youtu.be/FBfAD5z-g0Q?si=mS0MR4XA51h_qqUQ';

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
    super.initState();
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
          padding: const EdgeInsets.symmetric(horizontal: TSizes.lg),
          child: Column(
            children: [
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
                        handleColor: TColors.accent
                      ),
                    ),
                    const PlaybackSpeedButton(),
                    FullScreenButton()
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PCardIconText(
                        iconData: Iconsax.category,
                        iconColor: TColors.rani,
                        iconSize: 14,
                        title: widget.videoCategory,
                        titleStyle: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.rani)),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    Text('~ $widget.uploadTime',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.battleship)),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Title
                    Text(
                      widget.videoTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    ///Uploader Name
                    if (widget.hasAuthor)
                      PRoundedContainer(
                        borderColor: TColors.rani,
                        backgroundColor: TColors.rani,
                        child: PCardIconText(
                          iconData: Iconsax.user,
                          title: widget.videoUploader,
                          titleStyle: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: Colors.white),
                        ),
                      ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.titleSmall!.apply(
                        color: dark ? TColors.brightpink : TColors.burgandy,
                        fontWeightDelta: 2,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    Text(
                    widget.videoDescription,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark
                            ? Colors.white.withOpacity(0.8)
                            : TColors.dimgrey,
                      ),
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
