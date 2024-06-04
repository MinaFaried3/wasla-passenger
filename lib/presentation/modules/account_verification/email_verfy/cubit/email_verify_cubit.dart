import 'dart:ffi';

import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/domain/usecases/verification_usecase/confirm_email_usecase.dart';
import 'package:wasla/domain/usecases/verification_usecase/send_verification_email_usecase.dart';

part 'email_verify_cubit.freezed.dart';
part 'email_verify_state.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit({
    required this.sendVerificationEmailUseCase,
    required this.confirmEmailUseCase,
  }) : super(const EmailVerifyState.initial());

  final SendVerificationEmailUseCase sendVerificationEmailUseCase;
  final ConfirmEmailUseCase confirmEmailUseCase;

  void sendVerificationEmail() async {
    emit(const EmailVerifyState.sendingEmailLoadingState());

    final result = await sendVerificationEmailUseCase(Void);

    result.fold((l) => emit(EmailVerifyState.sendingEmailErrorState(l.message)),
        (r) => emit(const EmailVerifyState.sendingEmailSuccessState()));
  }

  void confirmEmail({required String verifyCode}) async {
    PrintManager.print(verifyCode, color: ConsoleColor.brightCyanBg);
    emit(const EmailVerifyState.confirmEmailLoadingState());

    final result = await confirmEmailUseCase(verifyCode);

    result.fold((l) => emit(EmailVerifyState.confirmEmailErrorState(l.message)),
        (r) => emit(EmailVerifyState.confirmEmailSuccessState(r.message)));
  }
}
