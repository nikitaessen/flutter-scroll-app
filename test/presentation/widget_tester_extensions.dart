import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

extension AwaitImages on WidgetTester {
  Future<void> awaitImages() async {
    await runAsync(
      () async {
        for (final element in find.byType(Image).evaluate()) {
          final widget = element.widget as Image;
          final image = widget.image;
          await precacheImage(image, element);
          await pumpAndSettle();
        }
      },
    );
  }
}
