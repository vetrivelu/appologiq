import 'package:appologiq/tile.dart';
import 'package:flutter/material.dart';

import 'palette.dart';

class BigWidget extends StatelessWidget {
  const BigWidget({
    Key? key,
    required this.headIcon,
    required this.headerText,
    required this.title,
    this.data,
  }) : super(key: key);

  final IconData headIcon;
  final String headerText;
  final String title;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(headIcon),
              const SizedBox(width: 16),
              Text(headerText, style: Palette.p4regualr),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Things to do',
            style: Palette.h2,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data
              .map((e) => Tile(
                  title: e["title"].toString(),
                  children: (e["children"] as Map<IconData, String>)
                      .keys
                      .map((key) => (Row(
                            children: [
                              Icon(
                                key,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Text((e["children"] as Map<IconData, String>)[key] ?? '', style: Palette.p4regualr)
                            ],
                          )))
                      .toList()))
              .toList(),
        )
      ],
    );
  }
}
