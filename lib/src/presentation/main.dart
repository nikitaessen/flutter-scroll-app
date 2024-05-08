import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/src/presentation/injection_module.dart';
import 'package:flutter_scroll_app/src/presentation/widget/app_root.dart';

void main() {
  registerDependencies();
  runApp(const AppRoot());
}
