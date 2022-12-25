import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  TaskCard(
      {Key? key,
      required this.taskName,
      required this.taskDesc,
      required this.taskLocation,
      required this.taskReward,
      required this.deleteFunction})
      : super(key: key);

  String taskName;
  String taskDesc;
  String taskReward;
  String taskLocation;
  VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.primaryGrey(),
        ),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: AppColor.successColor(opacity: 0.5),
              ),
              width: 120,
              height: 120,
              child: Image.asset(
                  'assets/images/placeholder/education_placeholder.png'),
            ),
            Flexible(
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      taskName,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.header2(fontSize: 20),
                    ),
                    Text(
                      taskDesc,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        taskReward,
                        style: AppTextStyle.body(fontSize: 13),
                      ),
                    ),
                    InkWell(
                        onTap: deleteFunction,
                        child: Icon(Icons.delete_forever))
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
