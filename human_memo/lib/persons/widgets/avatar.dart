import 'package:flutter/material.dart';
import 'package:human_memo/models/person.dart';

class Avatar extends StatelessWidget {
  final Person person;

  void _onTap() {}

  const Avatar({Key key, this.person}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onTap,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            CircleAvatar(
              radius: 20,
              backgroundImage: person.image.image,
            ),
            SizedBox(height: 8),
            Text(
              person.name,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              person.job,
              style: TextStyle(fontSize: 8),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
