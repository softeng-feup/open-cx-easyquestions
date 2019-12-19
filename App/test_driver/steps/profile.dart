import 'package:flutter_driver/flutter_driver.dart';
import'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';



class HitsProfileButton extends AndWithWorld<FlutterWorld> {
  HitsQuestionButton() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('ProfileButton'));

    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits Profile Button");
}

class HitsUpdateButton extends AndWithWorld<FlutterWorld> {
  HitsQuestionButton() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('UpdateButton'));

    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits Update Button");
}


class ProfileUpdated extends ThenWithWorld<FlutterWorld> {
 @override
  Future<void> executeStep() async {

    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder talksFeed = find.byValueKey('TalksFeed');
    await FlutterDriverUtils.isPresent(talksFeed, world.driver);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User is logged in");

}