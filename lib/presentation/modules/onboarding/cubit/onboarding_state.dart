part of 'onboarding_cubit.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
}

class OnboardingInitial extends OnboardingState {
  final OnboardingPages onboardingPages;

  OnboardingInitial({required this.onboardingPages});

  @override
  List<Object> get props => [onboardingPages];
}
