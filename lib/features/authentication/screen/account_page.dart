import 'package:build_hire_app/app_theme/app_color.dart';
import 'package:build_hire_app/app_theme/app_textstyle.dart';
import 'package:build_hire_app/features/authentication/provider/account_provider.dart';
import 'package:build_hire_app/features/authentication/widget/new_form/account_form.dart';
import 'package:build_hire_app/utilities/routing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountPage extends ConsumerWidget {
  AccountPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController professionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () => AppRouter.back(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  InkWell(
                    onTap: () => ref
                        .read(accountEditableNotifierProvider.notifier)
                        .setEditable(),
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColor.primaryBlue(),
                          fontSize: 16),
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  radius: 60,
                  child: ClipOval(
                    child: Image.network(
                      FirebaseAuth.instance.currentUser!.photoURL != null
                          ? FirebaseAuth.instance.currentUser!.photoURL
                              as String
                          : 'https://firebasestorage.googleapis.com/v0/b/build-hire.appspot.com/o/blank-profile-picture-973460__480.webp?alt=media&token=4a067a06-2e54-415c-a0ad-5adfb5d5d1a2',
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 30),
                  child: Text(
                    FirebaseAuth.instance.currentUser!.displayName as String,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.header(fontSize: 20),
                  )),
              Container(
                  margin: const EdgeInsets.only(bottom: 0),
                  child: AccountTextField(
                    label: "Email",
                    controller: emailController,
                    content: FirebaseAuth.instance.currentUser!.email as String,
                  )),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('email',
                          isEqualTo: FirebaseAuth.instance.currentUser!.email)
                      .snapshots(),
                  builder: (_, snapshot) => TextFormField(
                        decoration: InputDecoration(
                            enabled: ref.watch(accountEditableNotifierProvider),
                            hintText: snapshot.data!.docs
                                .elementAt(0)
                                .data()['phoneNumber']),
                        controller: phoneController,
                      )),
              AccountTextField(
                  label: "Profession",
                  content: "",
                  controller: professionController),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: ref.watch(accountEditableNotifierProvider)
                      ? InkWell(
                          onTap: () async {
                            var query = FirebaseFirestore.instance
                                .collection('users')
                                .where('email',
                                    isEqualTo: FirebaseAuth
                                        .instance.currentUser!.email);

                            var querySnapshot = await query.get();

                            for (var snapshot in querySnapshot.docs) {
                              var docID = snapshot.id;

                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(docID)
                                  .update(
                                      {'phoneNumber': phoneController.text});
                            }

                            ref
                                .read(accountEditableNotifierProvider.notifier)
                                .setEditable();
                          },
                          child: Text("Save"))
                      : Container())
            ],
          ),
        ),
      ),
    );
  }
}
