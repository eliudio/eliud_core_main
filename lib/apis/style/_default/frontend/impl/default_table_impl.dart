import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_table.dart';
import 'package:flutter/material.dart';

class DefaultTableImpl implements HasTable {
  @override
  Widget table(AppModel app, BuildContext context,
      {required List<TableRow> children}) {
    return Table(
      defaultColumnWidth: IntrinsicColumnWidth(),
      children: children,
    );
  }
}
