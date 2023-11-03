import 'package:dio/dio.dart';

import '../../../../../core/utils/constants.dart';

class NewsApiProvider {
  final Dio _dio = Dio();
  var apiKey = Constants.apiKey;

  // news article api call
  Future<dynamic> getNews() async {
    var response =
        await _dio.get('${Constants.baseUrl}/top-headlines', queryParameters: {
      'country': 'us',
      'category': 'general',
      'apiKey': apiKey,
    });
    return response;
  }
}
