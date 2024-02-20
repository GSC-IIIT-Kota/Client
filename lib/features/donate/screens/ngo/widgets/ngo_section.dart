// import 'package:flutter/material.dart';
// import 'package:solution_challenge/common/widgets/ngo/campaign_card.dart';
// import 'package:solution_challenge/common/widgets/ngo/organization_card.dart';
// import 'package:solution_challenge/common/widgets/texts/section_heading.dart';
// import 'package:solution_challenge/features/donate/screens/ngo/widgets/viewall_cards.dart';
// import 'package:solution_challenge/utils/constants/image_strings.dart';
// import 'package:solution_challenge/utils/helpers/helper_functions.dart';
// import 'package:get/get.dart';
//
// import '../../../../../common/widgets/ngo/event_card.dart';
//
// class PNgoSection extends StatelessWidget {
//   const PNgoSection({
//     super.key,
//     required this.sectionHeading,
//     required this.initiativeType,
//     required this.cardHeight,
//   });
//
//   final String sectionHeading;
//   final String initiativeType;
//   final double cardHeight;
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//
//     return Column(
//       children: [
//         PSectionHeading(
//           title: sectionHeading,
//           textColor: dark ? Colors.white : Colors.black,
//           onPressed: () => Get.to(() => PNgoViewAllScreen(
//                 initiativeType: initiativeType,
//               )),
//         ),
//         SizedBox(
//           height: cardHeight,
//           child: ListView.builder(
//             itemCount: 4,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (_, index) {
//               if (initiativeType == 'Campaigns') {
//                 return const PCampaignCard(
//                   cardWidth: 250,
//                   title: "Help these kids get money to study",
//                   description:
//                       "This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids. This org has description. It works for female children to get paid for their work. And the org is working really hard to get money for these kids.",
//                   raisedMoney: 2000,
//                   totalGoal: 4000,
//                   imageUrl: TImages.banner1Image,
//                   orgPhoto:
//                       'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
//                 );
//               } else if (initiativeType == 'Organizations') {
//                 return const POrganizationCard(
//                     cardWidth: 250,
//                     orgPhoto:
//                         'https://pbs.twimg.com/profile_images/1601849162730905601/IskNG8bF_400x400.jpg',
//                     ngoName: 'NGO for Women',
//                     ngoLocation: 'Rajasthan, India');
//               } else if (initiativeType == 'Events') {
//                 return const PEventCard(
//                   eventDate: '25th February, 2024',
//                   eventDayTime: 'Wednesday 9AM',
//                   eventTitle: 'Buy me pad, donation event annual for women',
//                   eventLocation: 'St. Petersberg College',
//                   eventDesc:
//                       'Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsumLorem ipsum',
//                   eventPhoto: TImages.banner2Image,
//                   cardWidth: 300,
//                 );
//               } else {
//                 // Return a default widget or null if initiativeType is none of the above
//                 return const SizedBox.shrink();
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
