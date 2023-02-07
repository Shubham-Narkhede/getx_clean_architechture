import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../domain/controllers/AppController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("test"),
      ),
      body: GetBuilder<AppController>(
        // id: "Test",
        // init: AppController(),
        // initState: (){},
        builder: (v) {
          return v.isLoadingNormal == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : v.listUserNormal.isEmpty
                  ? const Text("NUll")
                  : ListView.builder(
                      itemBuilder: (_, int index) {
                        return Container(
                          child: Text(v.listUserNormal[index].name!),
                        );
                      },
                      itemCount: v.listUserNormal.length,
                    );
        },
      ),

      // Obx(() {
      //   return Utils.getAppController.isLoading == RxBool(true)
      //       ? const Center(
      //           child: CircularProgressIndicator(),
      //         )
      //       : Utils.getAppController.listUser.isEmpty
      //           ? const Text("NUll")
      //           : ListView.builder(
      //               itemBuilder: (_, int index) {
      //                 return Container(
      //                   child:
      //                       Text(Utils.getAppController.listUser[index].name),
      //                 );
      //               },
      //               itemCount: Utils.getAppController.listUser.length,
      //             );
      // }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AppController().postData();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
