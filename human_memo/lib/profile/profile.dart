import 'package:flutter/material.dart';
import 'package:human_memo/profile/profile_view_model.dart';
import 'package:human_memo/profile/widgets/profile_header.dart';
import 'package:human_memo/profile/widgets/profile_standard.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel(),
      child: SingleChildScrollView(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [ProfileHeader(), ProfileStandard()],
      ),
    );
  }
}
