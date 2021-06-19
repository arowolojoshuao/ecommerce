import 'dart:io';

import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputUserProfile extends StatelessWidget {
  final label;
  final hint;
  final icon;
  final controller;
  final bool isPass;

  InputUserProfile(
      {this.label, this.hint, this.icon, this.controller, this.isPass = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      width: mSize.width,
      decoration: BoxDecoration(
        color: theme.highlightColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPass,
        decoration: InputDecoration(
          hintText: '$hint',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: theme.highlightColor.withOpacity(0.8),
          ),
          prefixIcon: Icon(
            icon,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}

class CardUploadImageUser extends StatelessWidget {
  final File image;
  final name;
  final email;
  final onTap;

  CardUploadImageUser({this.image, this.name, this.email, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
      child: SizedBox(
        width: mSize.width,
        height: 85.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShakeTransition(
              duration: Duration(milliseconds: 1000),
              child: InkWell(
                onTap: onTap,
                child: Hero(
                  tag: 'profile',
                  child: CircleAvatar(
                    maxRadius: 42.0,
                    backgroundColor: theme.primaryColor,
                    child: image == null
                        ? CircleAvatar(
                            maxRadius: 40.0,
                            backgroundColor: theme.primaryColor,
                            backgroundImage: NetworkImage(kProfile),
                          )
                        : Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            ShakeTransition(
              duration: Duration(milliseconds: 1200),
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$email',
                      style: TextStyle(
                        color: theme.accentColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
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

class CardBarProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              FontAwesomeIcons.chevronLeft,
              size: 20.0,
              color: Colors.white,
            ),
          ),
          Text(
            getTranslationText(context, 'profile'),
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0),
          ),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              FontAwesomeIcons.solidSave,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
