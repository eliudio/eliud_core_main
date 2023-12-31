import 'package:flutter/material.dart';

import '../../model/app_model.dart';
import '../../model/member_model.dart';
import '../../model/menu_item_model.dart';
import '../../model/public_medium_model.dart';
import '../action_api/action_model.dart';
import 'new_app_wizard_info.dart';

abstract class NewAppWizardInfoDefaultImpl extends NewAppWizardInfo {
  NewAppWizardInfoDefaultImpl(super.newAppWizardName, super.displayName);

  @override
  ActionModel? getAction(String uniqueId, NewAppWizardParameters parameters,
          AppModel app, String actionType) =>
      null;

  @override
  List<NewAppTask>? getCreateTasks(
    String uniqueId,
    AppModel app,
    NewAppWizardParameters parameters,
    MemberModel member,
    HomeMenuProvider homeMenuProvider,
    AppBarProvider appBarProvider,
    DrawerProvider leftDrawerProvider,
    DrawerProvider rightDrawerProvider,
  ) =>
      null;

  @override
  List<MenuItemModel>? getMenuItemsFor(String uniqueId, AppModel app,
          NewAppWizardParameters parameters, MenuType type) =>
      null;

  @override
  String? getPageID(String uniqueId, NewAppWizardParameters parameters,
          String pageType) =>
      null;

  @override
  PublicMediumModel? getPublicMediumModel(String uniqueId,
          NewAppWizardParameters parameters, String mediumType) =>
      null;

  @override
  AppModel updateApp(String uniqueId, NewAppWizardParameters parameters,
          AppModel adjustMe) =>
      adjustMe;

  @override
  Widget wizardParametersWidget(
      AppModel app, BuildContext context, NewAppWizardParameters parameters) {
    throw UnimplementedError();
  }
}
