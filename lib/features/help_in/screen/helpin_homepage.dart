import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/help_in/services/helpin_services.dart';
import 'package:build_hire_app/features/help_in/widgets/layer/bottom_layer.dart';
import 'package:build_hire_app/model/task.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HelpInHomePage extends StatelessWidget {
  HelpInHomePage({Key? key}) : super(key: key);

  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescController = TextEditingController();
  final TextEditingController taskLocationController = TextEditingController();
  final TextEditingController taskRewardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            BottomLayer.buildBottomLayer(context),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Positioned(
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    padding: const EdgeInsets.only(top: 15),
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColor.primaryGreen(),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            'Jl. Kutisari Sel. XIII No.46, Kutisari, Kec. Tenggiliss',
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.header3(
                                fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.primaryPurple(),
                  ),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Add your task now and get your help!",
                        style: AppTextStyle.header(
                            fontSize: 20, color: Colors.white),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 15, bottom: 0),
                        child: Text(
                          "Add Task",
                          style: AppTextStyle.header3(
                              fontSize: 16, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: _buildField("Task Name", taskNameController),
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: _buildField(
                              "Task Description", taskDescController)),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: _buildField(
                              "Task Location", taskLocationController)),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: _buildField(
                              "Task Reward", taskRewardController,
                              inputType: TextInputType.number)),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: Material(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Task task = Task(
                                  taskOwnerID:
                                      FirebaseAuth.instance.currentUser!.uid,
                                  taskName: taskNameController.text,
                                  taskDescription: taskDescController.text,
                                  taskLocation: taskLocationController.text,
                                  taskCategory: "",
                                  taskReward:
                                      int.parse(taskRewardController.text));

                              TaskService.addTask(task);

                              taskNameController.text = "";
                              taskDescController.text = "";
                              taskLocationController.text = "";
                              taskRewardController.text = "";
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.primaryGrey(),
                              ),
                              child: Text(
                                "Add ",
                                textAlign: TextAlign.center,
                                style: AppTextStyle.header3(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField _buildField(String hintText, TextEditingController controller,
      {TextInputType inputType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(color: Colors.white, fontSize: 13),
      cursorColor: Colors.white,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: AppColor.secondaryGrey(opacity: 0.5))),
          focusColor: Colors.white,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          fillColor: Colors.white,
          hoverColor: Colors.white,
          isDense: true,
          hintText: hintText,
          hintStyle: AppTextStyle.body(color: AppColor.secondaryGrey())),
    );
  }
}
