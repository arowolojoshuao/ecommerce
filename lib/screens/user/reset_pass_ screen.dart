import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: SvgPicture.asset('assets/images/rest.svg'),
            ),
          ),
          Expanded(
            child: Container(
              color: theme.backgroundColor,
              child: Column(
                children: [
                  SizedBox(height: 25.0),
                  ShakeTransition(
                    offset: 140,
                    child: InputCard(
                      label: getTranslationText(context, 'resst_pass'),
                      hint: 'example@gmail.com',
                      icon: FontAwesomeIcons.solidEnvelope,
                    ),
                  ),
                  SizedBox(height: 25.0),
                  ShakeTransition(
                    duration: Duration(milliseconds: 1200),
                    offset: 140,
                    child: Container(
                      width: mSize.width,
                      height: 45.0,
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: Text(
                          getTranslationText(context, 'rest'),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  ShakeTransition(
                    duration: Duration(milliseconds: 1800),
                    offset: 140,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () =>
                                Navigator.pushNamed(context, '/signup'),
                            child: Text(
                              getTranslationText(context, 'signUp'),
                              style: TextStyle(
                                color: theme.primaryColor.withOpacity(0.5),
                                fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }
}
