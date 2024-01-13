import '../views/community/community_page.dart';
import '../views/home/home_page.dart';
import '../views/profile/profile_page.dart';
import '../views/search/search_page.dart';
import '../views/upgrading/upgrading_page.dart';

enum PaymentMethods { mandiriVA, briVA, bcaVA, gopay, ovo }

const List<String> pages = [
  HomePage.routeName,
  SearchPage.routeName,
  CommunityPage.routeName,
  UpgradingPage.routeName,
  ProfilePage.routeName
];
