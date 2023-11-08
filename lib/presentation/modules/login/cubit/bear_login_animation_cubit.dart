import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:wasla/domain/models/login_models/rive_controller.dart';
import 'package:wasla/presentation/resources/common/common_libs.dart';
import 'package:wasla/presentation/resources/managers/animation_enum.dart';

part 'bear_login_animation_state.dart';

class BearLoginAnimationCubit extends Cubit<BearLoginAnimationState> {
  late final RiveControllerManager riveController;

  BearLoginAnimationCubit(this.riveController)
      : super(BearLoginAnimationInitial());

  void loadAndBuildTheAnimation() async {
    await rootBundle.load('assets/animation/rive/login_bear.riv').then((data) {
      final file = RiveFile.import(data);

      final artBoard = file.mainArtboard;

      artBoard.addController(riveController.states[LoginBearStates.idle]!);

      riveController.riveArtBoard = artBoard;

      emit(BearAssetLoaded());
    }).catchError((error) {
      PrintManager.printColoredText(
          "ERROR  ______________ ${error.toString()}");
    });
  }
}
