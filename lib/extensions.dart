import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension FluentWidgetBuilder on Widget {
  Padding withPadding(EdgeInsetsGeometry padding) => Padding(
        padding: padding,
        child: this,
      );
}

extension WidgetExtensions on Widget {
  GestureDetector withOnTapOpenPageGesture(
          BuildContext context, Widget openPageContent) =>
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => openPageContent));
        },
        child: this,
      );
}
