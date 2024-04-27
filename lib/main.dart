import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/injection_module.dart';
import 'package:flutter_scroll_app/presentation/widget/app_root.dart';

void main() {
  registerDependencies();
  runApp(const AppRoot());
}
