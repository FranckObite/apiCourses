import 'api.dart';
import 'package:dio/dio.dart';

class APIService {
  final API api = API();
  final Dio dio = Dio();

  Future<Response> getData(String path, {Map<String, dynamic>? params}) async {
    //construction de l'url
    String _url = api.baseUrl + path;
    //construction des parametres de la requete
    //ces parametre seront presents dans chaque requete
    Map<String, dynamic>? query = {
      'api_key': api.apiKey,
      'language': 'fr-FR',
    };
    if (params != null) {
      query.addAll(params);
    }

    final response = await dio.get(_url, queryParameters: query);

    //on veriefie si la requete c'est bien passée
    if (response.statusCode == 200) {
      return response;
    } else {
      throw response;
    }
  }
}
