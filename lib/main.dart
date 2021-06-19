import 'package:ecomers_app/helpers/theme.dart';
import 'package:ecomers_app/provides/localization_constans.dart';

import 'package:ecomers_app/provides/theme_provider.dart';
import 'package:ecomers_app/screens/caty/all_caty_screen.dart';
import 'package:ecomers_app/screens/intru/intro_app.dart';
import 'package:ecomers_app/screens/order/cart_screen.dart';
import 'package:ecomers_app/screens/order/checkout_screen.dart';
import 'package:ecomers_app/screens/order/make_payment_screen.dart';
import 'package:ecomers_app/screens/order/order_payed_screen.dart';
import 'package:ecomers_app/screens/search_screen.dart';
import 'package:ecomers_app/screens/splash_screen.dart';
import 'package:ecomers_app/screens/user/login_screen.dart';
import 'package:ecomers_app/screens/user/profile_screen.dart';
import 'package:ecomers_app/screens/user/reset_pass_ screen.dart';
import 'package:ecomers_app/screens/user/sign_up_screen.dart';
import 'package:ecomers_app/screens/welcome_screen.dart';
import 'package:ecomers_app/widgets/drawer_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

import 'helpers/constants.dart';
import 'helpers/language.dart';
import 'provides/demo_localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  Locale _locale;

  void setLocale(Locale temp) {
    setState(() {
      _locale = temp;
    });
  }

  @override
  void didChangeDependencies() {
    getLocales().then((locale) => {
          setState(() {
            this._locale = locale;
          }),
        });
    super.didChangeDependencies();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.changeTheme = await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (context, theme, child) {
          if (_locale == null) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return MaterialApp(
              title: kAppName,
              debugShowCheckedModeBanner: false,
              theme: themeData(context),
              darkTheme: darkThemeData(context),
              themeMode: theme.changeTheme ? ThemeMode.dark : ThemeMode.light,
              // transitionDuration: Duration(milliseconds: 300),
              //  defaultTransition: Transition.rightToLeftWithFade,
              localizationsDelegates: [
                DemoLocalization.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: Language.supportedLocales,
              locale: _locale,
              localeResolutionCallback: (deviceLocale, supportdeLocales) {
                for (var local in supportdeLocales) {
                  if (local.languageCode == deviceLocale.languageCode &&
                      local.countryCode == deviceLocale.countryCode) {
                    return deviceLocale;
                  }
                }
                return supportdeLocales.first;
              },
              initialRoute: '/',
              routes: {
                '/': (_) => SplashScreen(),
                '/welcome': (_) => CardDrawer(screen: WelcomeScreen()),
                '/profile': (_) => ProfileScreen(),
                '/checkout': (_) => CheckOutScreen(),
                '/order_1': (_) => OrderPayedSuccessfulScreen(),
                '/makePayment': (_) => MakePaymentScreen(),
                '/signup': (_) => SignUpScreen(),
                '/rest': (_) => ResetPasswordScreen(),
                '/login': (_) => LogInScreen(),
                '/allcaty': (_) => AllCatyScreen(),
                '/caty': (_) => CartScreen(),
                '/search': (_) => SearchScreen(),
                '/intro': (_) => IntroApp(),
              },
            );
          }
        },
      ),
    );
  }
}
