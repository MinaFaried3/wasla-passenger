import 'package:wasla/app/shared/common/common_libs.dart';
import 'package:wasla/presentation/modules/home/home/model/home_content_item.dart';
import 'package:wasla/presentation/modules/home/location/location_body.dart';
import 'package:wasla/presentation/modules/home/main/main_body.dart';
import 'package:wasla/presentation/modules/home/my_tickets/my_tickets_body.dart';
import 'package:wasla/presentation/modules/home/profile/profile_body.dart';
import 'package:wasla/presentation/modules/home/search_trip/search_trip_body.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial(_searchTripContent));

  static const HomeContentItem _mainContent = HomeContentItem(
    title: AppStrings.main,
    body: MainBody(),
  );
  static const HomeContentItem _locationContent = HomeContentItem(
    title: AppStrings.location,
    body: LocationBody(),
  );
  static const HomeContentItem _searchTripContent = HomeContentItem(
    title: AppStrings.searchTrip,
    body: SearchTripBody(),
  );
  static const HomeContentItem _myTicketsContent = HomeContentItem(
    title: AppStrings.myTickets,
    body: MyTicketsBody(),
  );
  static const HomeContentItem _profileContent = HomeContentItem(
    title: AppStrings.profile,
    body: ProfileBody(),
  );

  final List<HomeContentItem> homeContentItems = const [
    _mainContent,
    _locationContent,
    _searchTripContent,
    _myTicketsContent,
    _profileContent,
  ];

  void changeBodyContent(int idx) {
    emit(HomeState.changeBodyContent(homeContentItems[idx]));
  }
}
