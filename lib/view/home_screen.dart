import 'package:flutter/material.dart';
import 'package:flutter_mvvm_getx/res/widgets/general_exception_widget.dart';
import 'package:flutter_mvvm_getx/res/widgets/internet_exception_widget.dart';
import 'package:flutter_mvvm_getx/utils/routes/routes_names.dart';
import 'package:flutter_mvvm_getx/view_model/controllers/home_controller.dart';
import 'package:flutter_mvvm_getx/view_model/controllers/user_preference.dart';
import 'package:get/get.dart';

import '../data/response/status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeController homeController = Get.put(HomeController());

  UserPreference userPreference = UserPreference();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getUserListApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Screen"),
          centerTitle: true,
          backgroundColor: Colors.pink,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
              onTap: () {
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteNames.login);
                });
              },
              child: Ink(
                child: const Text("Logout"),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ), body: Obx(() {
      switch (homeController.status.value) {
        case Status.loading:
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.grey,
            ),
          );
        case Status.error:
          return  homeController.error.value=='No Internet'?InternetExceptionWidget(onPress: (){
            homeController.getUserListApi();
          }):GeneralExceptionWidget(onPress: (){
            homeController.getUserListApi();
          });
        case Status.completed:
          return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                        homeController.userList.value.data!
                        [index].firstName.toString()),
                    subtitle: Text(homeController.userList.value.data!
                    [index].email.toString()),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController.userList.value.data!
                      [index].avatar.toString()),
                    ),
                  ),
                );
              });

        default:
          return Container();
      }
    }));
  }
}

