import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/trensations_widgets.dart';
import 'package:ecomers_app/widgets/widgets_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';

class MakePaymentScreen extends StatefulWidget {
  @override
  _MakePaymentScreenState createState() => _MakePaymentScreenState();
}

class _MakePaymentScreenState extends State<MakePaymentScreen> {
  bool _progress = false;

  String selectedBankName = "BCA";
  String selectedBankUser = "Dicky Reynaldi";
  String selectedBankNoRek = "731 025 2527";

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShakeTransition(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10),
                        child: Text(
                          getTranslationText(context, 'select_bank'),
                          style: TextStyle(
                            color: theme.hintColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ),
                    ShakeTransition(
                      duration: Duration(milliseconds: 1200),
                      child: RadioListTile(
                        value: 0,
                        activeColor: theme.primaryColor,
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/bca_logo.png',
                              width: 70),
                        ),
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedBankName = 'BCA BANK';
                            selectedIndex = 0;
                          });
                        },
                      ),
                    ),
                    ShakeTransition(
                      duration: Duration(milliseconds: 1400),
                      child: RadioListTile(
                        value: 1,
                        activeColor: theme.primaryColor,
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/bri_logo.png',
                              width: 70),
                        ),
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedBankName = 'BRI BANK';
                            selectedIndex = 1;
                          });
                        },
                      ),
                    ),
                    ShakeTransition(
                      duration: Duration(milliseconds: 1600),
                      child: RadioListTile(
                        value: 2,
                        activeColor: theme.primaryColor,
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset('assets/images/mandiri_logo.png',
                              width: 70),
                        ),
                        groupValue: selectedIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedBankName = 'MANDIRI BANK';
                            selectedIndex = 2;
                          });
                        },
                      ),
                    ),
                    ShakeTransition(
                      duration: Duration(milliseconds: 2200),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.hintColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                        margin: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ShakeTransition(
                              duration: Duration(milliseconds: 1800),
                              child: CardTileBank(
                                title: 'Destination bank',
                                label: selectedBankName,
                              ),
                            ),
                            ShakeTransition(
                              duration: Duration(milliseconds: 2000),
                              child: CardTileBank(
                                title: 'On behalf of',
                                label: selectedBankUser,
                              ),
                            ),
                            ShakeTransition(
                              duration: Duration(milliseconds: 2200),
                              child: CardTileBank(
                                title: 'Account number',
                                label: selectedBankNoRek,
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
              bottom: 0,
              left: 0,
              right: 0,
              child: CardBottom(
                  onTap: () {
                    setState(() {
                      _progress = true;
                    });
                    Future.delayed(Duration(seconds: 4), () {
                      //  Get.to(OrderPayedSuccessfulScreen());

                      _showResultDialog(context);

                      setState(() {
                        _progress = false;
                      });
                    });
                  },
                  label: getTranslationText(context, 'done')),
            ),
          ],
        ),
      ),
    );
  }
}

Future _showResultDialog(BuildContext context) {
  final theme = Theme.of(context);
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        content: Container(
          // height: 290.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/done.png',
                width: MediaQuery.of(context).size.width / 3,
              ),
              SizedBox(height: 10),
              Text(
                getTranslationText(context, 'success'),
                style: theme.textTheme.headline3
                    .copyWith(color: theme.accentColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                getTranslationText(context, 'pay_success'),
                style: theme.textTheme.subtitle1
                    .copyWith(color: theme.accentColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  color: theme.primaryColor,
                  textColor: Colors.white,
                  child: Text(
                    getTranslationText(context, 'back_home'),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    //Navigator.pushReplacementNamed(context, '/welcome');
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/welcome', (route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CardTileBank extends StatelessWidget {
  final title;
  final label;

  CardTileBank({this.title, this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: theme.hintColor,
              fontSize: 13.0,
            ),
          ),
          Text(
            '$label',
            style: TextStyle(
              color: theme.accentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
