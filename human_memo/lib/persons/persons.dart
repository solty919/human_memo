import 'package:flutter/material.dart';
import 'package:human_memo/models/person.dart';
import 'package:human_memo/persons/persons_view_model.dart';
import 'package:human_memo/persons/widgets/avatar.dart';
import 'package:provider/provider.dart';

class Persons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Persons();
  }
}

class _Persons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    final _aspectRatio = _screen.width / _screen.height;
    return GridView.builder(
        itemCount: context.watch<PersonsViewModel>().persons.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: _aspectRatio > 1 ? 1 : _aspectRatio),
        itemBuilder: (context, index) {
          Person person =
              context.read<PersonsViewModel>().persons.elementAt(index);
          return Avatar(person: person);
        });
  }
}
