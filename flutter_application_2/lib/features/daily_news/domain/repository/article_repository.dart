import 'package:flutter_app3/core/resources/data_state.dart';
import 'package:flutter_app3/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewArticles();
}