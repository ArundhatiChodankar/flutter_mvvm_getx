import 'package:flutter_mvvm_getx/data/response/status.dart';
import 'package:flutter_mvvm_getx/model/user_list_model.dart';
import 'package:flutter_mvvm_getx/repository/home_repository.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();

  final status = Status.loading.obs;
  final userList = UserListModel().obs;
  final error = ''.obs;

  void setStatus(value) {
    status.value = value;
  }

  setUserList(value) {
    userList.value = value;
  }

  setError(value) {
    error.value = value;
  }

  void getUserListApi() {
    homeRepository.getUserList().then((value) {
      setStatus(Status.completed);
      setUserList(value);
    }).onError((error, stackTrace) {
      setStatus(Status.error);
      setError(error);
    });
  }
}
