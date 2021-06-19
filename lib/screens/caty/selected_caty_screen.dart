import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectedCatyScreen extends StatefulWidget {
  final title;
  SelectedCatyScreen({this.title});

  @override
  _SelectedCatyScreenState createState() => _SelectedCatyScreenState();
}

class _SelectedCatyScreenState extends State<SelectedCatyScreen> {
  bool _isGrid = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.title}',
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
        actions: [
          IconButton(
            icon: Icon(!_isGrid
                ? FontAwesomeIcons.gripVertical
                : FontAwesomeIcons.alignJustify),
            onPressed: () {
              if (mounted)
                setState(() {
                  _isGrid = !_isGrid;
                });
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: _isGrid ? 2 : 1,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.6,
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: [
          for (int i = 0; i < AppBrain.mListItems.length; i++)
            ShakeListTransition(
              axis: Axis.vertical,
              duration: Duration(milliseconds: 300 * (i + 1)),
              child: CardItem(
                title: AppBrain.mListItems[i].title,
                image: AppBrain.mListItems[i].image[0],
                price: AppBrain.mListItems[i].price,
                descrip: AppBrain.mListItems[i].descrip,
                id: AppBrain.mListItems[i].id,
              ),
            ),
        ],
      ),
    );
  }
}
