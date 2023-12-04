part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  final OnboardingPages onboardingPages;

  const OnboardingInitial({required this.onboardingPages});

  @override
  List<Object> get props => [onboardingPages];
}

///------------------------------------------------------------

abstract class OnChangeOnBoardingPageState extends Equatable {
  final int index;

  const OnChangeOnBoardingPageState({required this.index});
}

class OnChangeOnBoardingPage extends OnChangeOnBoardingPageState {
  const OnChangeOnBoardingPage({required super.index});

  @override
  List<Object> get props => [index];
}
