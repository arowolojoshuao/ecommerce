import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/provides/localization_constans.dart';
import 'package:ecomers_app/widgets/widgets_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangeAddress extends StatefulWidget {
  final newAddress;

  ChangeAddress({@required this.newAddress});

  @override
  _ChangeAddressState createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  var _newAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Address',
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    getTranslationText(context, 'new_address'),
                    style: TextStyle(color: theme.accentColor),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      boxShadow: kBoxShadow01,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextField(
                      controller: _newAddressController,
                      maxLines: null,
                      style: TextStyle(
                        color: theme.accentColor,
                      ),
                      decoration: InputDecoration(
                        hintText: getTranslationText(context, 'address'),
                        labelText: getTranslationText(context, 'address'),
                        border: InputBorder.none,
                        prefixIcon: Icon(FontAwesomeIcons.userAlt),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CardBottom(
              onTap: () {
                Navigator.pop(context);
                widget.newAddress(_newAddressController.text);
              },
              label: 'Save'),
        ],
      ),
    );
  }
}
