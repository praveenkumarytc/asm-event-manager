// ignore_for_file: non_constant_identifier_names

class AppConstants {
  static String APP_NAME = 'ASM Event Manager';

  static String DOMAIN_URL = 'http://event.asmbeta.in/api/event_manager/';
  static String BASE_URL = 'http://event.asmbeta.in/api/event_manager/';
  static String IMAGE_BASE_URL_SEMINAR = '${DOMAIN_URL}public/assets/admin/img/event/thumbnail/';
  static String IMAGE_BASE_URL_EVENT = '${DOMAIN_URL}/public/assets/admin/img/event/thumbnail/';
  static String EVENT_DETAIL_BOOTH_IMAGE = '${DOMAIN_URL}public/assets/admin/img/event-gallery/';
  static String SPEAKER_IMAGE_BASE_URL = '${DOMAIN_URL}public/assets/admin/img/event/thumbnail/';
  static String BOOTH_PRODUCT_IMAGE = '${DOMAIN_URL}public/assets/images/';

  static String apiKey = 'cinemaDBSispl2023version2';

  //End_points

  static String getConnectionId = '${BASE_URL}get_connectionid';
  static String loginOtpRequest = '${BASE_URL}getotp';
  static String signupOtpVerify = '${BASE_URL}verify_otp';
  static String booth_listing = '${BASE_URL}booths_listing';
  static String booth_geotaging = '${BASE_URL}booth_geotaging';
  static String scan_ticket = '${BASE_URL}scan_ticket';
  static String checkedin_customers = '${BASE_URL}checkedin_customers';

  static String login = '${BASE_URL}login_user';
  static String signupOtpRequest = '${BASE_URL}get_otp';
  static String new_password = '${BASE_URL}new_password';

  static String registerUser = '${BASE_URL}register_user';
  static String listEvents = '${BASE_URL}list_events';
  static String eventDetail = '${BASE_URL}event_detail';
  static String event_ticket = '${BASE_URL}event_ticket';
  static String booking_ticket = '${BASE_URL}booking_ticket';
  static String mybookings = '${BASE_URL}mybookings';
  static String booking_ticket_detail = '${BASE_URL}booking_ticket_detail';
  static String seminar_detail = '${BASE_URL}seminar_detail';
  static String speakers = '${BASE_URL}speakers';
  static String speaker_seminar_listing = '${BASE_URL}speaker_seminar_listing';
  static String profile = '${BASE_URL}profile';
  static String tracklisting = '${BASE_URL}track_listing';
  static String seminarListing = '${BASE_URL}seminar_listing';
  static String save_booth_listing = '${BASE_URL}save_booth_listing';
  static String save_seminar = '${BASE_URL}save_seminar';
  static String save_seminar_listing = '${BASE_URL}save_seminar_listing';
  static String booked_booth_listing = '${BASE_URL}booked_booth_listing';
  static String bookmark_booth = '${BASE_URL}bookmark_booth';
  static String booksByCategory = '${BASE_URL}book_by_category';
  static String bookDetailsByslug = '${BASE_URL}book_details_by_slug';
  static String recentBooksListing = '${BASE_URL}recent_books_listing';
  static String featureBookListing = '${BASE_URL}feature_book_listing';
  static String popularBookListing = '${BASE_URL}popular_book_listing';
  static String orderProceed = '${BASE_URL}order_proceed';
  static String orderList = '${BASE_URL}order_list';
  static String orderDetail = '${BASE_URL}order_details';
  static String reviewAdd = '${BASE_URL}review_add';
  static String userLibrary = '${BASE_URL}user_library';
  static String searchBooks = '${BASE_URL}search_books';
  static String currentReadingUpdate = '${BASE_URL}current_reading_update';
  static String getCurrentReading = '${BASE_URL}get_current_reading';
  static String profileDetails = '${BASE_URL}profile_details';
  static String profileUpdate = '${BASE_URL}profile_update';

  //SharedPrefKey

  static String authCode = 'auth_code';
  static String connectionId = 'connection_id';
  static String success = 'success';
}
