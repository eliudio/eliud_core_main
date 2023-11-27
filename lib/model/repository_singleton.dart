/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/repository_singleton.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'abstract_repository_singleton.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'dart:collection';
import '../model/app_bar_firestore.dart';
import '../model/app_bar_repository.dart';
import '../model/app_bar_cache.dart';
import '../model/dialog_firestore.dart';
import '../model/dialog_repository.dart';
import '../model/dialog_cache.dart';
import '../model/drawer_firestore.dart';
import '../model/drawer_repository.dart';
import '../model/drawer_cache.dart';
import '../model/grid_view_firestore.dart';
import '../model/grid_view_repository.dart';
import '../model/grid_view_cache.dart';
import '../model/home_menu_firestore.dart';
import '../model/home_menu_repository.dart';
import '../model/home_menu_cache.dart';
import '../model/member_medium_firestore.dart';
import '../model/member_medium_repository.dart';
import '../model/member_medium_cache.dart';
import '../model/member_public_info_firestore.dart';
import '../model/member_public_info_repository.dart';
import '../model/member_public_info_cache.dart';
import '../model/menu_def_firestore.dart';
import '../model/menu_def_repository.dart';
import '../model/menu_def_cache.dart';
import '../model/page_firestore.dart';
import '../model/page_repository.dart';
import '../model/page_cache.dart';
import '../model/platform_medium_firestore.dart';
import '../model/platform_medium_repository.dart';
import '../model/platform_medium_cache.dart';
import '../model/public_medium_firestore.dart';
import '../model/public_medium_repository.dart';
import '../model/public_medium_cache.dart';

class RepositorySingleton extends AbstractRepositorySingleton {
  final _appBarRepository = HashMap<String, AppBarRepository>();
  final _dialogRepository = HashMap<String, DialogRepository>();
  final _drawerRepository = HashMap<String, DrawerRepository>();
  final _gridViewRepository = HashMap<String, GridViewRepository>();
  final _homeMenuRepository = HashMap<String, HomeMenuRepository>();
  final _memberMediumRepository = HashMap<String, MemberMediumRepository>();
  final _memberPublicInfoRepository =
      MemberPublicInfoCache(MemberPublicInfoFirestore());
  final _menuDefRepository = HashMap<String, MenuDefRepository>();
  final _pageRepository = HashMap<String, PageRepository>();
  final _platformMediumRepository = HashMap<String, PlatformMediumRepository>();
  final _publicMediumRepository = PublicMediumCache(PublicMediumFirestore());

  @override
  AppBarRepository? appBarRepository(String? appId) {
    if ((appId != null) && (_appBarRepository[appId] == null)) {
      _appBarRepository[appId] = AppBarCache(AppBarFirestore(
          () => appRepository()!.getSubCollection(appId, 'appbar'), appId));
    }
    return _appBarRepository[appId];
  }

  @override
  DialogRepository? dialogRepository(String? appId) {
    if ((appId != null) && (_dialogRepository[appId] == null)) {
      _dialogRepository[appId] = DialogCache(DialogFirestore(
          () => appRepository()!.getSubCollection(appId, 'dialog'), appId));
    }
    return _dialogRepository[appId];
  }

  @override
  DrawerRepository? drawerRepository(String? appId) {
    if ((appId != null) && (_drawerRepository[appId] == null)) {
      _drawerRepository[appId] = DrawerCache(DrawerFirestore(
          () => appRepository()!.getSubCollection(appId, 'drawer'), appId));
    }
    return _drawerRepository[appId];
  }

  @override
  GridViewRepository? gridViewRepository(String? appId) {
    if ((appId != null) && (_gridViewRepository[appId] == null)) {
      _gridViewRepository[appId] = GridViewCache(GridViewFirestore(
          () => appRepository()!.getSubCollection(appId, 'gridview'), appId));
    }
    return _gridViewRepository[appId];
  }

  @override
  HomeMenuRepository? homeMenuRepository(String? appId) {
    if ((appId != null) && (_homeMenuRepository[appId] == null)) {
      _homeMenuRepository[appId] = HomeMenuCache(HomeMenuFirestore(
          () => appRepository()!.getSubCollection(appId, 'homemenu'), appId));
    }
    return _homeMenuRepository[appId];
  }

  @override
  MemberMediumRepository? memberMediumRepository(String? appId) {
    if ((appId != null) && (_memberMediumRepository[appId] == null)) {
      _memberMediumRepository[appId] = MemberMediumCache(MemberMediumFirestore(
          () => appRepository()!.getSubCollection(appId, 'membermedium'),
          appId));
    }
    return _memberMediumRepository[appId];
  }

  @override
  MemberPublicInfoRepository? memberPublicInfoRepository() {
    return _memberPublicInfoRepository;
  }

  @override
  MenuDefRepository? menuDefRepository(String? appId) {
    if ((appId != null) && (_menuDefRepository[appId] == null)) {
      _menuDefRepository[appId] = MenuDefCache(MenuDefFirestore(
          () => appRepository()!.getSubCollection(appId, 'menudef'), appId));
    }
    return _menuDefRepository[appId];
  }

  @override
  PageRepository? pageRepository(String? appId) {
    if ((appId != null) && (_pageRepository[appId] == null)) {
      _pageRepository[appId] = PageCache(PageFirestore(
          () => appRepository()!.getSubCollection(appId, 'page'), appId));
    }
    return _pageRepository[appId];
  }

  @override
  PlatformMediumRepository? platformMediumRepository(String? appId) {
    if ((appId != null) && (_platformMediumRepository[appId] == null)) {
      _platformMediumRepository[appId] = PlatformMediumCache(
          PlatformMediumFirestore(
              () => appRepository()!.getSubCollection(appId, 'platformmedium'),
              appId));
    }
    return _platformMediumRepository[appId];
  }

  @override
  PublicMediumRepository? publicMediumRepository() {
    return _publicMediumRepository;
  }
}
