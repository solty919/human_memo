import 'package:flutter/material.dart';
import 'package:human_memo/common/strings.dart';
import 'package:human_memo/diagram/diagram.dart';
import 'package:human_memo/persons/persons.dart';
import 'package:human_memo/profile/profile.dart';
import 'package:human_memo/trade/trade.dart';

void main() {
  runApp(HumanMemo());
}

class HumanMemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
      ),
      home: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  final _widgets = [Diagram(), Persons(), Trade(), Profile()];
  final _items = [
    BottomNavigationBarItem(
        icon: Icon(Icons.account_tree), label: Strings.diagram),
    BottomNavigationBarItem(
        icon: Icon(Icons.supervisor_account), label: Strings.list),
    BottomNavigationBarItem(icon: Icon(Icons.autorenew), label: Strings.trade),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_box), label: Strings.profile),
  ];

  void _onTap(int index) => setState(() => this._index = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _items.elementAt(_index).label,
        ),
      ),
      body: _widgets.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: _items,
        currentIndex: _index,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
