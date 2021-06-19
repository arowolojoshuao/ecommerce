import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomers_app/helpers/constants.dart';
import 'package:ecomers_app/screens/caty/selected_caty_screen.dart';
import 'package:flutter/material.dart';

class CardCaty extends StatelessWidget {
  final title;

  final String image;

  final id;

  CardCaty({
    this.title,
    this.image,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SelectedCatyScreen(title: title)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: theme.backgroundColor,
          boxShadow: kBoxShadow01,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    topLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: Center(
                  child: Text(
                    '$title'.toUpperCase(),
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      color: theme.accentColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
