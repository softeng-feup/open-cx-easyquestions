import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:glob/glob.dart';
import'package:gherkin/gherkin.dart';

import 'steps/login.dart';
import 'steps/review.dart';

Future<void> main(){
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]

    ..stepDefinitions = [
      CheckEmail(), CheckPassword(), HitLoginButton(), UserLoggedIn(), //login.feature
      UserLoggedIn(), SelectTalk(), HitsReviewButton(), CanMakeReview(), //review.feature
    ]

    ..reporters = [ProgressReporter(), TestRunSummaryReporter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/app.dart"
    ..exitAfterTestRun = true;
  return GherkinRunner().execute(config);
}