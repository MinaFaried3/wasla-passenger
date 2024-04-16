import 'package:wasla/app/shared/common/common_libs.dart';

final class HomeContentItem extends Equatable {
  final String title;
  final Widget body;

  const HomeContentItem({required this.title, required this.body});

  @override
  List<Object> get props => [title, body];
}
