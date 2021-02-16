import 'package:flutter/material.dart';
import 'package:human_memo/persons/persons_view_model.dart';
import 'package:provider/provider.dart';

class Persons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PersonsViewModel(),
      child: _Persons(),
    );
  }
}

class _Persons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<PersonsViewModel>().persons.length,
        itemBuilder: (context, index) {
          var person =
              context.read<PersonsViewModel>().persons.elementAt(index);
          return ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: null,
              ),
              title: Text(person.name),
              subtitle: Text(person.birthday.toString()));
        });
  }
}
