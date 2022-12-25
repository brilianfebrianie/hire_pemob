import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountEditableNotifier extends StateNotifier<bool> {
  AccountEditableNotifier() : super(false);

  void setEditable() => state = !state;

  bool getState() => state;
}

final accountEditableNotifierProvider =
    StateNotifierProvider<AccountEditableNotifier, bool>(((ref) {
  return AccountEditableNotifier();
}));
