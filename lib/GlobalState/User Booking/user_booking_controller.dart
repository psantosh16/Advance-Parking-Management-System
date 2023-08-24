import 'package:apms_project/GlobalState/User%20Booking/user_booking.dart';
import 'package:get/get.dart';


class UserBookingController extends GetxController {
  List<UserBooking> _userBookings = <UserBooking>[].obs;

  List<UserBooking> get getUserBookings => _userBookings;

  set setUserBookings(List<UserBooking> value) {
    _userBookings = value;
  }

  // Fetch user bookings from an API or other source and update the list
  void fetchUserBookings() async {
    // Fetch logic here...
    // setUserBookings = fetchedUserBookings; // Update the list
    setUserBookings = [UserBooking( 'John' ,123, 'B-1'),..._userBookings];
  }

}
