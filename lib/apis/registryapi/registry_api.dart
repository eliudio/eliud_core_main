import 'package:eliud_core_main/apis/action_api/action_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/app_model.dart';
import 'component/component_constructor.dart';
import 'component/component_spec.dart';

typedef ActionSelected = void Function(ActionModel? action);

typedef OpenSelectActionWidgetFnct = Widget Function(
    {required AppModel app,
    required ActionModel? action,
    required ActionSelected actionSelected,
    required int containerPrivilege,
    required String label});

abstract class RegistryApi {
  ComponentDropDown? getSupportingDropDown(String componentId);
  List<String>? allInternalComponents(String pluginName);
  Widget component(
      BuildContext context, AppModel app, String componentName, String id,
      {Map<String, dynamic>? parameters, Key? key});
  List<String> getExtensions();
  ComponentSpec? getComponentSpecs(String name);
  void addInternalComponents(String pluginName, List<String> list);
  void register(
      {String? componentName, ComponentConstructor? componentConstructor});
  void addDropDownSupporter(String componentId, ComponentDropDown support);
  void addComponentSpec(
      String pluginName, String pluginFriendlyName, List<ComponentSpec> specs);
  void registerRetrieveRepository(
      String pluginName, String componentId, RetrieveRepository repository);
  Widget application({required AppModel app, required bool asPlaystore});
  Widget openSelectActionWidget(
      {required AppModel app,
      required ActionModel? action,
      required ActionSelected actionSelected,
      required int containerPrivilege,
      required String label});
  void snackbar(
    String text, {
    String? snackbarActionLabel,
    Function()? action,
  });
  void registerOpenSelectActionWidgetFnct(
      OpenSelectActionWidgetFnct openSelectActionWidgetFnct);
  RetrieveRepository? getRetrieveRepository(
      String pluginName, String componentId);
  Map<String, List<ComponentSpec>> componentSpecMap();
  Map<String, String> packageFriendlyNames();
  Future<void> openDialog(BuildContext context,
      {required AppModel app,
      required String id,
      Map<String, dynamic>? parameters});
}
