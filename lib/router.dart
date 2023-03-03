import 'package:flutter/material.dart';
import 'package:hostelp/features/details/screens/details_screen.dart';
import 'package:hostelp/features/Hostel_list/hostel_list.dart';
import 'package:hostelp/features/auth/screens/login_screen.dart';
import 'package:hostelp/features/notifications/screens/notification_screen.dart';
import 'package:hostelp/features/home/screens/home_screen_new.dart';
import 'package:hostelp/features/profile/profile_screen.dart';
import 'package:hostelp/features/search/screens/search_screen.dart';
import 'package:routemaster/routemaster.dart';

import 'features/payment/screens/add_members.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreenNew()),
  '/profile': (_) => const MaterialPage(child: ProfileScreen()),
  '/search': (_) => const MaterialPage(child: SearchScreen()),
  '/hostel': (_) => const MaterialPage(child: HostelList()),
  '/notifications': (_) => const MaterialPage(child: NotificationScreen()),
  '/details': (route) => MaterialPage(
        child: DetailScreen(
          name: route.queryParameters['name']!,
          photo: route.queryParameters['photo']!,
          rating: route.queryParameters['rating']!,
          address: route.queryParameters['address']!,
        ),
      ),
    '/payment' : (route) => const MaterialPage(child: AddMembersScreen())
});
