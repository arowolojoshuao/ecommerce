import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OrderPayedSuccessfulScreen extends StatefulWidget {
  @override
  _OrderPayedSuccessfulScreenState createState() =>
      _OrderPayedSuccessfulScreenState();
}

class _OrderPayedSuccessfulScreenState
    extends State<OrderPayedSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShakeTransition(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/img_pay.svg',
                    height: 250.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              ShakeTransition(
                duration: Duration(milliseconds: 1200),
                child: Text(
                  getTranslationText(context, 'message_1'),
                  style: TextStyle(
                    color: theme.accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ShakeTransition(
                duration: Duration(milliseconds: 1600),
                child: Text(
                  getTranslationText(context, 'message_2'),
                  style: TextStyle(
                    color: theme.hintColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              ShakeTransition(
                duration: Duration(milliseconds: 1800),
                child: SizedBox(
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/makePayment');
                    },
                    height: 45,
                    color: theme.primaryColor,
                    textColor: Colors.white,
                    child: Text(
                      getTranslationText(context, 'pay_now'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ShakeTransition(
                duration: Duration(milliseconds: 2000),
                child: SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlineButton(
                    onPressed: () => Navigator.pop(context),
                    color: theme.primaryColor,
                    textColor: theme.hintColor,
                    child: Text(getTranslationText(context, 'back_home')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
