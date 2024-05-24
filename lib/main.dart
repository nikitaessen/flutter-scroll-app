import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/core/injection_module.dart';
import 'package:flutter_scroll_app/core/presentation/app_root.dart';

void main() {
  registerDependencies();
  runApp(const AppRoot());
}
