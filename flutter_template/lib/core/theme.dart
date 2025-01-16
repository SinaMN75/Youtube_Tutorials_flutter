import 'package:u/utilities.dart';

abstract class AppThemes {
  static const Color defaultErrorColor = Colors.red;
  static const Color defaultPrimaryColor = Color.fromRGBO(3, 145, 121, 1);
  static const Color defaultSecondaryColor = Color.fromRGBO(247, 110, 110, 1);
  static Color defaultDisable = Colors.grey.shade500;
  static String fontFamily = UFonts.vazir.fontFamily!;

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: defaultPrimaryColor,
      primary: defaultPrimaryColor,
      secondary: defaultSecondaryColor,
      error: defaultErrorColor,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    disabledColor: defaultDisable,
    fontFamily: fontFamily,
    highlightColor: Colors.green,
    colorScheme: ColorScheme.fromSeed(
      seedColor: defaultPrimaryColor,
      primary: defaultPrimaryColor,
      secondary: defaultSecondaryColor,
      error: defaultErrorColor,
    ),
    cardTheme: CardTheme(
      elevation: 10,
      shadowColor: defaultPrimaryColor.withValues(alpha: 0.2),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: TextStyle(fontFamily: fontFamily, fontSize: 18),
      labelPadding: const EdgeInsets.symmetric(vertical: 12),
      unselectedLabelStyle: TextStyle(fontFamily: fontFamily, fontSize: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const WidgetStatePropertyAll<Color>(Colors.white),
        textStyle: WidgetStatePropertyAll<TextStyle>(
          TextStyle(fontFamily: fontFamily, color: Colors.white, fontSize: 16),
        ),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        ),
        backgroundColor: WidgetStateProperty.resolveWith((
          final Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled))
            return defaultDisable;
          else
            return defaultSecondaryColor;
        }),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        padding: const WidgetStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        ),
      ),
    ),
    drawerTheme: DrawerThemeData(
      shape: Border.all(color: Colors.transparent, width: 0.1),
    ),
    listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: defaultPrimaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: defaultDisable.withValues(alpha: 0.5)),
      ),
      labelStyle: TextStyle(fontFamily: fontFamily, color: defaultDisable),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(defaultPrimaryColor),
    ),
    navigationRailTheme: NavigationRailThemeData(
      unselectedLabelTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white60,
      ),
      selectedLabelTextStyle: TextStyle(
        fontFamily: fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      selectedIconTheme: const IconThemeData(color: Colors.black),
      unselectedIconTheme: const IconThemeData(color: Colors.white60),
      backgroundColor: defaultPrimaryColor,
      indicatorColor: Colors.white,
    ),
  );
}

abstract class AppImages {
  static const String _base = "lib/assets/images";
  static const String logo = "$_base/logo.png";
  static const String doctors = "$_base/doctors.svg";
  static const String masahat = "$_base/masahat.svg";
  static const String kaleri = "$_base/kaleri.svg";
  static const String tude = "$_base/tude.svg";
  static const String vazn = "$_base/vazn.svg";
  static const String dashboardPasture = "$_base/dashboard_pasture.svg";
  static const String skeleton = "$_base/skeleton.png";
  static const String sampleReport = "$_base/sample_report.svg";
  static const String human = "$_base/human.png";
  static const String registerSidebar = "$_base/register_sidebar.svg";
  static const String teachers = "$_base/teachers.svg";
  static const String students = "$_base/students.svg";
  static const String food = "$_base/food.svg";
  static const String psychology = "$_base/psychology.svg";
}

abstract class AppIcons {
  static const String _base = "lib/assets/icons";
  static const String qalb = "$_base/qalb.svg";
  static const String govaresh = "$_base/govaresh.svg";
  static const String kabed = "$_base/kabed.svg";
  static const String kolie = "$_base/kolie.svg";
  static const String rie = "$_base/rie.svg";
  static const String vitamin = "$_base/vitamin.svg";
  static const String ok = "$_base/ok.svg";
  static const String error = "$_base/error.svg";
  static const String abBadan = "$_base/ab_badan.svg";
  static const String azolateEskeleti = "$_base/azolate_eskeleti.svg";
  static const String bmi = "$_base/bmi.svg";
  static const String charbi = "$_base/charbi.svg";
  static const String charbiShekam = "$_base/charbi_shekam.svg";
  static const String tudeBeduneCharbi = "$_base/tude_bedune_charbi.svg";
  static const String circle = "$_base/circle.svg";
  static const String circleTickGreen = "$_base/circle_tick_green.svg";
  static const String circleBorderGreen = "$_base/circle_border_green.svg";
}
