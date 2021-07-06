import 'package:estate_social_app/screens/account/create.dart';
import 'package:estate_social_app/screens/account/edit.dart';
import 'package:estate_social_app/screens/detail.dart';
import 'package:estate_social_app/screens/development.dart';
import 'package:estate_social_app/screens/favorite.dart';
import 'package:estate_social_app/screens/home.dart';
import 'package:estate_social_app/screens/chat/messages.dart';
import 'package:estate_social_app/screens/offer/offers.dart';
import 'package:estate_social_app/screens/offer/create.dart';
import 'package:estate_social_app/screens/offer/plan.dart';
import 'package:estate_social_app/screens/profile/company.dart';
import 'package:estate_social_app/screens/profile/profiles.dart';
import 'package:estate_social_app/screens/chat/send_message.dart';

var routes = {
  '/home': (context) => HomeScreen(),
  '/detail': (context) => DetailScreen(),
  '/chat': (context) => MessagesScreen(),
  '/chat/send': (context) => MessageSendScreen(),
  '/favorite': (context) => FavoriteScreen(),
  '/profiles': (context) => ProfilesScreen(),
  '/profiles/company': (context) => CompanyDetailScreen(),
  '/development': (context) => DevelopmentScreen(),
  '/offers': (context) => OffersScreen(),
  '/offers/new': (context) => CreateOfferScreen(),
  '/offers/plan': (context) => OfferPlanScreen(),
  '/account/new': (context) => CreateAccountScreen(),
  '/account/edit': (context) => EditAccountScreen(),
};
