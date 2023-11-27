/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/component_registry.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/internal_component.dart';
import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/apis/apis.dart';

/* 
 * Component registry contains a list of components
 */
class ComponentRegistry {
  /* 
   * Initialise the component registry
   */
  init() {
    Apis.apis().getRegistryApi().addInternalComponents('eliud_core_main', [
      "apps",
      "appBars",
      "dialogs",
      "drawers",
      "gridViews",
      "homeMenus",
      "members",
      "memberPublicInfos",
      "menuDefs",
      "pages",
    ]);

    Apis.apis().getRegistryApi().register(
        componentName: "eliud_core_main_internalWidgets",
        componentConstructor: ListComponentFactory());
    Apis.apis()
        .getRegistryApi()
        .addComponentSpec('eliud_core_main', 'core', []);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'appBars', ({String? appId}) => appBarRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'dialogs', ({String? appId}) => dialogRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'drawers', ({String? appId}) => drawerRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'gridViews', ({String? appId}) => gridViewRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'homeMenus', ({String? appId}) => homeMenuRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_core_main',
        'memberMediums',
        ({String? appId}) => memberMediumRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'menuDefs', ({String? appId}) => menuDefRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository('eliud_core_main',
        'pages', ({String? appId}) => pageRepository(appId: appId)!);
    Apis.apis().getRegistryApi().registerRetrieveRepository(
        'eliud_core_main',
        'platformMediums',
        ({String? appId}) => platformMediumRepository(appId: appId)!);
  }
}
