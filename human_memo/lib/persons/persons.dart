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
    final _filtered = context
        .select<PersonsViewModel, List<Person>>((model) => model.filtered);
    return GridView.builder(
        itemCount: _filtered.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: _aspectRatio > 1 ? 1 : _aspectRatio,
        ),
        itemBuilder: (context, index) {
          Person person =
              context.read<PersonsViewModel>().filtered.elementAt(index);
          return Avatar(person: person);
        });
  }
}
