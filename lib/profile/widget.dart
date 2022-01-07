import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWidget {
  static Widget experienceCard(
      {required BuildContext context,
      required String title,
      String? subtitle,
      String? image,
      String? url,
      List<Widget>? cardDetailWidgets}) {
    return Card(
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
    );
  }

  static Widget cardTitle({
    required BuildContext context,
    String? image,
    String? url,
  }) {
    return GestureDetector(
      onTap: () => url != null ? launch(url) : {},
      child: MouseRegion(
        cursor: url != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.contextMenu,
        child: Wrap(
          spacing: 10,
          direction: Axis.horizontal,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            image != null
                ? Container(
                    width: 48,
                    height: 48,
                    child: Image.asset(image),
                  )
                : SizedBox.shrink(),
            Text(
              'จิตวิทยาเชิงบวก',
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: Colors.white,
                  ),
            ),
            url != null
                ? Icon(
                    Icons.open_in_new,
                    color: Colors.white,
                  )
                : SizedBox.shrink(),
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
    required String text,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
