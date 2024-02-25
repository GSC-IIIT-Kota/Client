import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:provider/provider.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:solution_challenge/common/widgets/texts/video_card_icontext.dart';
import 'package:solution_challenge/models/education/video.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// import '../../../../utils/provider/userProvider.dart';
import '../../../../utils/datetime/date_time.dart';

class PVideoProfile extends StatefulWidget {
  const PVideoProfile({
    super.key,
    required this.videoCategory,
    required this.uploadTime,
    required this.videoTitle,
    required this.videoUploader,
    required this.videoDescription,
    required this.videoThumbnailUrl,
    required this.videoComments,
    required this.videoLikes,
    required this.videoTranscripts,
    required this.videoUrl,
    required this.videoTags,
  });

  final String videoCategory;
  final String uploadTime;
  final String videoUrl;
  final String videoTitle;
  final String videoUploader;
  final String videoDescription;
  final String videoThumbnailUrl;
  final List<Comment> videoComments;
  final int videoLikes;
  final String videoTranscripts;
  final List<String> videoTags;

  @override
  State<PVideoProfile> createState() => _PVideoProfileState();
}

class _PVideoProfileState extends State<PVideoProfile> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoID = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!, // You can add the initial video ID here
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        backArrowColor: dark ? Colors.white : Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.like_1),
            color: TColors.brightpink,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: Column(
            children: [
              PRoundedContainer(
                backgroundColor: Colors.transparent,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.videoTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    IntrinsicWidth(
                      child: PRoundedContainer(
                        radius: 100,
                        borderColor: TColors.rani,
                        backgroundColor: TColors.rani,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: TSizes.sm / 2, horizontal: TSizes.md),
                          child: PCardIconText(
                            iconData: Iconsax.user,
                            iconSize: 18,
                            iconColor: Colors.white,
                            title: widget.videoUploader,
                            titleStyle: Theme.of(context).textTheme.bodyLarge!.apply(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    PCardIconText(
                      iconData: Iconsax.category,
                      iconColor: dark ? TColors.brightpink : TColors.rani,
                      iconSize: 14,
                      title: widget.videoCategory,
                      titleStyle: Theme.of(context).textTheme.labelLarge!.apply(
                            color: dark ? TColors.brightpink : TColors.rani,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Text(
                      '~ ${calculateTimeSince(widget.uploadTime)}',
                      style: Theme.of(context).textTheme.labelLarge!.apply(
                            color: TColors.battleship,
                          ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Text(
                      translatedStrings?[70] ?? 'Description',
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
                    const SizedBox(height: 20.0),
                    Text(
                      'Likes: ${widget.videoLikes}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.9)
                                : TColors.dimgrey,
                          ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Transcripts: ${widget.videoTranscripts}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.9)
                                : TColors.dimgrey,
                          ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Tags: ${widget.videoTags.join(', ')}',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.9)
                                : TColors.dimgrey,
                          ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Comments (${widget.videoComments.length}):',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? Colors.white.withOpacity(0.9)
                                : TColors.dimgrey,
                          ),
                    ),
                    const SizedBox(height: 10.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.videoComments.length,
                      itemBuilder: (context, index) {
                        final comment = widget.videoComments[index];
                        return ListTile(
                          title: Text(comment.content),
                          trailing: Text(comment.commentDate.toString()),
                        );
                      },
                    ),
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
