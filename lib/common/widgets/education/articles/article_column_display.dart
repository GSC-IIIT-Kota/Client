import 'package:flutter/material.dart';
import '../../../../models/education/articles.dart';
import '../../../../services/education/article_service.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'home_article_column.dart';

class ArticleColumnBuilder extends StatefulWidget {
  const ArticleColumnBuilder({super.key});

  @override
  _ArticleColumnBuilderState createState() => _ArticleColumnBuilderState();
}
class _ArticleColumnBuilderState extends State<ArticleColumnBuilder> {
   late Future<List<Article>> _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles = ArticleService.getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);

    return FutureBuilder<List<Article>>(
      future: _futureArticles,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final articles = snapshot.data!;
          final articleGroups = <List<Article>>[];
          for (var i = 0; i < articles.length; i += 3) {
            final end = (i + 3 < articles.length) ? i + 3 : articles.length;
            articleGroups.add(articles.sublist(i, end));
          }
          return ListView.builder(
            itemCount: articleGroups.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return PHomeArticleColumn(articles: articleGroups[index]);
            },
          );
        }
      },
    );
  }
}