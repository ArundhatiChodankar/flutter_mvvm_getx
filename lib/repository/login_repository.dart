import 'package:flutter_mvvm_getx/data/network/base_api_services.dart';
import 'package:flutter_mvvm_getx/data/network/network_api_services.dart';

import '../res/url/app_urls.dart';

class LoginRepository {
  final BaseApiServices _network = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      final response =
          await _network.getPostApiResponse(AppUrls.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow; //Big Brain
    }
  }
}
