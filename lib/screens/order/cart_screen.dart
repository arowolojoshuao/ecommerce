import 'dart:math';

import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_content.dart';

import 'package:ecomers_app/widgets/wigets_carts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _total = 0;
  double _shipping = 10.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;

    /// Sum per product
    AppBrain.mListCart
        .map((e) {
          return (e.price).toInt() * e.count;
        })
        .toList()
        .fold(0, (p, c) => _total = p + c);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          getTranslationText(context, 'myCart'),
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
      body: Stack(
        children: [
          Container(
            width: mSize.width,
            height: mSize.height,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShakeTransition(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: Text(
                      getTranslationText(context, 'selected'),
                      style: TextStyle(
                        color: theme.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ListView(
                    padding: EdgeInsets.only(bottom: mSize.height / 3),
                    children: [
                      for (int i = 0; i < AppBrain.mListCart.length; i++)
                        ShakeListTransition(
                          duration: Duration(milliseconds: 400 * (i + 1)),
                          axis: Axis.vertical,
                          child: CardCartItem(
                            count: AppBrain.mListCart[i].count,
                            price: AppBrain.mListCart[i].price,
                            image: AppBrain.mListCart[i].image[0],
                            title: AppBrain.mListCart[i].title,
                            descrip: AppBrain.mListCart[i].descrip,
                            id: AppBrain.mListCart[i].id,
                            onPlus: () {
                              setState(() {
                                var _listCart = AppBrain.mListCart[i];
                                _listCart.count = max(1, _listCart.count + 1);
                              });
                            },
                            onMinus: () {
                              setState(() {
                                var _listCart = AppBrain.mListCart[i];
                                if (_listCart.count == 0) {
                                  return false;
                                }
                                _listCart.count = max(1, _listCart.count - 1);
                              });
                            },
                            onDelete: () {
                              setState(() {
                                AppBrain.mListCart.removeAt(i);
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: theme.backgroundColor.withOpacity(0.8),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  ShakeTransition(
                    child: CardRowFee(
                      title: getTranslationText(context, 'deliveryFee'),
                      label: '\$$_shipping',
                    ),
                  ),
                  Divider(
                    color: theme.unselectedWidgetColor,
                    height: 20.0,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                  ShakeTransition(
                    duration: Duration(milliseconds: 1200),
                    child: CardRowFee(
                      title: getTranslationText(context, 'total'),
                      label: '\$${_total + _shipping}',
                    ),
                  ),
                  CardBottom(
                      onTap: () {
                        Navigator.pushNamed(context, '/checkout');
                      },
                      label: getTranslationText(context, 'checkout')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
