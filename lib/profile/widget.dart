import 'dart:math';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWidget {
  static final cardColors = [
    Colors.green[200],
    Colors.blue[200],
    Colors.red[200],
    Colors.purple[200],
    Colors.pink[200],
    Colors.cyan[200],
    Colors.teal[200],
    Colors.indigo[200],
    Colors.deepOrange[200],
    Colors.brown[200],
    Colors.blueGrey[200],
  ];

  static Widget experienceCard(
      {required BuildContext context,
      required String title,
      String? subtitle,
      String? image,
      String? url,
      List<Widget>? cardDetailWidgets}) {
    int randomIndexColor = Random().nextInt(cardColors.length);

    return Theme(
      data: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          cardColor: cardColors[randomIndexColor],
          backgroundColor: cardColors[randomIndexColor],
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              cardTitle(
                context: context,
                title: title,
                image: image,
                url: url,
              ),
              CustomWidget._cardDivider,
              subtitle != null
                  ? Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                          ),
                    )
                  : SizedBox.shrink(),
              cardDetailWidgets != null
                  ? Column(
                      children: cardDetailWidgets,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget cardTitle({
    required BuildContext context,
    required String title,
    String? image,
    String? url,
  }) {
    return GestureDetector(
      onTap: () => url != null ? launch(url) : {},
      child: MouseRegion(
        cursor: url != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.contextMenu,
        child: Row(
          children: [
            if (image != null)
              Expanded(
                flex: 1,
                child: Container(
                  width: 64,
                  height: 64,
                  child: Image.asset(image),
                ),
              ),
            Expanded(
              flex: 4,
              child: Wrap(
                spacing: 1,
                direction: Axis.horizontal,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            if (url != null)
              Tooltip(
                message: 'Open url',
                child: Icon(
                  Icons.open_in_new,
                  color: Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }

  static Widget cardDetails(
      {required BuildContext context,
      required String text,
      required IconData icon}) {
    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  static Widget _cardDivider = Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Divider(
        color: Colors.white,
      ),
      SizedBox(
        height: 10,
      )
    ],
  );

  static Widget skillCard({
    required BuildContext context,
    required String title,
    required String image,
  }) {
    MediaQueryData media = MediaQuery.of(context);
    final double width = media.size.width;
    final bool isSmallScreen = width <= 1024;

    return Column(
      children: [
        Container(
            width: isSmallScreen ? 50 : 100,
            height: isSmallScreen ? 50 : 100,
            child: Image.asset(image)),
        Text(
          title,
          style: isSmallScreen
              ? Theme.of(context).textTheme.bodyText1
              : Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}
