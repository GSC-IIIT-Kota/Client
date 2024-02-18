import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/education/articles/home_article_card.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';

class PHomeArticleColumn extends StatelessWidget {
  const PHomeArticleColumn({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.myblack : TColors.satin,
      ),
      child: const Column(
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

        ],
      ),
    );
  }
}
