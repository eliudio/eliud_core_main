// ********************************** PopupMenu **********************************

import 'package:eliud_core_helpers/base/model_base.dart';
import 'package:eliud_core_main/apis/action_api/action_entity.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/model/abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/display_conditions_model.dart';
import 'package:eliud_core_main/model/menu_def_model.dart';

class PopupMenu extends ActionModel {
  final MenuDefModel? menuDef;

  PopupMenu(super.app, {super.conditions, this.menuDef})
      : super(actionType: PopupMenuEntity.label);

  @override
  ActionEntity toEntity({String? appId}) {
    return PopupMenuEntity(appId,
        conditions: (conditions != null) ? conditions!.toEntity() : null,
        menuDefID: menuDef!.documentID);
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) async {
    var referencesCollector = <ModelReference>[];
    if (menuDef != null) {
      referencesCollector.add(
          ModelReference(MenuDefModel.packageName, MenuDefModel.id, menuDef!));
    }
    return referencesCollector;
  }

  static Future<ActionModel> fromEntity(
      AppModel app, PopupMenuEntity entity) async {
    MenuDefModel? menuDefModel;
    if (entity.menuDefID != null) {
      try {
        await menuDefRepository(appId: entity.appID)!
            .get(entity.menuDefID)
            .then((val) {
          menuDefModel = val;
        }).catchError((error) {});
      } catch (_) {}
    }

    if (entity.appID == null) throw Exception('entity PopupMenu.appID is null');

    return PopupMenu(app,
        conditions: await DisplayConditionsModel.fromEntity(entity.conditions),
        menuDef: menuDefModel);
  }

  static Future<ActionModel?> fromEntityPlus(
      AppModel app, PopupMenuEntity entity) async {
    return fromEntity(app, entity);
  }

  @override
  String message() {
    return 'Open menu';
  }

  @override
  String describe() => 'Open popup menu';

  @override
  ActionModel copyWith(AppModel newApp) =>
      PopupMenu(newApp, conditions: conditions, menuDef: menuDef);
}
