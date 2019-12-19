import 'package:flutter_driver/flutter_driver.dart';
import'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class UserisLoggedIn extends GivenWithWorld<FlutterWorld> {
  UserisLoggedIn()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 30));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder talksFeed = find.byValueKey('TalksFeed');
    await FlutterDriverUtils.isPresent(talksFeed, world.driver);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User has logged into the app");

}

class Select_Talk extends WhenWithWorld<FlutterWorld> {
  Select_Talk()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('TalkDetails')); //TODO: CORRIGIR!
    final SerializableFinder talkdetails = find.byValueKey('TalkDetails');
    await FlutterDriverUtils.isPresent(talkdetails, world.driver);

    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User selects a Talk");

}


class HitsQuestionButton extends AndWithWorld<FlutterWorld> {
  HitsQuestionButton() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('QuestionButton'));

    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits Question Button");
}


class CanMakeQuestion extends ThenWithWorld<FlutterWorld> {
  CanMakeQuestion()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 20));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder writeQuestion = find.byValueKey('WriteQuestion');
    await FlutterDriverUtils.isPresent(writeQuestion, world.driver);  return null;
  }

  @override
  RegExp get pattern => RegExp(r"User can make a question about that Talk");

}
