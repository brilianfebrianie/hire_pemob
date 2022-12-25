import 'package:build_hire_app/features/authentication/provider/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountTextField extends ConsumerWidget {
  const AccountTextField(
      {Key? key,
      required this.label,
      required this.content,
      required this.controller})
      : super(key: key);

  final String label;
  final String content;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            label,
            style: const TextStyle(fontSize: 13),
          ),
        ),
        const Expanded(
          flex: 1,
          child: Text(":"),
        ),
        Expanded(
            flex: 8,
            child: TextFormField(
              enabled: ref.watch(accountEditableNotifierProvider),
              decoration: InputDecoration(
                  hintText: content,
                  hintStyle: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500)),
            ))
      ],
    );
  }
}
