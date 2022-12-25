// ignore_for_file: non_constant_identifier_names

import 'package:build_hire_app/features/authentication/provider/password_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormWidget {
  TextFormField NormalFormField(TextEditingController controller,
      String hintText, IconData? iconData, onValueChanged) {
    return TextFormField(
      controller: controller,
      onChanged: onValueChanged,
      style: TextStyle(fontSize: 12),
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          prefixIcon: Icon(iconData),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  TextFormField NormalFormFieldWithoutPrefix(
      TextEditingController controller, String hintText, onValueChanged) {
    return TextFormField(
      controller: controller,
      onChanged: onValueChanged,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
    );
  }

  ChangeNotifierProvider<PasswordProvider> PasswordFormField(
    TextEditingController controller,
    String hintText,
    IconData iconData,
    onValueChanged,
  ) {
    return ChangeNotifierProvider<PasswordProvider>(
      create: (context) => PasswordProvider(),
      child: Consumer<PasswordProvider>(
        builder: (context, provider, _) => TextFormField(
          controller: controller,
          onChanged: onValueChanged,
          obscureText: provider.isObscure,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 12),
              prefixIcon: Icon(iconData),
              suffixIcon: InkWell(
                onTap: () => provider.switchObscure(_),
                child: Icon(
                  provider.isObscure ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        ),
      ),
    );
  }

  ChangeNotifierProvider<PasswordProvider> PasswordFormFieldWithoutPrefix(
    TextEditingController controller,
    String hintText,
    onValueChanged,
  ) {
    return ChangeNotifierProvider<PasswordProvider>(
      create: (context) => PasswordProvider(),
      child: Consumer<PasswordProvider>(
        builder: (context, provider, _) => TextFormField(
          controller: controller,
          onChanged: onValueChanged,
          obscureText: provider.isObscure,
          style: TextStyle(fontSize: 12),
          decoration: InputDecoration(
              isDense: true,
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 12),
              suffixIcon: InkWell(
                onTap: () => provider.switchObscure(_),
                child: Icon(
                  provider.isObscure ? Icons.visibility : Icons.visibility_off,
                  size: 20,
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        ),
      ),
    );
  }
}
