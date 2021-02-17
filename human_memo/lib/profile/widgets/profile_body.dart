import 'package:flutter/material.dart';
import 'package:human_memo/common/extensions/datetime_formatter.dart';
import 'package:human_memo/common/strings.dart';
import 'package:human_memo/models/person.dart';
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
          SizedBox(height: 14),
          _SNS(),
          _Edit(),
        ],
      ),
    );
  }
}

class _Edit extends StatelessWidget {
  void _onTap(BuildContext context) {
    final _model = context.read<ProfileViewModel>();
    _model.setEdit(!_model.isEdit);
  }

  @override
  Widget build(BuildContext context) {
    final _isEdit =
        context.select<ProfileViewModel, bool>((model) => model.isEdit);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _isEdit
            ? Text(Strings.enterId, style: Theme.of(context).textTheme.caption)
            : SizedBox(),
        FlatButton(
          child: Text(
            _isEdit ? Strings.save : Strings.edit,
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => _onTap(context),
        )
      ],
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

class _SNS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SNS _sns = context.watch<ProfileViewModel>().person.sns;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _snsRow(
              context: context,
              image: Image.asset("images/twitter_icon.png"),
              id: _sns.twitter,
              onChange: (value) => print("")),
          SizedBox(height: 8),
          _snsRow(
              context: context,
              image: Image.asset("images/instagram_icon.png"),
              id: _sns.instagram,
              onChange: (value) => print("")),
          SizedBox(height: 8),
          _snsRow(
              context: context,
              image: Image.asset("images/facebook_icon.png"),
              id: _sns.faceBook,
              onChange: (value) => print("")),
          SizedBox(height: 8),
          _snsRow(
              context: context,
              image: Image.asset("images/tiktok_icon.png"),
              id: _sns.tiktok,
              onChange: (value) => print(""))
        ],
      ),
    );
  }

  Widget _snsRow(
      {BuildContext context,
      Image image,
      String id,
      void Function(bool) onChange}) {
    bool isEdit =
        context.select<ProfileViewModel, bool>((model) => model.isEdit);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: SizedBox(width: 30, height: 30, child: image),
        ),
        SizedBox(width: 20),
        isEdit
            ? _textFiled()
            : Text(
                id == null ? "" : id,
                style: Theme.of(context).textTheme.bodyText1,
              ),
        SizedBox(width: 8),
        isEdit ? Switch(value: false, onChanged: onChange) : SizedBox()
      ],
    );
  }

  Widget _textFiled() {
    return Flexible(
      child: TextField(
        onChanged: (text) {},
      ),
    );
  }
}
