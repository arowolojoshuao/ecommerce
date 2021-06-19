import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_caty.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AllCatyScreen extends StatefulWidget {
  @override
  _AllCatyScreenState createState() => _AllCatyScreenState();
}

class _AllCatyScreenState extends State<AllCatyScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Categories',
          style: TextStyle(color: theme.accentColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20.0,
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.8,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          for (int i = 0; i < AppBrain.mListCategories.length; i++)
            ShakeListTransition(
              axis: Axis.vertical,
              duration: Duration(milliseconds: 400 * (i + 1)),
              child: CardCaty(
                title: AppBrain.mListCategories[i].title,
                image: AppBrain.mListCategories[i].image,
                id: AppBrain.mListCategories[i].id,
              ),
            ),
        ],
      ),
    );
  }
}
