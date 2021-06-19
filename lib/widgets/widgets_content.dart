import 'package:ecomers_app/helpers/constants.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardColor extends StatelessWidget {
  final color;
  final bool isSelected;
  final onTap;

  CardColor(
      {@required this.color, @required this.isSelected, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.linear,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        padding: EdgeInsets.all(isSelected ? 10 : 10.0),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? theme.primaryColor : Colors.transparent,
              width: isSelected ? 5.0 : 0.0,
            )),
      ),
    );
  }
}

class CardSize extends StatelessWidget {
  final size;
  final bool isSelected;
  final onTap;

  CardSize(
      {@required this.size, @required this.isSelected, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear,
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
        decoration: BoxDecoration(
          color: isSelected ? theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: isSelected
                  ? Colors.transparent
                  : theme.accentColor.withOpacity(0.4),
              width: 0.8),
        ),
        child: Center(
          child: Text(
            '$size',
            style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : theme.accentColor.withOpacity(0.4)),
          ),
        ),
      ),
    );
  }
}

class CardBarContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RawBar(
          icon: FontAwesomeIcons.chevronLeft,
          colorCard: theme.backgroundColor,
          colorIcon: theme.accentColor,
          onTap: () => Navigator.pop(context),
        ),
        Hero(
          tag: 'cart',
          child: RawBar(
            icon: FontAwesomeIcons.shoppingBag,
            colorCard: theme.primaryColor,
            colorIcon: Colors.white,
            onTap: () {
              Navigator.pushNamed(context, '/caty');
            },
          ),
        ),
      ],
    );
  }
}

class RawBar extends StatelessWidget {
  final icon;
  final onTap;
  final colorCard, colorIcon;

  RawBar({this.icon, this.onTap, this.colorIcon, this.colorCard});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          color: colorCard,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: kBoxShadow01,
        ),
        child: Center(
          child: Icon(
            icon,
            color: colorIcon,
            size: 15.0,
          ),
        ),
      ),
    );
  }
}

class CardBottom extends StatelessWidget {
  final onTap;
  final label;
  final color;

  CardBottom({@required this.onTap, @required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              'assets/images/bottom_bar.svg',
              fit: BoxFit.fitWidth,
              color: color ?? theme.primaryColor,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 15,
            child: Center(
              child: Text(
                '$label',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
