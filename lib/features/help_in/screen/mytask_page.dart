import 'package:build_hire_app/databases/firebase_database/helpin_database.dart';
import 'package:build_hire_app/features/help_in/widgets/task_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyTaskPage extends StatelessWidget {
  const MyTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/background/mytask_bg.png',
                ),
                Expanded(
                    child: Ink(
                  color: const Color.fromRGBO(204, 209, 229, 1),
                ))
              ],
            ),
          ),
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.white,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: SingleChildScrollView(
                  child: StreamBuilder<QuerySnapshot>(
                stream: HelpInDatabse.tasks
                    .where('ownerUID',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  try {
                    if (snapshot.data?.size != 0) {
                      try {
                        return Column(
                            children: snapshot.data!.docs
                                .map((e) => TaskCard(
                                      taskName: (e.data()
                                          as Map<String, dynamic>)['taskName'],
                                      taskDesc: (e.data()
                                          as Map<String, dynamic>)['taskDesc'],
                                      taskLocation: (e.data() as Map<String,
                                          dynamic>)['taskLocation'],
                                      taskReward: (e.data() as Map<String,
                                              dynamic>)['taskReward']
                                          .toString(),
                                      deleteFunction: () {
                                        HelpInDatabse.tasks.doc(e.id).delete();
                                        print("Deleted");
                                      },
                                    ))
                                .toList());
                      } on Exception catch (e) {
                        return const Align(
                            alignment: Alignment.center,
                            child: Text("You have no tasks"));
                      }
                    } else {
                      return const Align(
                          alignment: Alignment.center,
                          child: Text("You have no tasks"));
                    }
                  } catch (e) {
                    return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());
                  }
                },
              )))
        ],
      ),
    );
  }
}
