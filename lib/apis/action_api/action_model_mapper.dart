import '../../model/app_model.dart';
import 'action_entity.dart';
import 'action_model.dart';

abstract class ActionModelMapper {
  Future<ActionModel?> fromEntity(AppModel app, ActionEntity entity);
  Future<ActionModel?> fromEntityPlus(AppModel app, ActionEntity entity);
  ActionEntity? fromMap(Map snap);
}
