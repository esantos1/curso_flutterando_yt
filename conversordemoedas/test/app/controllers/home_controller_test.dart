import 'package:conversordemoedas/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('deve converter de real pra dolar', () {
    toText.text = '2.0';
    homeController.convert();
    expect(fromText, 0.36);
  });
}
