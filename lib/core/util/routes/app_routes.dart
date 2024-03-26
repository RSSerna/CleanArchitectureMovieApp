import 'package:ca_movie_app/features/ca_movies/presentation/screens/screens.dart';
import 'package:flutter/material.dart';



class AppRoutes {
  static const initialRoute = 'home';

  static final Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'details': (BuildContext context) => const DetailsScreen(),
  };
}
