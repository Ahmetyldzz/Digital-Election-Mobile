import 'package:flutter/material.dart';
import 'package:flutter_bitirme_projesi/Use_General_Project/Navigation_router/main_wrapper.dart';
import 'package:flutter_bitirme_projesi/views/Elections/elections.dart';
import 'package:flutter_bitirme_projesi/views/Entered_Homepage/entered_home_page.dart';
import 'package:flutter_bitirme_projesi/views/Login_Page/login_page.dart';
import 'package:flutter_bitirme_projesi/views/Not_Entered_Homepage/home_page.dart';
import 'package:flutter_bitirme_projesi/views/Profile/profile.dart';
import 'package:flutter_bitirme_projesi/views/Voting_Page/voting.dart';
import 'package:go_router/go_router.dart';

class AppNavigation {
  AppNavigation._();

  static String initRoute = "/enteredhomepage";

  static final _navigatorKey = GlobalKey<NavigatorState>();
  static final _navigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _navigatorElectionKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellElections');
  static final _navigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

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
                  name: 'Home',
                  builder: (context, state) {
                    return EnteredHomePage(
                      idNo: "",
                      password: "",
                      key: state.pageKey,
                      token: "",
                    );
                  },
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'subEnteredHomePage',
                      name: 'SubEnteredHomePage',
                      builder: (context, state) {
                        return Elections(
                          idNo: "99988877724",
                          password: "alperen123",
                          key: state.pageKey,
                        );
                      },
                    ),
                  ]),
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
                    idNo: "99988877724",
                    password: "alperen123",
                    key: state.pageKey,
                  );
                },
              )
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _navigatorProfileKey,
            routes: <RouteBase>[
              GoRoute(
                path: '/profile',
                name: 'Profile',
                builder: (context, state) {
                  return ProfilePage(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NjMzYjMwNzkzODdjMzkxZjBhZWY0ZTYiLCJfa2ltbGlrTm8iOiI5OTk4ODg3NzcyNCIsIl9wYXNzd29yZCI6IiQyYSQxMCRBa0hIYXZ0MjlyNENTaGxTZi5nbUJPeklpWFViQ1U0bEJwNHdCQ3NCT1Yvd21yOFI5LmFaSyIsImlhdCI6MTcxNTE5MzAzOH0.xbSGmzbg1GOt34mV_KPo11wwgGLdYOlKe_XDCnmrTvU",);
                },
              )
            ],
          ),
        ],
      ),
    ],
  );
}
