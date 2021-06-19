import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/provides/theme_provider.dart';

import 'package:ecomers_app/screens/caty/selected_caty_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

class CardDrawer extends StatelessWidget {
  final Widget screen;

  CardDrawer({@required this.screen});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: ZoomDrawer(
        menuScreen: DrawerMain(),
        mainScreen: screen,
        borderRadius: 24.0,
        showShadow: true,
        angle: -5.0,
        backgroundColor: theme.backgroundColor.withOpacity(0.5),
        slideWidth: MediaQuery.of(context).size.width *
            (ZoomDrawer.isRTL() ? .05 : 0.65),
      ),
    );
  }
}

class DrawerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProv = Provider.of<DarkThemeProvider>(context);
    return Drawer(
      elevation: 0,
      child: Container(
        color: theme.primaryColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/images/icon.svg',
                  color: Colors.white,
                ),
              ),
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.home,
              label: getTranslationText(context, 'home'),
              onTap: () => ZoomDrawer.of(context).close(),
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.userAlt,
              label: getTranslationText(context, 'login'),
              onTap: () {
                ZoomDrawer.of(context).close();

                Navigator.pushNamed(context, '/login');
              },
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.userPlus,
              label: getTranslationText(context, 'signUp'),
              onTap: () {
                ZoomDrawer.of(context).close();
                Navigator.pushNamed(context, '/signup');
              },
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.male,
              label: getTranslationText(context, 'men_clothes'),
              onTap: () {
                ZoomDrawer.of(context).close();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedCatyScreen(
                          title: getTranslationText(context, 'men_clothes')),
                    ));
              },
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.female,
              label: getTranslationText(context, 'women_clothes'),
              onTap: () {
                ZoomDrawer.of(context).close();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedCatyScreen(
                          title: getTranslationText(context, 'women_clothes')),
                    ));
              },
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.child,
              label: getTranslationText(context, 'kids_clothes'),
              onTap: () {
                ZoomDrawer.of(context).close();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedCatyScreen(
                          title: getTranslationText(context, 'kids_clothes')),
                    ));
              },
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.baby,
              label: getTranslationText(context, 'baby_clothes'),
              onTap: () {
                ZoomDrawer.of(context).close();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedCatyScreen(
                          title: getTranslationText(context, 'baby_clothes')),
                    ));
              },
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.alignJustify,
              label: getTranslationText(context, 'all_caty'),
              onTap: () {
                ZoomDrawer.of(context).close();

                Navigator.pushNamed(context, '/allcaty');
              },
            ),
            ListTile(
              onTap: () {},
              leading: Icon(FontAwesomeIcons.sun, color: Colors.white),
              title: Text(
                themeProv.changeTheme ? "Light mode" : "Dark mode",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Switch(
                //activeColor: Colors.white,
                value: themeProv.changeTheme ? false : true,
                onChanged: (value) {
                  print(value);
                  themeProv.changeTheme = value ? false : true;
                },
              ),
            ),
            CardTileMenu(
              icon: FontAwesomeIcons.signOutAlt,
              label: getTranslationText(context, 'exit'),
            ),
          ],
        ),
      ),
    );
  }
}

class CardTileMenu extends StatelessWidget {
  final label;
  final icon;
  final onTap;

  CardTileMenu({this.label, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$label',
        style: TextStyle(color: Colors.white),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      onTap: onTap,
    );
  }
}
