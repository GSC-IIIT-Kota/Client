import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/appbar/appbar.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/primary_ngo_container.dart';
import 'package:solution_challenge/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:solution_challenge/common/widgets/education/videos/video_card.dart';
import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
import 'package:solution_challenge/common/widgets/ngo/event_card.dart';
import 'package:solution_challenge/common/widgets/ngo/organization_card.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

import '../../../models/education/video.dart';
import '../education/articles/home_article_card.dart';

class PViewAllScreen extends StatelessWidget {
  const PViewAllScreen({super.key, required this.initiativeType});

  final String initiativeType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PPrimaryNgoContainer(
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  /// Appbar
                  PAppBar(
                    showBackArrow: true,
                    title: Text(
                      initiativeType,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  PSearchContainer(
                    text: 'Search $initiativeType',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2,
                  ),
                ],
              ),
            ),

            ///Body
            if (initiativeType == 'Campaigns')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    PCampaignCard(
                      title: "Help these kids get money to study",
                      description:
                          "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                      raisedMoney: 2000,
                      totalGoal: 4000,
                      imageUrl: TImages.banner1Image,
                      orgPhoto:
                          'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      cardWidth: PHelperFunctions.screenWidth(),
                      rightMargin: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    PCampaignCard(
                      title: "Help these kids get money to study",
                      description:
                          "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
                      raisedMoney: 2000,
                      totalGoal: 4000,
                      imageUrl: TImages.banner1Image,
                      orgPhoto:
                          'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      cardWidth: PHelperFunctions.screenWidth(),
                      rightMargin: EdgeInsets.zero,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

            if (initiativeType == 'Videos')
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    PVideoCard(
                      video: Video(
                          id: '2',
                          title: 'Video 2',
                          uploader: 'Uploader 2',
                          uploadDate: DateTime.now(),
                          description: 'Description 2',
                          tags: ['Tag 3', 'Tag 4'],
                          category: 'Category 2',
                          thumbnailUrl: 'Thumbnail 2',
                          comments: [],
                          likes: 20,
                          transcripts: 'Transcripts 2'),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    PVideoCard(
                        video: Video(
                            id: '2',
                            title: 'Video 2',
                            uploader: 'Uploader 2',
                            uploadDate: DateTime.now(),
                            description: 'Description 2',
                            tags: ['Tag 3', 'Tag 4'],
                            category: 'Category 2',
                            thumbnailUrl: 'Thumbnail 2',
                            comments: [],
                            likes: 20,
                            transcripts: 'Transcripts 2')),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

            if (initiativeType == 'Articles')
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    PHomeArticleCard(
                      articleImg: TImages.banner4Image,
                      articleCategory: 'Menstrual Hygiene',
                      readingTime: '7 min',
                      uploadTime: '2d ago',
                      articleTitle:
                          'Downside of using reusable pads during menstrual cycles',
                      hasAuthor: false,
                      articleAuthor: 'Admin',
                      articleContent:
                          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
                    ),
                    PHomeArticleCard(
                      articleImg: TImages.banner4Image,
                      articleCategory: 'Menstrual Hygiene',
                      readingTime: '7 min',
                      uploadTime: '2d ago',
                      articleTitle:
                          'Downside of using reusable pads during menstrual cycles',
                      hasAuthor: false,
                      articleAuthor: 'Admin',
                      articleContent:
                          'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ',
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

            if (initiativeType == 'Events')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    PEventCard(
                      eventDate: '26th February, 2024',
                      eventDayTime: 'Wednesday 9AM',
                      eventTitle: 'Buy me pad, donation event annual for women',
                      eventLocation: 'St. Petersberg College',
                      eventDesc:
                          'Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
                      eventPhoto: TImages.banner2Image,
                      cardWidth: PHelperFunctions.screenWidth(),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    PEventCard(
                      eventDate: '26th February, 2024',
                      eventDayTime: 'Wednesday 9AM',
                      eventTitle: 'Buy me pad, donation event annual for women',
                      eventLocation: 'St. Petersberg College',
                      eventDesc:
                          'Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
                      eventPhoto: TImages.banner2Image,
                      cardWidth: PHelperFunctions.screenWidth(),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                  ],
                ),
              ),

            if (initiativeType == 'Organizations')
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  children: [
                    POrganizationCard(
                      cardWidth: PHelperFunctions.screenWidth(),
                      orgPhoto:
                          'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      ngoName: 'NGO for Women',
                      ngoLocation: 'Rajasthan, India',
                      id: '',
                      email: '',
                      passwordHash: '',
                      campaigns: const [],
                      events: const [],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    POrganizationCard(
                      cardWidth: PHelperFunctions.screenWidth(),
                      orgPhoto:
                          'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
                      ngoName: 'NGO for Women',
                      ngoLocation: 'Rajasthan, India',
                      id: '',
                      email: '',
                      passwordHash: '',
                      campaigns: const [],
                      events: const [],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
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
