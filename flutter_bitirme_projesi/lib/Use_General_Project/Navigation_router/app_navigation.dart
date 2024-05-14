import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Navigation_router/main_wrapper.dart';
import 'package:flutter_bitirme_projesi/Model/postmodel.dart';
import 'package:flutter_bitirme_projesi/Views/Elections/election_details_page.dart';
import 'package:flutter_bitirme_projesi/Views/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/Views/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/Views/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/Views/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/Views/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/Views/Sign_Up_Page/sign_up.dart';
import 'package:flutter_bitirme_projesi/Views/Voting_Page/voting.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initRoute = "/notEnteredHomePage";

  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final _navigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _navigatorElectionKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellElections');
  static final _navigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');
  static final _navigatorNotEnteredHomePageKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellNotEnteredHomePage');

  static final GoRouter goRouter = GoRouter(
    navigatorKey: _navigatorKey,
    initialLocation: initRoute,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _navigatorHomeKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/enteredhomepage',
                name: 'EnteredHomePage',
                builder: (context, state) {
                  return EnteredHomePage(
                    idNo: "582791488244",
                    password: "123ahmet123",
                    key: state.pageKey,
                    token: "",
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _navigatorElectionKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/elections',
                name: 'Elections',
                builder: (context, state) {
                  return Elections(
                    idNo: "582791488244",
                    password: "123ahmet123",
                    token: "",
                    key: state.pageKey,
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _navigatorProfileKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                name: 'Profile',
                builder: (context, state) {
                  return ProfilePage(
                    token:
                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjMzYjMwNzkzODdjMzkxZjBhZWY0ZTYiLCJfa2ltbGlrTm8iOiI5OTk4ODg3NzcyNCIsIl9wYXNzd29yZCI6IiQyYSQxMCRBa0hIYXZ0MjlyNENTaGxTZi5nbUJPeklpWFViQ1U0bEJwNHdCQ3NCT1Yvd21yOFI5LmFaSyIsImlhdCI6MTcxNTM0ODI3NH0.SbFYEDdrQd8Z0rmzZHmZxqHX4Z3kOt1pbtVph4XaTpM",
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _navigatorNotEnteredHomePageKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/notEnteredHomePage',
                name: 'NotEnteredHomePage',
                builder: (context, state) {
                  return HomePage();
                },
              )
            ],
          ),
        ],
      ),
    ],
  );
}
