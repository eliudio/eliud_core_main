// ********************************** FunctionToRun **********************************
// This action can only be instantiated programmatically and not stored in a repository.

import 'package:eliud_core_helpers/base/model_base.dart';
import 'package:eliud_core_main/apis/action_api/action_entity.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:eliud_core_main/model/app_model.dart';

class FunctionToRun extends ActionModel {
  final Function() actionToRun;

  FunctionToRun(super.app, {super.conditions, required this.actionToRun})
      : super(actionType: 'FunctionToRun');

  @override
  String message() => 'Running Function';

  @override
  ActionEntity toEntity({String? appId}) {
    throw Exception('Not implemented, not expected');
  }

  @override
  Future<List<ModelReference>> collectReferences({
    String? appId,
  }) {
    throw Exception('Not implemented, not expected');
  }

  @override
  String describe() => 'Run a function';

  @override
  ActionModel copyWith(AppModel newApp) =>
      FunctionToRun(newApp, conditions: conditions, actionToRun: actionToRun);
}
