import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric GivenIAmOnTheLoginScreen() {
  return given<FlutterWorld>(
    'I am on the landing page',
    (context) async {},
  );
}

StepDefinitionGeneric ThenIShouldSeeTheLoginButton() {
  return then<FlutterWorld>(
    "I should see the Login button",
    (context) async {
      final locator = find.byValueKey("Login");
      context.expect(locator.serialize().isNotEmpty, true);
    },
  );
}
