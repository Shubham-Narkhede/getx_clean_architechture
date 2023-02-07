import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architechture/TDD/presentation/controllers/userController.dart';

import '../../domain/entities/User.dart';

class ScreenUserDetails extends StatefulWidget {
  @override
  _ScreenUserDetailsState createState() => _ScreenUserDetailsState();
}

class _ScreenUserDetailsState extends State<ScreenUserDetails> {
  UserController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (v) {
                controller.getUserData(v);
              },
            ),
            Expanded(
              child: GetBuilder<UserController>(
                builder: (v) {
                  if (v.listUserNormal == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (v.listUserNormal!.isEmpty &&
                      v.getError.isNotEmpty) {
                    return Center(
                      child: Text(v.getError.toString()),
                    );
                  } else if (v.listUserNormal!.isEmpty && v.getError.isEmpty) {
                    return const Center(
                      child: Text("No Data"),
                    );
                  } else {
                    return ListView.builder(
                      itemBuilder: (_, int index) {
                        User item = v.listUserNormal![index];
                        return Text("${item.name}");
                      },
                      itemCount: v.listUserNormal!.length,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
