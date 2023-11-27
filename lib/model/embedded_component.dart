/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 model/embedded_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_helpers/etc/random.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_main/model/app_model.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/body_component_list_bloc.dart';
import '../model/body_component_list.dart';
import '../model/body_component_list_event.dart';
import '../model/body_component_model.dart';
import '../model/body_component_entity.dart';
import '../model/body_component_repository.dart';

import '../model/decoration_color_list_bloc.dart';
import '../model/decoration_color_list.dart';
import '../model/decoration_color_list_event.dart';
import '../model/decoration_color_model.dart';
import '../model/decoration_color_entity.dart';
import '../model/decoration_color_repository.dart';

import '../model/member_medium_list_bloc.dart';
import '../model/member_medium_list.dart';
import '../model/member_medium_list_event.dart';
import '../model/member_medium_model.dart';
import '../model/member_medium_entity.dart';
import '../model/member_medium_repository.dart';

import '../model/member_subscription_list_bloc.dart';
import '../model/member_subscription_list.dart';
import '../model/member_subscription_list_event.dart';
import '../model/member_subscription_model.dart';
import '../model/member_subscription_entity.dart';
import '../model/member_subscription_repository.dart';

import '../model/menu_item_list_bloc.dart';
import '../model/menu_item_list.dart';
import '../model/menu_item_list_event.dart';
import '../model/menu_item_model.dart';
import '../model/menu_item_entity.dart';
import '../model/menu_item_repository.dart';

typedef BodyComponentListChanged = Function(List<BodyComponentModel> values);
typedef DecorationColorListChanged = Function(
    List<DecorationColorModel> values);
typedef MemberMediumListChanged = Function(List<MemberMediumModel> values);
typedef MemberSubscriptionListChanged = Function(
    List<MemberSubscriptionModel> values);
typedef MenuItemListChanged = Function(List<MenuItemModel> values);

bodyComponentsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.bodyComponentsList(app, context, value, trigger);
decorationColorsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.decorationColorsList(app, context, value, trigger);
memberMediumsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberMediumsList(app, context, value, trigger);
memberSubscriptionsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.memberSubscriptionsList(
        app, context, value, trigger);
menuItemsList(app, context, value, trigger) =>
    EmbeddedComponentFactory.menuItemsList(app, context, value, trigger);

class EmbeddedComponentFactory {
/* 
 * bodyComponentsList function to construct a list of BodyComponentModel
 */
  static Widget bodyComponentsList(AppModel app, BuildContext context,
      List<BodyComponentModel> values, BodyComponentListChanged trigger) {
    BodyComponentInMemoryRepository inMemoryRepository =
        BodyComponentInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<BodyComponentListBloc>(
          create: (context) => BodyComponentListBloc(
            bodyComponentRepository: inMemoryRepository,
          )..add(LoadBodyComponentList()),
        )
      ],
      child: BodyComponentListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * decorationColorsList function to construct a list of DecorationColorModel
 */
  static Widget decorationColorsList(AppModel app, BuildContext context,
      List<DecorationColorModel> values, DecorationColorListChanged trigger) {
    DecorationColorInMemoryRepository inMemoryRepository =
        DecorationColorInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<DecorationColorListBloc>(
          create: (context) => DecorationColorListBloc(
            decorationColorRepository: inMemoryRepository,
          )..add(LoadDecorationColorList()),
        )
      ],
      child: DecorationColorListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * memberMediumsList function to construct a list of MemberMediumModel
 */
  static Widget memberMediumsList(AppModel app, BuildContext context,
      List<MemberMediumModel> values, MemberMediumListChanged trigger) {
    MemberMediumInMemoryRepository inMemoryRepository =
        MemberMediumInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberMediumListBloc>(
          create: (context) => MemberMediumListBloc(
            memberMediumRepository: inMemoryRepository,
          )..add(LoadMemberMediumList()),
        )
      ],
      child: MemberMediumListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * memberSubscriptionsList function to construct a list of MemberSubscriptionModel
 */
  static Widget memberSubscriptionsList(
      AppModel app,
      BuildContext context,
      List<MemberSubscriptionModel> values,
      MemberSubscriptionListChanged trigger) {
    MemberSubscriptionInMemoryRepository inMemoryRepository =
        MemberSubscriptionInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MemberSubscriptionListBloc>(
          create: (context) => MemberSubscriptionListBloc(
            memberSubscriptionRepository: inMemoryRepository,
          )..add(LoadMemberSubscriptionList()),
        )
      ],
      child: MemberSubscriptionListWidget(app: app, isEmbedded: true),
    );
  }

/* 
 * menuItemsList function to construct a list of MenuItemModel
 */
  static Widget menuItemsList(AppModel app, BuildContext context,
      List<MenuItemModel> values, MenuItemListChanged trigger) {
    MenuItemInMemoryRepository inMemoryRepository = MenuItemInMemoryRepository(
      trigger,
      values,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MenuItemListBloc>(
          create: (context) => MenuItemListBloc(
            menuItemRepository: inMemoryRepository,
          )..add(LoadMenuItemList()),
        )
      ],
      child: MenuItemListWidget(app: app, isEmbedded: true),
    );
  }
}

/* 
 * BodyComponentInMemoryRepository is an in memory implementation of BodyComponentRepository
 */
class BodyComponentInMemoryRepository implements BodyComponentRepository {
  final List<BodyComponentModel> items;
  final BodyComponentListChanged trigger;
  Stream<List<BodyComponentModel>>? theValues;

  /* 
     * Construct the BodyComponentInMemoryRepository
     */
  BodyComponentInMemoryRepository(this.trigger, this.items) {
    List<List<BodyComponentModel>> myList = <List<BodyComponentModel>>[];
    myList.add(items);
    theValues = Stream<List<BodyComponentModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<BodyComponentEntity> addEntity(
      String documentID, BodyComponentEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<BodyComponentEntity> updateEntity(
      String documentID, BodyComponentEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<BodyComponentModel> add(BodyComponentModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(BodyComponentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<BodyComponentModel> update(BodyComponentModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<BodyComponentModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<BodyComponentModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of BodyComponentModel base on a query
     */
  @override
  Stream<List<BodyComponentModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of BodyComponentModel, including linked models base on a query
     */
  @override
  Stream<List<BodyComponentModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of BodyComponentModel base on a query
     */
  @override
  StreamSubscription<List<BodyComponentModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of BodyComponentModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<BodyComponentModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<BodyComponentModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<BodyComponentModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<BodyComponentModel> listenTo(
      String documentId, BodyComponentChanged changed,
      {BodyComponentErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<BodyComponentModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<BodyComponentEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  BodyComponentEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * DecorationColorInMemoryRepository is an in memory implementation of DecorationColorRepository
 */
class DecorationColorInMemoryRepository implements DecorationColorRepository {
  final List<DecorationColorModel> items;
  final DecorationColorListChanged trigger;
  Stream<List<DecorationColorModel>>? theValues;

  /* 
     * Construct the DecorationColorInMemoryRepository
     */
  DecorationColorInMemoryRepository(this.trigger, this.items) {
    List<List<DecorationColorModel>> myList = <List<DecorationColorModel>>[];
    myList.add(items);
    theValues = Stream<List<DecorationColorModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<DecorationColorEntity> addEntity(
      String documentID, DecorationColorEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<DecorationColorEntity> updateEntity(
      String documentID, DecorationColorEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<DecorationColorModel> add(DecorationColorModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(DecorationColorModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<DecorationColorModel> update(DecorationColorModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<DecorationColorModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<DecorationColorModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of DecorationColorModel base on a query
     */
  @override
  Stream<List<DecorationColorModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of DecorationColorModel, including linked models base on a query
     */
  @override
  Stream<List<DecorationColorModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of DecorationColorModel base on a query
     */
  @override
  StreamSubscription<List<DecorationColorModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of DecorationColorModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<DecorationColorModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<DecorationColorModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<DecorationColorModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<DecorationColorModel> listenTo(
      String documentId, DecorationColorChanged changed,
      {DecorationColorErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<DecorationColorModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<DecorationColorEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  DecorationColorEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * MemberMediumInMemoryRepository is an in memory implementation of MemberMediumRepository
 */
class MemberMediumInMemoryRepository implements MemberMediumRepository {
  final List<MemberMediumModel> items;
  final MemberMediumListChanged trigger;
  Stream<List<MemberMediumModel>>? theValues;

  /* 
     * Construct the MemberMediumInMemoryRepository
     */
  MemberMediumInMemoryRepository(this.trigger, this.items) {
    List<List<MemberMediumModel>> myList = <List<MemberMediumModel>>[];
    myList.add(items);
    theValues = Stream<List<MemberMediumModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<MemberMediumEntity> addEntity(
      String documentID, MemberMediumEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<MemberMediumEntity> updateEntity(
      String documentID, MemberMediumEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberMediumModel> add(MemberMediumModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(MemberMediumModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberMediumModel> update(MemberMediumModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<MemberMediumModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberMediumModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of MemberMediumModel base on a query
     */
  @override
  Stream<List<MemberMediumModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of MemberMediumModel, including linked models base on a query
     */
  @override
  Stream<List<MemberMediumModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of MemberMediumModel base on a query
     */
  @override
  StreamSubscription<List<MemberMediumModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of MemberMediumModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<MemberMediumModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<MemberMediumModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberMediumModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<MemberMediumModel> listenTo(
      String documentId, MemberMediumChanged changed,
      {MemberMediumErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberMediumEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberMediumEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * MemberSubscriptionInMemoryRepository is an in memory implementation of MemberSubscriptionRepository
 */
class MemberSubscriptionInMemoryRepository
    implements MemberSubscriptionRepository {
  final List<MemberSubscriptionModel> items;
  final MemberSubscriptionListChanged trigger;
  Stream<List<MemberSubscriptionModel>>? theValues;

  /* 
     * Construct the MemberSubscriptionInMemoryRepository
     */
  MemberSubscriptionInMemoryRepository(this.trigger, this.items) {
    List<List<MemberSubscriptionModel>> myList =
        <List<MemberSubscriptionModel>>[];
    myList.add(items);
    theValues = Stream<List<MemberSubscriptionModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<MemberSubscriptionEntity> addEntity(
      String documentID, MemberSubscriptionEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<MemberSubscriptionEntity> updateEntity(
      String documentID, MemberSubscriptionEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberSubscriptionModel> add(MemberSubscriptionModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(MemberSubscriptionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<MemberSubscriptionModel> update(MemberSubscriptionModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<MemberSubscriptionModel> get(String? id,
      {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MemberSubscriptionModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of MemberSubscriptionModel base on a query
     */
  @override
  Stream<List<MemberSubscriptionModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of MemberSubscriptionModel, including linked models base on a query
     */
  @override
  Stream<List<MemberSubscriptionModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of MemberSubscriptionModel base on a query
     */
  @override
  StreamSubscription<List<MemberSubscriptionModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of MemberSubscriptionModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<MemberSubscriptionModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<MemberSubscriptionModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MemberSubscriptionModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<MemberSubscriptionModel> listenTo(
      String documentId, MemberSubscriptionChanged changed,
      {MemberSubscriptionErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MemberSubscriptionModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MemberSubscriptionEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MemberSubscriptionEntity? fromMap(Object? o,
      {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}

/* 
 * MenuItemInMemoryRepository is an in memory implementation of MenuItemRepository
 */
class MenuItemInMemoryRepository implements MenuItemRepository {
  final List<MenuItemModel> items;
  final MenuItemListChanged trigger;
  Stream<List<MenuItemModel>>? theValues;

  /* 
     * Construct the MenuItemInMemoryRepository
     */
  MenuItemInMemoryRepository(this.trigger, this.items) {
    List<List<MenuItemModel>> myList = <List<MenuItemModel>>[];
    myList.add(items);
    theValues = Stream<List<MenuItemModel>>.fromIterable(myList);
  }

  int _index(String documentID) {
    int i = 0;
    for (final item in items) {
      if (item.documentID == documentID) {
        return i;
      }
      i++;
    }
    return -1;
  }

  /* 
     * Add an entity
     */
  @override
  Future<MenuItemEntity> addEntity(String documentID, MenuItemEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update an entity
     */
  @override
  Future<MenuItemEntity> updateEntity(String documentID, MenuItemEntity value) {
    throw Exception('Not implemented');
  }

  /* 
     * Update a model
     */
  @override
  Future<MenuItemModel> add(MenuItemModel value) {
    items.add(value.copyWith(documentID: newRandomKey()));
    trigger(items);
    return Future.value(value);
  }

  /* 
     * Delete a model
     */
  @override
  Future<void> delete(MenuItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) items.removeAt(index);
    trigger(items);
    return Future.value();
  }

  /* 
     * Update a model
     */
  @override
  Future<MenuItemModel> update(MenuItemModel value) {
    int index = _index(value.documentID);
    if (index >= 0) {
      items.replaceRange(index, index + 1, [value]);
      trigger(items);
    }
    return Future.value(value);
  }

  /* 
     * Get a model
     */
  @override
  Future<MenuItemModel> get(String? id, {Function(Exception)? onError}) {
    int index = _index(id!);
    var completer = Completer<MenuItemModel>();
    completer.complete(items[index]);
    return completer.future;
  }

  /* 
     * Retrieve to a list of MenuItemModel base on a query
     */
  @override
  Stream<List<MenuItemModel>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Retrieve to a list of MenuItemModel, including linked models base on a query
     */
  @override
  Stream<List<MenuItemModel>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!;
  }

  /* 
     * Subscribe to a list of MenuItemModel base on a query
     */
  @override
  StreamSubscription<List<MenuItemModel>> listen(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Subscribe to a list of MenuItemModel, including linked models, base on a query
     */
  @override
  StreamSubscription<List<MenuItemModel>> listenWithDetails(trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return theValues!.listen((theList) => trigger(theList));
  }

  /* 
     * Flush the repository
     */
  @override
  void flush() {}

  /* 
     * Retrieve the list of models
     */
  @override
  Future<List<MenuItemModel>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  @override
  Future<List<MenuItemModel>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery}) {
    return Future.value(items);
  }

  /* 
     * Retrieve a subcollection of this collection
     */
  @override
  getSubCollection(String documentId, String name) {
    throw UnimplementedError();
  }

  /* 
   * Retrieve a timestamp
   */
  @override
  String timeStampToString(timeStamp) {
    throw UnimplementedError();
  }

  /* 
   * Subscribe to 1 document / 1 model
   */
  @override
  StreamSubscription<MenuItemModel> listenTo(
      String documentId, MenuItemChanged changed,
      {MenuItemErrorHandler? errorHandler}) {
    throw UnimplementedError();
  }

  @override
  Future<MenuItemModel> changeValue(
      String documentId, String fieldName, num changeByThisValue) {
    throw UnimplementedError();
  }

  @override
  Future<MenuItemEntity?> getEntity(String? id,
      {Function(Exception p1)? onError}) {
    throw UnimplementedError();
  }

  @override
  MenuItemEntity? fromMap(Object? o, {Map<String, String>? newDocumentIds}) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() async {}
}
