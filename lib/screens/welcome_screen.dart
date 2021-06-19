import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: TooBarMain(
              showDrawer: () {
                if (ZoomDrawer.of(context).isOpen()) {
                  ZoomDrawer.of(context).close();
                } else {
                  ZoomDrawer.of(context).open();
                }
              },
            ),
            leading: SizedBox(),
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            toolbarHeight: 70,
            backgroundColor: theme.backgroundColor,
            elevation: 0.1,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                width: mSize.width,
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  top: 20.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardSearchBag(),
                      SizedBox(height: 20.0),
                      Text(
                        getTranslationText(context, 'new_clothes'),
                        style: TextStyle(
                          color: theme.accentColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          wordSpacing: 1,
                          letterSpacing: .5,
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.6,
              ),
              delegate: SliverChildListDelegate([
                for (int i = 0; i < AppBrain.mListItems.length; i++)
                  CardItem(
                    title: AppBrain.mListItems[i].title,
                    image: AppBrain.mListItems[i].image[0],
                    price: AppBrain.mListItems[i].price,
                    descrip: AppBrain.mListItems[i].descrip,
                    id: AppBrain.mListItems[i].id,
                  ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
