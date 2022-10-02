// ignore_for_file: non_constant_identifier_names

class TranslationModel {
  late String login;
  late String hi;
  late String no_account;
  late String register;
  late String email;
  late String pass;
  late String confirm_pass;
  late String username;
  late String phone;
  late String enter_name;
  late String enter_email;
  late String enter_password;
  late String enter_confirm_pass;
  late String name_empty;
  late String password_empty;
  late String email_empty;
  late String have_account;
  late String not_have_account;
  late String yse_account;
  late String forget_pass;
  late String remember_me;
  late String or;

  late String skip;
  late String next;
  late String done;
  late String intro_title_1;
  late String intro_title_2;
  late String intro_title_3;
  late String intro_description_1;
  late String intro_description_2;
  late String intro_description_3;

  late String edit_profile;
  late String call_us;
  late String help;
  late String setting;
  late String dark_mode;
  late String change_lang;
  late String add_image;
  late String profile;
  late String logout;
  late String loginerror;
  late String logindone;
  late String booknow;
  late String topRatedHotels;
  late String home;
  late String explore;
  late String hotels;
  late String show_in_map;
  late String price;
  late String rates;
  late String myBooking;
  late String map;
  late String details;

  late String upcoming;
  late String completed;
  late String cancelled;
  late String search;
  late String bookingId;
  late String backToHome;

  TranslationModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    hi = json['hi'];
    no_account = json['no_account'];
    register = json['register'];
    email = json['email'];
    pass = json['pass'];
    confirm_pass = json['confirm_pass'];
    username = json['username'];
    phone = json['phone'];
    register = json['register'];
    enter_name = json['enter_name'];
    enter_email = json['enter_email'];
    enter_password = json['enter_password'];
    enter_confirm_pass = json['enter_confirm_pass'];
    name_empty = json['name_empty'];
    have_account = json['have_account'];
    not_have_account = json['not_have_account'];
    forget_pass = json['forget_pass'];
    remember_me = json['remember_me'];
    or = json['or'];

    skip = json['skip'];
    next = json['next'];
    done = json['done'];
    intro_title_1 = json['intro_title_1'];
    intro_title_2 = json['intro_title_2'];
    intro_title_3 = json['intro_title_3'];
    intro_description_1 = json['intro_description_1'];
    intro_description_2 = json['intro_description_2'];
    intro_description_3 = json['intro_description_3'];

    edit_profile = json['edit_profile'];
    call_us = json['call_us'];
    help = json['help'];
    setting = json['setting'];
    dark_mode = json['dark_mode'];
    change_lang = json['change_lang'];
    add_image = json['add_image'];
    logout = json['logout'];

    loginerror = json['loginerror'];
    logindone = json['logindone'];
    booknow = json['booknow'];
    topRatedHotels = json['topRatedHotels'];
    home = json['home'];
    explore = json['explore'];
    profile = json['profile'];
    hotels = json['hotels'];
    show_in_map = json['show_in_map'];
    price = json['price'];
    rates = json['rates'];
    myBooking = json['myBooking'];
    map = json['map'];
    details = json['details'];

    upcoming = json['upcoming'];
    completed = json['completed'];
    cancelled = json['cancelled'];

    search = json['search'];
    bookingId = json['bookingId'];
    backToHome = json['backToHome'];
  }
}