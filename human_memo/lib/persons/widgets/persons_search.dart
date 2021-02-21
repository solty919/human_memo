import 'package:flutter/material.dart';
import 'package:human_memo/common/strings.dart';
import 'package:human_memo/main_view_model.dart';
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
            40, 16, 40, MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          runSpacing: 24,
          children: [
            _title(context),
            _name(context),
            _birthday(context),
            SizedBox(height: 80)
          ],
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
      final search = context.read<MainViewModel>().search;
      search.name = text;
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
      final model = context.read<MainViewModel>();
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
                value: context.watch<MainViewModel>().search.birthday ?? "",
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