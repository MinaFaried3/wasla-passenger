import 'package:flutter_test/flutter_test.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/app/wasla.dart';

void main() {
  late final WaslaApp waslaApp1;
  late final WaslaApp waslaApp2;

  setUp(() {
    waslaApp1 = WaslaApp(
      route: Routes.startNowRoute,
    );
    waslaApp2 = WaslaApp(
      route: Routes.startNowRoute,
    );
  });
  test("test if wasla app object if singleton or not", () {
    //arrange

    //act
    bool isEqual = waslaApp1 == waslaApp2;

    //assert
    expect(true, isEqual);
  });
}
