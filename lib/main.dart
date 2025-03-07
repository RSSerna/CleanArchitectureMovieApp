// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:clean_architecture_movies/features/language/presentation/bloc/language_bloc.dart';



import 'injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


import 'package:ca_movie_app/core/util/routes/app_routes.dart';

import 'package:ca_movie_app/core/util/theme/app_theme.dart';

import 'package:ca_movie_app/features/ca_movies/presentation/bloc/blocs.dart';


import 'package:ca_movie_app/injection_container.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingMoviesBloc>(
          create: (context) =>
              sl<NowPlayingMoviesBloc>()..add(const GetNowPlayingMoviesEvent()),
        ),
        BlocProvider<PopularMoviesBloc>(
          create: (context) => sl<PopularMoviesBloc>()
            ..add(const GetPopularMoviesEvent(popularMovies: [])),
        ),
        // BlocProvider<LanguageBloc>(
        //   create: (context) => sl<LanguageBloc>()..add(CheckLanguageEvent()),
        // ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas', 
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      theme: AppTheme.lightTheme,
    );
    // return BlocBuilder<LanguageBloc, LanguageState>(
    //   builder: (context, state) {
    //     if (state is LanguageChangingState) {
    //       final Size size = MediaQuery.of(context).size;
    //       return Center(
    //         child: SizedBox(
    //           height: size.width * 0.4,
    //           width: size.width * 0.4,
    //           child: const CircularProgressIndicator(
    //             strokeWidth: 12,
    //           ),
    //         ),
    //       );
    //     }
    //     if (state is LanguageSetState) {
    //       return MaterialApp(
    //         locale: Locale(state.language.languageCode),
    //         localizationsDelegates: AppLocalizations.localizationsDelegates,
    //         supportedLocales: AppLocalizations.supportedLocales,
    //         debugShowCheckedModeBanner: false,
    //         home: const HomeScreen(),
    //         routes: AppRoutes.routes,
    //         theme: AppTheme.ligthTheme,
    //         title: 'Movies',
    //       );
    //     }
    //     if (state is LanguageErrorState) {
    //       final Size size = MediaQuery.of(context).size;
    //       return MessageDisplay(
    //         message: 'Please Restart the app',
    //         height: size.width * 0.4,
    //         width: size.width * 0.4,
    //       );
    //     } else {
    //       return MaterialApp(
    //         locale: Locale(
    //             sl<SharedPreferences>().getString(Constants.cachedLanguage) ??
    //                 'en'),
    //         localizationsDelegates: AppLocalizations.localizationsDelegates,
    //         supportedLocales: AppLocalizations.supportedLocales,
    //         debugShowCheckedModeBanner: false,
    //         home: const HomeScreen(),
    //         routes: AppRoutes.routes,
    //         theme: AppTheme.ligthTheme,
    //         title: 'Movies',
    //       );
    //     }
    //   },
    // );
  }
}