import 'package:flutter/material.dart';
import 'package:human_memo/common/image_path.dart';
import 'package:human_memo/common/widgets/fade_in.dart';
import 'package:human_memo/common/widgets/up_swipe.dart';
import 'package:human_memo/trade/trade_view_model.dart';
import 'package:provider/provider.dart';

class TradeProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: UpSwipe(
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [_Standard(), SizedBox(height: 16), _SNSs()],
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
              context
                  .select<TradeViewModel, String>((model) => model.person.name),
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              context
                  .select<TradeViewModel, String>((model) => model.person.job),
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
    Image _image =
        context.select<TradeViewModel, Image>((model) => model.person.image);
    return Container(
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
            image: _image == null
                ? null
                : DecorationImage(
                    image: _image.image,
                    fit: BoxFit.cover,
                  ),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: 3.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 1),
              ),
            ]),
        child: _image == null
            ? Icon(
                Icons.account_box,
                size: 50,
              )
            : null);
  }
}

class _SNSs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sns(
            context,
            Image.asset(ImagePath.twitter),
            context.select<TradeViewModel, String>(
                (model) => model.person.sns.twitter)),
        SizedBox(height: 8),
        _sns(
            context,
            Image.asset(ImagePath.instagram),
            context.select<TradeViewModel, String>(
                (model) => model.person.sns.instagram)),
        SizedBox(height: 8),
        _sns(
            context,
            Image.asset(ImagePath.facebook),
            context.select<TradeViewModel, String>(
                (model) => model.person.sns.faceBook)),
        SizedBox(height: 8),
        _sns(
            context,
            Image.asset(ImagePath.blog),
            context.select<TradeViewModel, String>(
                (model) => model.person.sns.blog)),
        SizedBox(height: 8),
        _sns(
            context,
            Image.asset(ImagePath.tiktok),
            context.select<TradeViewModel, String>(
                (model) => model.person.sns.tiktok)),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _sns(BuildContext context, Image image, String id) {
    return id == null
        ? SizedBox()
        : Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(999),
                child: SizedBox(width: 20, height: 20, child: image),
              ),
              SizedBox(width: 8),
              Text(
                id,
                style: Theme.of(context).textTheme.caption,
              )
            ],
          );
  }
}
