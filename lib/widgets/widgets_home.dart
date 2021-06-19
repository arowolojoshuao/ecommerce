import 'package:cached_network_image/cached_network_image.dart';
import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/provides/localization_constans.dart';

import 'package:ecomers_app/screens/content_item_screen.dart';

import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ecomers_app/helpers/colors.dart';

class CardSearchBag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, '/search'),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius01,
                color: theme.highlightColor.withOpacity(0.1),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getTranslationText(context, 'search'),
                    style: TextStyle(
                      color: theme.hintColor,
                    ),
                  ),
                  Icon(
                    FontAwesomeIcons.search,
                    size: 18.0,
                    color: theme.hintColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/caty');
          },
          child: Hero(
            tag: 'cart',
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: kBorderRadius01,
                color: theme.primaryColor,
              ),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.shoppingBag,
                  size: 18.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TooBarMain extends StatelessWidget {
  final showDrawer;

  TooBarMain({@required this.showDrawer});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return ShakeTransition(
      axis: Axis.vertical,
      child: Container(
        width: mSize.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: showDrawer,
              child: Container(
                width: 45.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  boxShadow: kBoxShadow01,
                  borderRadius: kBorderRadius01,
                ),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.alignLeft,
                    color: theme.accentColor,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            Text(
              kAppName,
              style: GoogleFonts.lobster(
                color: theme.accentColor,
                fontSize: 25.0,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, '/profile'),
              child: Hero(
                tag: 'profile',
                child: CircleAvatar(
                  maxRadius: 22.0,
                  backgroundColor: theme.primaryColor,
                  backgroundImage: NetworkImage(kProfile),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatefulWidget {
  final title;
  final descrip;
  final image;
  final price;
  final id;

  CardItem({
    this.title,
    this.descrip,
    this.price,
    this.image,
    this.id,
  });

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  var _colorImage;

  getImageColor(_image) async {
    getColorFromUrl('$_image').then((color) {
      setState(() {
        _colorImage = color ?? kColorPrimaryRGB;
      });
    });
  }

  @override
  void initState() {
    _colorImage = kColorPrimaryRGB;
    getImageColor(widget.image);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ContentItemScreen(
                    image: widget.image,
                    title: widget.title,
                    descrip: widget.descrip,
                    price: widget.price,
                    id: widget.id,
                  )),
        );
      },
      child: Container(
        width: mSize.width / 2,
        height: mSize.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: theme.backgroundColor,
          boxShadow: kBoxShadow01,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Hero(
                tag: widget.id,
                child: CachedNetworkImage(
                  imageUrl: widget.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.title}'.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: theme.accentColor,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '${widget.descrip}',
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        color: theme.accentColor,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CardPrice(
                          price: widget.price,
                          colorImage: _colorImage,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(_colorImage[0],
                                _colorImage[1], _colorImage[2], 1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            FontAwesomeIcons.plus,
                            size: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
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

class CardPrice extends StatelessWidget {
  final colorImage;
  final price;

  CardPrice({this.colorImage, this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(colorImage[0], colorImage[1], colorImage[2], 0.1),
            Color.fromRGBO(colorImage[0], colorImage[1], colorImage[2], 0.8),
          ],
        ),
      ),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: getTranslationText(context, 'price'),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 13.0,
              color: theme.accentColor,
            ),
          ),
          TextSpan(
            text: '\$$price',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.0,
              color: theme.accentColor,
            ),
          ),
        ]),
      ),
    );
  }
}
