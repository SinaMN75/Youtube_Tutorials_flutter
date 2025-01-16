import 'package:sample_project/core/theme.dart';
import 'package:sample_project/generated/l10n.dart';
import 'package:sample_project/view/pages/splash/splash_page.dart';
import 'package:u/utilities.dart';

Future<void> main() async {
  await initUtilities(
    preventScreenShot: true,
    protectDataLeaking: true,
    safeDevice: true,
    apiKey: "ddvdf"
  );

  runApp(
    UMaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: const <Locale>[Locale("fa"), Locale("en")],
      locale: const Locale("fa"),
      lightTheme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const SplashPage(),
    ),
  );
}
