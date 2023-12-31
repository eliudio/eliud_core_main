/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_component.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/member_component_bloc.dart';
import 'package:eliud_core_main/model/member_component_event.dart';
import 'package:eliud_core_main/model/member_model.dart';
import 'package:eliud_core_main/model/member_component_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_main/widgets/alert_widget.dart';
import 'package:eliud_core_main/tools/main_abstract_repository_singleton.dart';
import 'package:eliud_core_main/model/app_model.dart';

/*
 * AbstractMemberComponent is the base class to extend / implement in case you need to implement a component
 */
abstract class AbstractMemberComponent extends StatelessWidget {
  static String componentName = "members";
  final AppModel app;
  final String memberId;

  /*
   * Construct AbstractMemberComponent
   */
  AbstractMemberComponent(
      {super.key, required this.app, required this.memberId});

  /*
   * build the component
   */
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MemberComponentBloc>(
      create: (context) => MemberComponentBloc(
          memberRepository: memberRepository(appId: app.documentID)!)
        ..add(FetchMemberComponent(id: memberId)),
      child: _memberBlockBuilder(context),
    );
  }

  Widget _memberBlockBuilder(BuildContext context) {
    return BlocBuilder<MemberComponentBloc, MemberComponentState>(
        builder: (context, state) {
      if (state is MemberComponentLoaded) {
        return yourWidget(context, state.value);
      } else if (state is MemberComponentPermissionDenied) {
        return Icon(
          Icons.highlight_off,
          color: Colors.red,
          size: 30.0,
        );
      } else if (state is MemberComponentError) {
        return AlertWidget(app: app, title: 'Error', content: state.message);
      } else {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(app)
              .frontEndStyle()
              .progressIndicatorStyle()
              .progressIndicator(app, context),
        );
      }
    });
  }

  /*
   * Implement this method to provide your widget
   */
  Widget yourWidget(BuildContext context, MemberModel value);
}
