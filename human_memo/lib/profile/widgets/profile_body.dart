import 'package:flutter/material.dart';
import 'package:human_memo/common/extensions/datetime_formatter.dart';
import 'package:human_memo/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("きりん", style: Theme.of(context).textTheme.headline3),
          SizedBox(height: 14),
          _Birthday(),
          SizedBox(height: 14),
          _Job(),
          SizedBox(height: 32),
          _sns(
              context: context,
              image: Image.asset("images/twitter_icon.png"),
              id: "Twitter",
              onChange: (value) => print("")),
          SizedBox(height: 8),
          _sns(
              context: context,
              image: Image.asset("images/instagram_icon.png"),
              id: "Instagram",
              onChange: (value) => print("")),
          SizedBox(height: 8),
          _sns(
              context: context,
              image: Image.asset("images/facebook_icon.png"),
              id: "Facebook",
              onChange: (value) => print("")),
          SizedBox(height: 8),
          _sns(
              context: context,
              image: Image.asset("images/tiktok_icon.png"),
              id: "Tiktok",
              onChange: (value) => print("")),
        ],
      ),
    );
  }
}

class _Birthday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cake_outlined,
        ),
        SizedBox(width: 8),
        Text(
            "${context.select<ProfileViewModel, DateTime>((model) {
              return model.person.birthday;
            }).yyyyMMdd()}",
            style: Theme.of(context).textTheme.bodyText1),
        SizedBox(width: 4),
        Text(
            "${context.select<ProfileViewModel, int>((model) => model.person.age).toString()}歳",
            style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}

class _Job extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.business,
        ),
        SizedBox(width: 8),
        Text(
            "${context.select<ProfileViewModel, String>((model) => model.person.job)}",
            style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}

Widget _sns(
    {BuildContext context,
    Image image,
    String id,
    void Function(bool) onChange}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: SizedBox(width: 30, height: 30, child: image),
      ),
      SizedBox(width: 20),
      Text(
        "$id",
        style: Theme.of(context).textTheme.bodyText1,
      ),
      SizedBox(width: 8),
      Switch(value: false, onChanged: onChange)
    ],
  );
}
