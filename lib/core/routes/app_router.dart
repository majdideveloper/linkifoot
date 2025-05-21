import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkifoot/core/pages/error_page.dart';
import 'package:linkifoot/features/user/presentation/pages/credential/sign_in_page.dart';
import 'package:linkifoot/features/user/presentation/pages/credential/sign_up_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  // redirect: (context, state) {
  //   final authState = context.read<AuthCubit>().state;

  //   if (authState is Authenticated) return '/home';

  //   return null;
  //   // if (authState is Authenticated) {
  //   //               return MainScreen(uid: authState.uid,);

  //   //             } else {
  //   //               return SignInPage();
  //   //             }
  // },
  errorBuilder: (context, state) => const ErrorPage(),
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const SignInPage()),
    GoRoute(path: '/register', builder: (_, __) => const SignUpPage()),
    // GoRoute(
    //   path: '/home',
    //   builder: (context, state) {
    //     final authState = context.read<AuthCubit>().state;

    //     if (authState is Authenticated) {
    //       return HomePage(user: authState.user); // pass user
    //     }

    //     // fallback to login if somehow reached here without user
    //     return const LoginPage();
    //   },
    // ),
    // ShellRoute(
    //   builder: (context, state, child) {
    //     final authState = context.read<AuthCubit>().state;
    //     if (authState is Authenticated) {
    //       return HomePage(
    //         user: authState.user,
    //       );
    //     }
    //     return const LoginPage();
    //   },
    //   routes: [
    //     GoRoute(
    //       path: '/home/feed',
    //       builder: (context, state) {
    //         final authState = context.read<AuthCubit>().state;
    //         if (authState is Authenticated) {
    //           return FeedPage(user: authState.user);
    //         }
    //         return const LoginPage();
    //       },
    //     ),
    //     GoRoute(
    //       path: '/home/messages',
    //       builder: (context, state) {
    //         final authState = context.read<AuthCubit>().state;
    //         if (authState is Authenticated) {
    //           return FeedPage(user: authState.user);
    //         }
    //         return const LoginPage();
    //       },
    //     ),
    //     // GoRoute(
    //     //   path: '/home/profile',
    //     //   builder: (context, state) {
    //     //     final authState = context.read<AuthCubit>().state;
    //     //     if (authState is Authenticated) {
    //     //       return ProfilePage(user: authState.user);
    //     //     }
    //     //     return const LoginPage();
    //     //   },
    //     // ),
    //   ],
    // ),
  ],
);
