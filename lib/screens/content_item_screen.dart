import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/models/app_brain.dart';
import 'package:ecomers_app/models/products.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_content.dart';
import 'package:ecomers_app/widgets/widgets_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ecomers_app/helpers/colors.dart';
import 'package:flutter_html/style.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentItemScreen extends StatefulWidget {
  final image;

  final title;
  final descrip;
  final price;
  final id;

  ContentItemScreen({
    @required this.image,
    @required this.title,
    @required this.descrip,
    @required this.price,
    @required this.id,
  });

  @override
  _ContentItemScreenState createState() => _ContentItemScreenState();
}

class _ContentItemScreenState extends State<ContentItemScreen> {
  int _colorSelected = 1;
  String _sizeSelected = 'M';
  bool _addToCart = false;
  int _imageIndex = 0;

  List<Widget> _listImages = [];

  getListProduct() {
    for (Product product in AppBrain.mListItems) {
      if (product.id == widget.id) {
        for (int i = 0; i < product.image.length; i++) {
          setState(() {
            if (product.image[0] == widget.image) {
              _listImages.add(
                Hero(
                  tag: widget.id,
                  child: CachedNetworkImage(
                    imageUrl: product.image[i],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            } else {
              _listImages.add(
                CachedNetworkImage(
                  imageUrl: product.image[i],
                  fit: BoxFit.cover,
                ),
              );
            }
          });
        }
      }
    }
  }

  @override
  void initState() {
    getListProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: false,
            slivers: [
              SliverAppBar(
                backgroundColor: theme.backgroundColor.withOpacity(0.5),
                automaticallyImplyLeading: false,
                toolbarHeight: 70.0,
                elevation: 0,
                pinned: true,
                title: CardBarContent(),
                expandedHeight: mSize.height / 2,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: mSize.width,
                    height: mSize.height / 2,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          isScrollControlled: true,
                          builder: (context) => PinchZoom(
                            image: _listImages[_imageIndex],
                            maxScale: 2.5,
                          ),
                        );
                      },
                      child: PageView(
                        children: _listImages,
                        onPageChanged: (index) {
                          setState(() {
                            _imageIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    width: mSize.width,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.only(
                          //bottomRight: Radius.circular(150.0),
                          ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShakeTransition(
                          duration: Duration(milliseconds: 900),
                          child: Text(
                            '${widget.title}'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: theme.accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1200),
                          child: Text(
                            '${widget.descrip}',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: theme.accentColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1600),
                          child: Row(
                            children: [
                              CardPrice(
                                price: widget.price,
                                colorImage: kColorPrimaryRGB,
                              ),
                              Spacer(),
                              Text(
                                getTranslationText(context, 'size'),
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color: theme.accentColor,
                                ),
                              ),
                              Row(
                                children: [
                                  CardSize(
                                    size: 'XS',
                                    isSelected: _sizeSelected == 'XS',
                                    onTap: () {
                                      setState(() {
                                        _sizeSelected = 'XS';
                                      });
                                    },
                                  ),
                                  CardSize(
                                    size: 'S',
                                    isSelected: _sizeSelected == 'S',
                                    onTap: () {
                                      setState(() {
                                        _sizeSelected = 'S';
                                      });
                                    },
                                  ),
                                  CardSize(
                                    size: 'M',
                                    isSelected: _sizeSelected == 'M',
                                    onTap: () {
                                      setState(() {
                                        _sizeSelected = 'M';
                                      });
                                    },
                                  ),
                                  CardSize(
                                    size: 'L',
                                    isSelected: _sizeSelected == 'L',
                                    onTap: () {
                                      setState(() {
                                        _sizeSelected = 'L';
                                      });
                                    },
                                  ),
                                  CardSize(
                                    size: 'XL',
                                    isSelected: _sizeSelected == 'XL',
                                    onTap: () {
                                      setState(() {
                                        _sizeSelected = 'XL';
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        ShakeTransition(
                          duration: Duration(milliseconds: 1900),
                          child: Row(
                            children: [
                              Text(
                                getTranslationText(context, 'color'),
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color: theme.accentColor,
                                ),
                              ),
                              Row(
                                children: [
                                  CardColor(
                                    isSelected: _colorSelected == 0,
                                    color: Colors.red,
                                    onTap: () {
                                      setState(() {
                                        _colorSelected = 0;
                                      });
                                    },
                                  ),
                                  CardColor(
                                    isSelected: _colorSelected == 1,
                                    color: Colors.blue,
                                    onTap: () {
                                      setState(() {
                                        _colorSelected = 1;
                                      });
                                    },
                                  ),
                                  CardColor(
                                    isSelected: _colorSelected == 2,
                                    color: Colors.deepOrangeAccent,
                                    onTap: () {
                                      setState(() {
                                        _colorSelected = 2;
                                      });
                                    },
                                  ),
                                  CardColor(
                                    isSelected: _colorSelected == 3,
                                    color: Colors.red,
                                    onTap: () {
                                      setState(() {
                                        _colorSelected = 3;
                                      });
                                    },
                                  ),
                                  CardColor(
                                    isSelected: _colorSelected == 4,
                                    color: Colors.green,
                                    onTap: () {
                                      setState(() {
                                        _colorSelected = 4;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 60.0, left: 10.0, right: 10.0),
                    child: Html(
                      data: kHtmlBody01,
                      style: {
                        'div': Style(
                          color: theme.accentColor,
                          textDecorationColor: theme.accentColor,
                        ),
                        'li': Style(
                          color: theme.accentColor,
                          textDecorationColor: theme.accentColor,
                        ),
                        'h2': Style(
                          color: theme.accentColor,
                          textDecorationColor: theme.accentColor,
                        ),
                      },
                      onLinkTap: (url) async {
                        if (await canLaunch(url)) {
                          launch(url);
                        }
                      },
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CardBottom(
              label: _addToCart
                  ? getTranslationText(context, 'add_cart_1')
                  : getTranslationText(context, 'add_cart_2'),
              color: _addToCart
                  ? theme.primaryColor.withGreen(1)
                  : theme.primaryColor,
              onTap: () {
                setState(() {
                  _addToCart = !_addToCart;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
