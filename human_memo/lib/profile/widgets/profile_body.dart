import 'package:flutter/material.dart';
import 'package:human_memo/common/extensions/datetime_formatter.dart';
import 'package:human_memo/common/strings.dart';
import 'package:human_memo/profile/profile_view_model.dart';
import 'package:human_memo/profile/widgets/profile_sns.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _Name(),
          SizedBox(height: 14),
          _Birthday(),
          SizedBox(height: 14),
          _Job(),
          SizedBox(height: 24),
          SNSCollection(),
          _Edit(),
        ],
      ),
    );
  }
}

class _Name extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        "${context.select<ProfileViewModel, String>((model) => model.person.name)}",
        style: Theme.of(context).textTheme.headline3);
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
