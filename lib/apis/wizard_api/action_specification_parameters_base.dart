// You have to add this manually, for some reason it cannot be added automatically
import 'action_specification.dart';
import 'new_app_wizard_info.dart';

class ActionSpecificationParametersBase extends NewAppWizardParameters {
  late ActionSpecification actionSpecifications;

  ActionSpecificationParametersBase(
      {required bool requiresAccessToLocalFileSystem,
      required bool availableInLeftDrawer,
      required bool availableInRightDrawer,
      required bool availableInAppBar,
      required bool availableInHomeMenu,
      required bool available}) {
    actionSpecifications = ActionSpecification(
      requiresAccessToLocalFileSystem: requiresAccessToLocalFileSystem,
      availableInLeftDrawer: availableInLeftDrawer,
      availableInRightDrawer: availableInRightDrawer,
      availableInAppBar: availableInAppBar,
      availableInHomeMenu: availableInHomeMenu,
      available: available,
    );
  }
}
