import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:linkifoot/core/pages/error_page.dart';
import 'package:linkifoot/features/user/presentation/pages/credential/sign_in_page.dart';
import 'package:linkifoot/features/user/presentation/pages/credential/sign_up_page.dart';
import 'package:linkifoot/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:linkifoot/pages/main_page/main_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    /// Root route that checks authentication
    GoRoute(
      path: '/',
      builder: (context, state) {
        final authState = context.watch<AuthCubit>().state;

        if (authState is Authenticated) {
          return MainPage(uid: authState.uid);
        } else {
          return const SignInPage();
        }
      },
    ),

    /// Separate login and register routes (optional)
    GoRoute(
      path: '/login',
      builder: (_, __) => const SignInPage(),
    ),
    GoRoute(
      path: '/register',
      builder: (_, __) => const SignUpPage(),
    ),

    /// MainPage route with uid from query params (optional)
    GoRoute(
      path: '/main',
      builder: (context, state) {
        final uid = state.uri.queryParameters['uid'] ?? '';
        return MainPage(uid: uid);
      },
    ),
  ],
);
