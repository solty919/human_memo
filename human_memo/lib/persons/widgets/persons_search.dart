import 'package:flutter/material.dart';
import 'package:human_memo/common/strings.dart';
import 'package:human_memo/persons/persons_view_model.dart';
import 'package:provider/provider.dart';

class PersonsSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _Body();
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            40, 16, 40, MediaQuery.of(context).viewInsets.bottom + 16),
        child: SafeArea(
          child: Wrap(
            runSpacing: 24,
            children: [
              _title(context),
              _name(context),
              _birthday(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      Strings.filter,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _name(BuildContext context) {
    void _onChange(BuildContext context, String text) {
      final _model = context.read<PersonsViewModel>();
      _model.setSearch(_model.search..name = text);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.name,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        TextField(onChanged: (text) => _onChange(context, text))
      ],
    );
  }

  Widget _birthday(BuildContext context) {
    final List<String> _month = List.generate(13, (index) => index.toString())
      ..[0] = "";

    void _onChange(BuildContext context, String value) {
      final model = context.read<PersonsViewModel>();
      model.search.birthday = value;
      model.setSearch(model.search);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Strings.birthday,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Row(
          children: [
            Container(
              width: 100,
              child: DropdownButton(
                isExpanded: true,
                value: context.watch<PersonsViewModel>().search.birthday ?? "",
                items: _month.map((month) {
                  return DropdownMenuItem(value: month, child: Text(month));
                }).toList(),
                onChanged: (text) => _onChange(context, text),
              ),
            ),
            Text(Strings.month, style: Theme.of(context).textTheme.bodyText1)
          ],
        )
      ],
    );
  }
}
