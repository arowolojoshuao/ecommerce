import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_content.dart';
import 'package:ecomers_app/widgets/wigets_carts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'change_adress.dart';

class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _total = 0;
  double _shipping = 10.0;
  var _addressUser = '560 Elliot Avenue';
  bool _progress = false;

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
          getTranslationText(context, 'tr_dtl'),
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
      body: ModalProgressHUD(
        inAsyncCall: _progress,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: mSize.width,
                height: mSize.height,
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShakeTransition(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Text(
                          getTranslationText(context, 'order_dtl'),
                          style: TextStyle(
                            color: theme.hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        for (int i = 0; i < AppBrain.mListCart.length; i++)
                          ShakeListTransition(
                            duration: Duration(milliseconds: 200 * (i + 1)),
                            axis: Axis.vertical,
                            child: CardItemDetails(
                              image: AppBrain.mListCart[i].image[0],
                              title: AppBrain.mListCart[i].title,
                              descrip: AppBrain.mListCart[i].descrip,
                              price: AppBrain.mListCart[i].price,
                              count: AppBrain.mListCart[i].count,
                            ),
                          ),
                      ],
                    ),
                    ShakeTransition(
                      duration: Duration(milliseconds: 1800),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Text(
                          getTranslationText(context, 'shop_adr'),
                          style: TextStyle(
                            color: theme.hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                    ShakeTransition(
                      duration: Duration(milliseconds: 2000),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '$_addressUser',
                              style: TextStyle(
                                color: theme.hintColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChangeAddress(
                                              newAddress: (value) {
                                                setState(() {
                                                  _addressUser = value;
                                                });
                                              },
                                            )));
                              },
                              child: Text(
                                getTranslationText(context, 'adress_change'),
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: theme.backgroundColor.withOpacity(0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    ShakeTransition(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          getTranslationText(context, 'tr_dtl'),
                          style: TextStyle(
                            color: theme.accentColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    ShakeTransition(
                      duration: Duration(milliseconds: 1200),
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
                      duration: Duration(milliseconds: 1600),
                      child: CardRowFee(
                        title: getTranslationText(context, 'total'),
                        label: '\$${_total + _shipping}',
                      ),
                    ),
                    CardBottom(
                      onTap: () {
                        setState(() {
                          _progress = true;
                        });
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.pushNamed(context, '/order_1');

                          setState(() {
                            _progress = false;
                          });
                        });
                      },
                      label: getTranslationText(context, 'buy_now'),
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

class CardItemDetails extends StatelessWidget {
  final image;
  final title, descrip;
  final count;
  final price;

  CardItemDetails(
      {this.image, this.title, this.descrip, this.count, this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 70.0,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(image),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title'.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: theme.accentColor,
                  ),
                ),
                Text(
                  '$descrip',
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.0,
                    color: theme.accentColor,
                  ),
                ),
                Text(
                  '\$${price * count}',
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.0,
                      color: theme.hintColor),
                ),
              ],
            ),
          ),
          Text(
            '$count Item',
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12.0,
                color: theme.hintColor),
          ),
          SizedBox(width: 10.0),
        ],
      ),
    );
  }
}
