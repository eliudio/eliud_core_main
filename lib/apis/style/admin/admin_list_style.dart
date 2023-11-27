import 'package:flutter/material.dart';

import '../../../model/app_model.dart';
import '../../../model/member_model.dart';

abstract class AdminListStyle {
  Widget floatingActionButton(
      AppModel app, BuildContext context, String heroTag, Widget child,
      {VoidCallback? onPressed});
  Widget divider(AppModel app, BuildContext context);
  BoxDecoration? boxDecorator(
      AppModel app, BuildContext context, MemberModel? member);
  Widget listItem(AppModel app, BuildContext context, String text);
  Widget progressIndicator(AppModel app, BuildContext context,
      {Animation<Color>? valueColor});
}
