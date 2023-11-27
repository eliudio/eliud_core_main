import 'package:flutter/material.dart';

import '../../../../../model/app_model.dart';
import '../../../../../model/rgb_model.dart';
import '../../../frontend/frontend_style.dart';
import '../../../frontend/has_menu.dart';
import '../../../frontend/types.dart';
import '../helper/menu_helper.dart';

class DefaultMenuImpl implements HasMenu {
  final FrontEndStyle _frontEndStyle;

  DefaultMenuImpl(this._frontEndStyle);

  @override
  Future<void> openMenu(AppModel app, BuildContext context,
      {required RelativeRect position,
      required List<AbstractMenuItemAttributes> menuItems,
      RgbModel? popupMenuBackgroundColorOverride}) async {
    return MenuHelper(_frontEndStyle).openMenu(app, context,
        position: position,
        menuItems: menuItems,
        popupMenuBackgroundColor: popupMenuBackgroundColorOverride);
  }
}
