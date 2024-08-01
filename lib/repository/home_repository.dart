import 'package:flutter_mvvm_getx/data/network/base_api_services.dart';
import 'package:flutter_mvvm_getx/data/network/network_api_services.dart';
import 'package:flutter_mvvm_getx/model/user_list_model.dart';

import '../res/url/app_urls.dart';

class HomeRepository {
  final BaseApiServices _network = NetworkApiServices();

  Future<UserListModel> getUserList() async {
    try {
      final response =
      await _network.getGetApiResponse(AppUrls.userListEndPoint);
      return UserListModel.fromJson(response);
    } catch (e) {
      rethrow; //Big Brain
    }
  }
}
