import 'package:dd360_challenge/core/router/args/router_args.dart';
import 'package:dd360_challenge/core/router/screen_path.dart';
import 'package:dd360_challenge/feature/heroes/presenter/screen/heroes_screen.dart';
import 'package:dd360_challenge/feature/home/presenter/screen/home.dart';
import 'package:dd3_main_dependencies/dd3_main_dependencies.dart';
import 'package:flutter/material.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: ScreenPath.home,
      name: AppRoute.home.name,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
      routes: [
        GoRoute(
          path: AppRoute.heroesScreen.name,
          name: AppRoute.heroesScreen.name,
          pageBuilder: (BuildContext context, GoRouterState state) =>
              CustomTransitionPage(
            child: HeroesScreen(
              object: state.extra as HeroesObjet,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        ),
      ],
    ),
  ],
);
