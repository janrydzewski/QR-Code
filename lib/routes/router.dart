import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_code/ui/ui.dart';

class MyRouter {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ApplicationScreen(
            child: child,
          );
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'Home',
            path: '/home',
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: HomeScreen(),
              );
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'VCard',
                path: 'vcard',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: VCardScreen(),
                  );
                },
              ),
              GoRoute(
                name: 'Wifi',
                path: 'wifi',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: WifiScreen(),
                  );
                },
              ),
              GoRoute(
                name: 'Sms',
                path: 'sms',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: SmsScreen(),
                  );
                },
              ),
              GoRoute(
                name: 'Url',
                path: 'url',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: UrlScreen(),
                  );
                },
              ),
              GoRoute(
                name: 'Email',
                path: 'email',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: EmailScreen(),
                  );
                },
              ),
              GoRoute(
                name: 'Event',
                path: 'event',
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: EventScreen(),
                  );
                },
              ),
            ],
          ),
          GoRoute(
              name: 'List',
              path: '/list',
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: Center(child: Text("List")),
                );
              },
              routes: <RouteBase>[
                GoRoute(
                  name: 'ShowQr',
                  path: 'showQr',
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(
                      child: ShowQrScreen(),
                    );
                  },
                ),
              ]),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => CustomTransitionPage(
      child: const Center(
        child: Text("Error"),
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    ),
  );
}
