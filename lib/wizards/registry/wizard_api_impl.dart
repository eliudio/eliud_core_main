import 'package:eliud_core_main/apis/wizard_api/new_app_wizard_info.dart';
import 'package:eliud_core_main/apis/wizard_api/wizard_api.dart';

class WizardApiImpl extends WizardApi {
  @override
  void register(NewAppWizardInfo newAppWizardInfo) {
    NewAppWizardRegistry.registry().register(newAppWizardInfo);
  }
}
