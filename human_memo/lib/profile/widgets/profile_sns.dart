import 'package:flutter/material.dart';
import 'package:human_memo/common/image_path.dart';
import 'package:human_memo/common/widgets/fade_in.dart';
import 'package:human_memo/models/person.dart';
import 'package:human_memo/profile/profile_view_model.dart';
import 'package:provider/provider.dart';

class SNSCollection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _isEdit = context.watch<ProfileViewModel>().isEdit;

    return _isEdit ? _EditSNS() : _DisplaySNS();
  }
}

class _EditSNS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SNS _sns =
        context.select<ProfileViewModel, SNS>((model) => model.person.sns);

    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _row(context, Image.asset(ImagePath.twitter), _sns.twitter, (text) {
              _sns.twitter = text;
              context.read<ProfileViewModel>().person.sns = _sns;
            }),
            SizedBox(height: 8),
            _row(context, Image.asset(ImagePath.instagram), _sns.instagram,
                (text) {
              _sns.instagram = text;
              context.read<ProfileViewModel>().person.sns = _sns;
            }),
            SizedBox(height: 8),
            _row(context, Image.asset(ImagePath.facebook), _sns.faceBook,
                (text) {
              _sns.faceBook = text;
              context.read<ProfileViewModel>().person.sns = _sns;
            }),
            SizedBox(height: 8),
            _row(context, Image.asset(ImagePath.youtube), _sns.youtube, (text) {
              _sns.youtube = text;
              context.read<ProfileViewModel>().person.sns = _sns;
            }),
            SizedBox(height: 8),
            _row(context, Image.asset(ImagePath.blog), _sns.blog, (text) {
              _sns.blog = text;
              context.read<ProfileViewModel>().person.sns = _sns;
            }),
            SizedBox(height: 8),
            _row(context, Image.asset(ImagePath.tiktok), _sns.tiktok, (text) {
              _sns.tiktok = text;
              context.read<ProfileViewModel>().person.sns = _sns;
            }),
          ],
        ),
      ),
    );
  }

  final Widget Function(BuildContext, Image, String, Function(String)) _row =
      (context, image, id, onChange) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: SizedBox(width: 30, height: 30, child: image),
        ),
        SizedBox(width: 20),
        _TextField(id: id, onChange: onChange),
        SizedBox(width: 8),
        // 後々追加するかも？SNSを共有したくない人向けのスイッチ制御
        //isEdit ? Switch(value: false, onChanged: onChange) : SizedBox()
      ],
    );
  };
}

class _DisplaySNS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SNS _sns =
        context.select<ProfileViewModel, SNS>((model) => model.person.sns);

    return FadeIn(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _row(context, Image.asset("images/twitter_icon.png"), _sns.twitter),
            SizedBox(height: 16),
            _row(context, Image.asset("images/instagram_icon.png"),
                _sns.instagram),
            SizedBox(height: 16),
            _row(context, Image.asset("images/facebook_icon.png"),
                _sns.faceBook),
            SizedBox(height: 16),
            _row(context, Image.asset("images/youtube_icon.png"), _sns.youtube),
            SizedBox(height: 16),
            _row(context, Image.asset("images/blog_icon.png"), _sns.blog),
            SizedBox(height: 16),
            _row(context, Image.asset("images/tiktok_icon.png"), _sns.tiktok),
          ],
        ),
      ),
    );
  }

  final Widget Function(BuildContext, Image, String) _row =
      (context, image, id) {
    return id == null || id.isEmpty
        ? SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: SizedBox(width: 30, height: 30, child: image),
              ),
              SizedBox(width: 20),
              Text(
                id == null ? "" : id,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(width: 8),
            ],
          );
  };
}

class _TextField extends StatelessWidget {
  final String id;
  final void Function(String) onChange;

  const _TextField({Key key, this.id, this.onChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        controller: TextEditingController(text: id),
        onChanged: onChange,
      ),
    );
  }
}
