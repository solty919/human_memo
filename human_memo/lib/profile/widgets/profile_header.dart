import 'dart:ui';

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _BackImage(),
        _Icon(),
      ],
    );
  }
}

class _BackImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 128,
      child: Image.network(
        "https://oshima-navi.com/img/topics/sunset5/image01.jpg",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://cdn-natgeo.nikkeibp.co.jp/atcl/news/16/c/100400101/ph_thumb.jpg?__scale=w:500,h:333&_sh=0fb0ed06b0'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: 3.0,
        ),
      ),
    );
  }
}
