import 'package:flutter/material.dart';
import 'package:solution_challenge/common/widgets/education/articles/home_article_card.dart';
import 'package:solution_challenge/utils/constants/colors.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/helpers/helper_functions.dart';
import 'package:solution_challenge/models/education/articles.dart'; // Import the Article model

class PHomeArticleColumn extends StatelessWidget {
  const PHomeArticleColumn({super.key, required this.articles});

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: PHelperFunctions.isDarkMode(context)
            ? TColors.myblack
            : TColors.satin,
      ),
      child: Column(
        children: articles.map((article) {
          return PHomeArticleCard(
            articleImg: article.thumbnailUrl,
            articleCategory: article.category,
            readingTime: "article.readingTime",
            uploadTime: "article.uploadDate",
            articleTitle: article.title,
            hasAuthor: true,
            articleAuthor: article.authorName,
            articleContent: article.content,
          );
        }).toList(),
      ),
    );
  }
}
