import 'package:teachme/data/models/unversal_data.dart';
import 'package:teachme/services/api_service/api_service.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<UniversalData> getAllArticles() async =>
      await apiService.getAllArticles();

  Future<UniversalData> getArticleById(int id) async =>
      await apiService.getArticleById(id);
}