import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenIAmOnTheLoginScreen() {
  return given<FlutterWorld>(
    'I am on the landing page',
    (context) async {},
  );
}

StepDefinitionGeneric thenIShouldSeeThe() {
  return then1<String, FlutterWorld>(
    'I should see the {string}',
    (key, context) async {
      final locator = find.byValueKey(key);
      context.expect(locator.serialize().isNotEmpty, true);
    },
  );
}

StepDefinitionGeneric thenIShouldSeeTheText() {
  return then1<String, FlutterWorld>(
    'I should see the {string} text',
    (key, context) async {
      final locator = find.text(key);
      context.expect(locator.serialize().isNotEmpty, true);
    },
  );
}

// click by key
StepDefinitionGeneric whenIClickThe() {
  return when1<String, FlutterWorld>(
    'I click the {string}',
    (key, context) async {
      final locator = find.byValueKey(key);
      await FlutterDriverUtils.tap(context.world.driver, locator);
    },
  );
}

// click by text
StepDefinitionGeneric whenIClickTheText() {
  return when1<String, FlutterWorld>(
    'I click the {string} text',
    (text, context) async {
      // context.world.driver.wa
      final locator = find.text(text);
      // context.world.driver.waitForTappable(finder)

      final test =
          find.ancestor(of: locator, matching: find.byType("ElevatedButton"));

      print(locator);
      print(test);
      // await FlutterDriverUtils.tap(
      //   context.world.driver,
      //   locator,
      // );
    },
  );
}
