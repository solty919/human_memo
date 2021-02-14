import 'package:flutter/material.dart';

class UpSwipe extends StatefulWidget {
  final Widget child;
  final Function onComplete;

  const UpSwipe({Key key, this.onComplete, this.child}) : super(key: key);

  @override
  _UpSwipeState createState() => _UpSwipeState();
}

class _UpSwipeState extends State<UpSwipe> with TickerProviderStateMixin {
  Offset containerOffset = const Offset(0.0, 0.0);
  Offset dragStartPosition;
  Offset dragCurrentPosition;
  Offset dragEndPosition;

  AnimationController slideBackAnimation;
  AnimationController slideOutAnimation;

  Tween<Offset> slideOutTween;

  @override
  void initState() {
    /// コンテナのドラッグを途中で解除した場合のアニメーション処理を設定します
    slideBackAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addListener(() => setState(() {
            /// コンテナのドラッグが解除された座標(dragEndPosition)から
            /// 初期位置(Offset(0, 0))までの座標を Curves.elasticOut にて補完します
            containerOffset = Offset.lerp(
                dragEndPosition,
                const Offset(0.0, 0.0),
                Curves.elasticOut.transform(slideBackAnimation.value));
          }))
      ..addStatusListener((AnimationStatus status) {
        /// アニメーションの完了通知を受信した際に実行します
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStartPosition = null;
            dragCurrentPosition = null;
            dragEndPosition = null;
          });
        }
      });

    /// 一定距離コンテナがドラッグされた際のスライドアウト用のアニメーション処理を設定します
    slideOutAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )
      ..addListener(() => setState(() {
            /// 時間経過とともに変化するコンテナのポジション(Offset)を
            /// slideOutTweenを用いて計算し更新します
            containerOffset = slideOutTween.evaluate(slideOutAnimation);
          }))
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            dragStartPosition = null;
            dragCurrentPosition = null;
            slideOutTween = null;
          });
        }
      });

    super.initState();
  }

  @override
  void dispose() {
    slideBackAnimation.dispose();
    slideOutAnimation.dispose();

    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    dragStartPosition = details.globalPosition;

    if (slideBackAnimation.isAnimating) {
      slideBackAnimation.stop();
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      dragCurrentPosition = details.globalPosition;
      containerOffset = dragCurrentPosition - dragStartPosition;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    /// コンテナサイズと移動量を用いてどのエリアにドラッグされたかを判定します
    /// yの移動量(cardOffset.dy)がコンテナサイズの-100%を下回ったら上
    final dragAction = (containerOffset.dy / context.size.height) < -1.0;

    setState(() {
      if (dragAction) {
        final screenHeight = MediaQuery.of(context).size.height;
        slideOutTween =
            Tween(begin: containerOffset, end: Offset(0.0, -screenHeight));

        /// スライドアウトアニメーションを先頭フレームから実行します
        slideOutAnimation.forward(from: 0.0);
      } else {
        /// スライドバックアニメーションの開始点を現在のドラッグ位置に設定します
        dragEndPosition = containerOffset;

        /// スライドバックアニメーションを先頭フレームから実行します
        slideBackAnimation.forward(from: 0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return child();
  }

  Widget child() {
    return Transform(
        transform: Matrix4.translationValues(
            containerOffset.dx, containerOffset.dy, 0.0),
        child: GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: _onPanEnd,
            child: widget.child));
  }
}
