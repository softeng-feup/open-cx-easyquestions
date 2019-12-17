import 'package:flutter_driver/flutter_driver.dart';
import'package:gherkin/gherkin.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';

class CheckEmail extends GivenWithWorld<FlutterWorld> {
  CheckEmail() : super (StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async{
    String email = "admin@gmail.com";
    await FlutterDriverUtils.enterText(world.driver, find.byValueKey('email'), email);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User inserts an email");
}


class CheckPassword extends AndWithWorld<FlutterWorld> {
  CheckPassword() : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
    String password = "adminadmin";
    await FlutterDriverUtils.enterText(world.driver, find.byValueKey('password'), password);
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User inserts a password");
}

class HitLoginButton extends WhenWithWorld<FlutterWorld> {
  HitLoginButton()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 10));

  @override
  Future<void> executeStep() async {
   await FlutterDriverUtils.tap(world.driver, find.byValueKey('LOGIN'));
    return null;
  }

  @override
  RegExp get pattern => RegExp(r"User hits LOGIN button");
}


class UserLoggedIn extends ThenWithWorld<FlutterWorld> {
  UserLoggedIn()
      : super(StepDefinitionConfiguration()..timeout = Duration(seconds: 20));
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