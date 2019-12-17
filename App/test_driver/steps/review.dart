
import 'package:flutter_driver/flutter_driver.dart';
import'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class UserIsLoggedIn extends GivenWithWorld<FlutterWorld> {
  UserIsLoggedIn()
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

class SelectTalk extends WhenWithWorld<FlutterWorld> {
  SelectTalk()
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


class HitsReviewButton extends AndWithWorld<FlutterWorld> {
  HitsReviewButton() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.tap(world.driver, find.byValueKey('ReviewButton'));

    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits Review Button");
}


class CanMakeReview extends ThenWithWorld<FlutterWorld> {
  CanMakeReview()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 20));

  @override
  Future<void> executeStep() async {
    await FlutterDriverUtils.waitForFlutter(world.driver);
    final SerializableFinder writeReview = find.byValueKey('WriteReview');
    await FlutterDriverUtils.isPresent(writeReview, world.driver);  return null;
  }

  @override
  RegExp get pattern => RegExp(r"User can make a review about that Talk");

}
