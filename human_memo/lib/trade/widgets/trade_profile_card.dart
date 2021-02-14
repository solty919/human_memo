import 'package:flutter/material.dart';
import 'package:human_memo/common/widgets/fade_in.dart';
import 'package:human_memo/common/widgets/up_swipe.dart';

class TradeProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: UpSwipe(
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [_Standard(), SizedBox(height: 32)],
            ),
          ),
        ),
      ),
    );
  }
}

class _Standard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Icon(),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "きりんさん",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              "住所情報???",
              style: Theme.of(context).textTheme.caption,
            )
          ],
        )
      ],
    );
  }
}

class _Icon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 80.0,
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
