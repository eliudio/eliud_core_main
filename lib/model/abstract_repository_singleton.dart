/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/abstract_repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../model/app_bar_repository.dart';
import '../model/dialog_repository.dart';
import '../model/drawer_repository.dart';
import '../model/grid_view_repository.dart';
import '../model/home_menu_repository.dart';
import '../model/member_medium_repository.dart';
import '../model/member_public_info_repository.dart';
import '../model/menu_def_repository.dart';
import '../model/page_repository.dart';
import '../model/platform_medium_repository.dart';
import '../model/public_medium_repository.dart';
import 'package:eliud_core_main/tools/etc/member_collection_info.dart';

AppBarRepository? appBarRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.appBarRepository(appId);
DialogRepository? dialogRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.dialogRepository(appId);
DrawerRepository? drawerRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.drawerRepository(appId);
GridViewRepository? gridViewRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.gridViewRepository(appId);
HomeMenuRepository? homeMenuRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.homeMenuRepository(appId);
MemberMediumRepository? memberMediumRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.memberMediumRepository(appId);
MemberPublicInfoRepository? memberPublicInfoRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.memberPublicInfoRepository();
MenuDefRepository? menuDefRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.menuDefRepository(appId);
PageRepository? pageRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.pageRepository(appId);
PlatformMediumRepository? platformMediumRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.platformMediumRepository(appId);
PublicMediumRepository? publicMediumRepository({String? appId}) =>
    AbstractRepositorySingleton.singleton.publicMediumRepository();

abstract class AbstractRepositorySingleton {
  static List<MemberCollectionInfo> collections = [
    MemberCollectionInfo('membermedium', 'authorId'),
  ];
  static late AbstractRepositorySingleton singleton;

  AppBarRepository? appBarRepository(String? appId);
  DialogRepository? dialogRepository(String? appId);
  DrawerRepository? drawerRepository(String? appId);
  GridViewRepository? gridViewRepository(String? appId);
  HomeMenuRepository? homeMenuRepository(String? appId);
  MemberMediumRepository? memberMediumRepository(String? appId);
  MemberPublicInfoRepository? memberPublicInfoRepository();
  MenuDefRepository? menuDefRepository(String? appId);
  PageRepository? pageRepository(String? appId);
  PlatformMediumRepository? platformMediumRepository(String? appId);
  PublicMediumRepository? publicMediumRepository();

  void flush(String? appId) {
    appBarRepository(appId)!.flush();
    dialogRepository(appId)!.flush();
    drawerRepository(appId)!.flush();
    gridViewRepository(appId)!.flush();
    homeMenuRepository(appId)!.flush();
    memberMediumRepository(appId)!.flush();
    menuDefRepository(appId)!.flush();
    pageRepository(appId)!.flush();
    platformMediumRepository(appId)!.flush();
  }
}
