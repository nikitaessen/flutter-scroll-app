import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_scroll_app/assets/assets.gen.dart';
import 'package:flutter_scroll_app/assets/fonts.gen.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  await loadFonts();

  return testMain();
}

Future<void> loadFonts() async {
  final fontList = ScrollAppAssets.fonts.values.map((path) {
    return File(path)
        .readAsBytes()
        .then((bytes) => ByteData.view(Uint8List.fromList(bytes).buffer));
  }).toList();

  final fontLoader = FontLoader(FontFamily.archivoBlack);
  for (final font in fontList) {
    fontLoader.addFont(font);
  }

  await fontLoader.load();
}
