import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:linkifoot/core/routes/app_router.dart';
import 'package:linkifoot/core/theme/theme_app.dart';
import 'package:linkifoot/features/user/presentation/cubit/credential_cubit.dart';
import 'package:linkifoot/features/user/presentation/pages/credential/sign_in_page.dart';
import 'package:linkifoot/service_locator.dart' as di;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CredentialCubit>(
          create: (context) => di.sl<CredentialCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeApp.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        localizationsDelegates: const [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'),
          Locale('fr'),
        ],
        // home: const SignInPage(),
      ),
    );
  }
}
