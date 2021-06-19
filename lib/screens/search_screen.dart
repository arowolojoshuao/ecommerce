import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'content_item_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          style: TextStyle(color: theme.accentColor),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 14.0,
            ),
            hintText: getTranslationText(context, 'searchBy'),
            border: InputBorder.none,
            suffixIcon: Icon(
              FontAwesomeIcons.search,
              size: 20.0,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0.5,
        backgroundColor: theme.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            FontAwesomeIcons.chevronLeft,
            size: 20.0,
          ),
        ),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < AppBrain.mListItems.length; i++)
            ShakeListTransition(
              duration: Duration(milliseconds: 200 * (i + 2)),
              axis: Axis.vertical,
              child: CardSearch(
                image: AppBrain.mListItems[i].image[0],
                descrip: AppBrain.mListItems[i].descrip,
                title: AppBrain.mListItems[i].title,
                id: AppBrain.mListItems[i].id,
                price: AppBrain.mListItems[i].price,
              ),
            ),
        ],
      ),
    );
  }
}

class CardSearch extends StatelessWidget {
  final title, descrip;
  final image;
  final price, id;

  CardSearch({this.title, this.descrip, this.image, this.price, this.id});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ContentItemScreen(
                    image: image,
                    title: title,
                    descrip: descrip,
                    price: price,
                    id: id,
                  )),
        );
      },
      child: Container(
        width: double.infinity,
        height: 100.0,
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        decoration: BoxDecoration(
          color: theme.backgroundColor,
          boxShadow: kBoxShadow01,
        ),
        child: Row(
          children: [
            Expanded(
              child: Hero(
                tag: id,
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$title',
                      maxLines: 1,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$descrip',
                      maxLines: 3,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 13.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
