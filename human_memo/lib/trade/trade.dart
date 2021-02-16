import 'package:flutter/material.dart';
import 'package:human_memo/trade/widgets/trade_profile_card.dart';

class Trade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 70),
          Text(
            "上スワイプで交換",
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(height: 120),
          TradeProfileCard()
        ],
      ),
    );
  }
}
