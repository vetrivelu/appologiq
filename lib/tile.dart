import 'dart:math';

import 'package:appologiq/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Tile extends StatelessWidget {
  const Tile({Key? key, this.title = "HELLO", required this.children, this.subtitle, this.date}) : super(key: key);

  final String title;
  final List<Widget> children;
  final String? subtitle;
  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 176,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 176,
                    width: 176,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            'https://picsum.photos/id/${Random().nextInt(400) + 300}/${Random().nextInt(300) + 200}/${Random().nextInt(400) + 300}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          right: 0,
                          child: CardIcon(
                            iconData: Icons.favorite_border,
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          child: CardIcon(
                            iconData: FontAwesomeIcons.lightbulb,
                            backgroundColor: Colors.yellow,
                            iconColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    title,
                    style: Palette.p2SemiBold,
                  ),
                ),
                subtitle == null
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          subtitle!,
                          style: Palette.p4regualr.copyWith(color: Colors.grey),
                        ),
                      ),
                Column(
                  children: children,
                )
              ],
            ),
          )),
    );
  }
}

class CardIcon extends StatelessWidget {
  const CardIcon({
    Key? key,
    this.onPressed,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.iconData,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            iconData,
            color: iconColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
