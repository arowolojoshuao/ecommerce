import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/helpers/colors.dart';
import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/screens/content_item_screen.dart';

import 'package:ecomers_app/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardCartItem extends StatelessWidget {
  final title, descrip;
  final image;
  final price;
  final count;
  final id;
  final index;

  final onPlus, onMinus;
  final onDelete;

  CardCartItem({
    this.title,
    this.descrip,
    this.image,
    this.price,
    this.count,
    this.onMinus,
    this.onPlus,
    this.onDelete,
    this.index,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      closeOnScroll: true,
      secondaryActions: [
        InkWell(
          onTap: onDelete,
          child: CircleAvatar(
            maxRadius: 30.0,
            backgroundColor: Colors.deepOrange,
            child: Icon(
              FontAwesomeIcons.trash,
              //  size: 18,
              color: Colors.white,
            ),
          ),
        ),
      ],
      child: GestureDetector(
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
          width: mSize.width,
          height: 150,
          padding: EdgeInsets.all(2.0),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          decoration: BoxDecoration(
            color: theme.backgroundColor,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: kBoxShadow01,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Hero(
                    tag: id,
                    child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '$title'.toUpperCase(),
                      maxLines: 1,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      '$descrip',
                      maxLines: 2,
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 13.0,
                      ),
                    ),
                    CardPrice(
                      colorImage: kColorPrimaryRGB,
                      price: price,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardPlusMinus(
                    icon: FontAwesomeIcons.plus,
                    onTap: onPlus,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color: theme.hintColor,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  CardPlusMinus(
                    icon: FontAwesomeIcons.minus,
                    onTap: onMinus,
                  ),
                ],
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class CardPlusMinus extends StatelessWidget {
  final icon;
  final onTap;

  CardPlusMinus({@required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 20.0,
      height: 20.0,
      child: RawMaterialButton(
        child: Icon(
          icon,
          size: 16,
          color: theme.hintColor,
        ),
        onPressed: onTap,
      ),
    );
  }
}

class CardRowFee extends StatelessWidget {
  final label;
  final title;

  CardRowFee({this.label, this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: theme.accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
                color: theme.accentColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
