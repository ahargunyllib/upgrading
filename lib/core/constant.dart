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

getFeatures(String feature) {
  switch (feature) {
    case "Educational Scholarships":
      return freeFeatures[0];
    case "Organization":
      return freeFeatures[1];
    case "Community":
      return freeFeatures[2];
    case "Preparation Video":
      return freeFeatures[3];
    case "Consultation":
      return freeFeatures[4];
  }
}

const freeFeatures = [
  {
    "title": "Educational Scholarships",
    "subtitle": "Explore various scholarships and find what works for you",
    "imagePath": "assets/images/beasiswa-icon.png",
    "routeName": "/beasiswa"
  },
  {
    "title": "Organization",
    "subtitle":
        "Develop yourself and achieve various things experience by joining to the organization of your choice",
    "imagePath": "assets/images/organisasi-icon.png",
    "routeName": "/organisasi"
  },
  {
    "title": "Community",
    "subtitle":
        "Gather and share information with those who have the same goals as you",
    "imagePath": "assets/images/community-icon.png",
    "routeName": "/community"
  },
  {
    "title": "Preparation Video",
    "subtitle":
        "Access video content of scholarship preparation or organization that you want",
    "imagePath": "assets/images/video-preparation-icon.png",
    "routeName": "/video-persiapan"
  },
  {
    "title": "Consultation",
    "subtitle":
        "Consultation with awardee of scholarships or organizational membership that you want",
    "imagePath": "assets/images/consultation-icon.png",
    "routeName": "/konsultasi"
  },
];
