import 'package:dio/dio.dart';
import 'package:sports_app/data/models/get_countries_mpdel.dart';

class GetCountriesRep {
  static const apiKey =
      '3b57cc9afee4cbfcad963d3de7ede1ffd441cfb9f3c73ed6c645bd4e160a0b79';
  static const apiUrl =
      'https://apiv2.allsportsapi.com/football/?met=Countries&APIkey=$apiKey';

  final dio = Dio();

  Future<List<GetCountryModel>> getcountries() async {
    final response = await dio.get(apiUrl);
    if (response.statusCode == 200) {
      List<GetCountryModel> responseModel = response.data["result"]
          .map<GetCountryModel>(
              (e) => GetCountryModel.fromJson(e as Map<String, dynamic>))
          .toList();

      return responseModel;
    } else {
      throw DioException(
          requestOptions: response.requestOptions,
          message: response.statusMessage);
    }
  }
}
