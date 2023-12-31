/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core_main/model/home_menu_model.dart';

abstract class HomeMenuListState extends Equatable {
  const HomeMenuListState();

  @override
  List<Object?> get props => [];
}

class HomeMenuListLoading extends HomeMenuListState {}

class HomeMenuListLoaded extends HomeMenuListState {
  final List<HomeMenuModel?>? values;
  final bool? mightHaveMore;

  const HomeMenuListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'HomeMenuListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is HomeMenuListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class HomeMenuNotLoaded extends HomeMenuListState {}
