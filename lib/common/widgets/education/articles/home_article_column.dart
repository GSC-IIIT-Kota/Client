import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/education/articles/home_article_card.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';

class PHomeArticleColumn extends StatelessWidget {
  const PHomeArticleColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: TColors.satin,
      ),
      child: const Column(
        children: [
          PHomeArticleCard(),
          PHomeArticleCard(),
          PHomeArticleCard(),
        ],
      ),
    );
  }
}
