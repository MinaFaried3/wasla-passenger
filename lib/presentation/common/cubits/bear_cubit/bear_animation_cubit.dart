import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/common/rive_controller.dart';

part 'bear_animation_cubit.freezed.dart';
part 'bear_animation_state.dart';

class BearAnimationCubit extends Cubit<BearAnimationState> {
  late final RiveControllerManager riveController;

  BearAnimationCubit(this.riveController)
      : super(const BearAnimationState.init());

  void loadAndBuildTheAnimation() async {
    if (riveController.riveArtBoard == null) {
      _buildTheAnimation();
      return;
    }

    emit(const BearAnimationState.loadedSuccessfully());
  }

  void _buildTheAnimation() {
    //loading
    emit(const BearAnimationState.loading());

    //assets loaded before
    if (riveController.riveArtBoard != null) {
      emit(const BearAnimationState.loadedSuccessfully());
      return;
    }

    //if not load it now
    rootBundle.load(AssetsProvider.bear).then((data) {
      final file = RiveFile.import(data);

      final artBoard = file.mainArtboard;

      riveController.riveArtBoard = artBoard;
      riveController.addState(BearState.idle);

      emit(const BearAnimationState.loadedSuccessfully());
    }).catchError((error) {
      PrintManager.print(
          "ERROR => on loading Bear login animation ______________ ${error.toString()}");

      emit(const BearAnimationState.error());
    });
  }
}
