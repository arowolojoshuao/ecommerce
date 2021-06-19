import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final label;
  final hint;
  final icon;
  final controller;
  final bool isPass;

  InputCard(
      {this.label, this.hint, this.icon, this.controller, this.isPass = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      width: mSize.width,
      decoration: BoxDecoration(
        color: theme.highlightColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label',
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
            ),
          ),
          SizedBox(height: 5.0),
          TextField(
            controller: controller,
            obscureText: isPass,
            style: TextStyle(
              color: theme.accentColor,
            ),
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
        ],
      ),
    );
  }
}
