/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_subscription_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/apis/apis.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_helpers/tools/has_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/model/background_model.dart';
import 'package:eliud_core_helpers/tools/delete_snackbar.dart';
import 'package:eliud_core_main/tools/etc/etc.dart';

import 'package:eliud_core_main/model/member_subscription_list_event.dart';
import 'package:eliud_core_main/model/member_subscription_list_state.dart';
import 'package:eliud_core_main/model/member_subscription_list_bloc.dart';
import 'package:eliud_core_main/model/member_subscription_model.dart';

import 'package:eliud_core_main/model/app_model.dart';

typedef MemberSubscriptionWidgetProvider = Function(
    MemberSubscriptionModel? value);

class MemberSubscriptionListWidget extends StatefulWidget with HasFab {
  final AppModel app;
  final BackgroundModel? listBackground;
  final MemberSubscriptionWidgetProvider? widgetProvider;
  final bool? readOnly;
  final String? form;
  //final MemberSubscriptionListWidgetState? state;
  final bool? isEmbedded;

  MemberSubscriptionListWidget(
      {super.key,
      required this.app,
      this.readOnly,
      this.form,
      this.widgetProvider,
      this.isEmbedded,
      this.listBackground});

  @override
  MemberSubscriptionListWidgetState createState() {
    return MemberSubscriptionListWidgetState();
  }

  @override
  Widget? fab(BuildContext context) {
    return null;
/*
    if ((readOnly != null) && readOnly!) return null;
    var state = MemberSubscriptionListWidgetState();
    return state.fab(context,);
*/
  }
}

class MemberSubscriptionListWidgetState
    extends State<MemberSubscriptionListWidget> {
/*
  Widget? fab(BuildContext aContext) {
    return null;
    return  !Apis.apis().getCoreApi().memberIsOwner(context, widget.app.documentID) ? null : 
      StyleRegistry.registry().styleWithApp(widget.app).adminListStyle().floatingActionButton(widget.app, context, 'PageFloatBtnTag', Icon(Icons.add),
      onPressed: () {
        Navigator.of(context).push(
          pageRouteBuilder(widget.app, page: BlocProvider.value(
              value: BlocProvider.of<MemberSubscriptionListBloc>(context),
              child: MemberSubscriptionForm(app:widget.app,
                  value: null,
                  formAction: FormAction.addAction)
          )),
        );
      },
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    return Apis.apis().getCoreApi().buildWhenAccessDetermined(widget.app,
        (context) {
      return BlocBuilder<MemberSubscriptionListBloc,
          MemberSubscriptionListState>(builder: (context, state) {
        if (state is MemberSubscriptionListLoading) {
          return StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context);
        } else if (state is MemberSubscriptionListLoaded) {
          final values = state.values;
          if ((widget.isEmbedded != null) && widget.isEmbedded!) {
            var children = <Widget>[];
            children.add(theList(
              context,
              values,
            ));
/*
              children.add(
                  StyleRegistry.registry().styleWithApp(widget.app).adminFormStyle().button(widget.app,
                      context, label: 'Add',
                      onPressed: () {
                        Navigator.of(context).push(
                                  pageRouteBuilder(widget.app, page: BlocProvider.value(
                                      value: BlocProvider.of<MemberSubscriptionListBloc>(context),
                                      child: MemberSubscriptionForm(app:widget.app,
                                          value: null,
                                          formAction: FormAction.addAction)
                                  )),
                                );
                      },
                    ));
*/
            return ListView(
                padding: const EdgeInsets.all(8),
                physics: ScrollPhysics(),
                shrinkWrap: true,
                children: children);
          } else {
            return theList(
              context,
              values,
            );
          }
        } else {
          return StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context);
        }
      });
    });
  }

  Widget theList(
    BuildContext context,
    values,
  ) {
    var member = Apis.apis().getCoreApi().getMember(context);
    return Container(
        decoration: widget.listBackground == null
            ? StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .boxDecorator(widget.app, context, member)
            : BoxDecorationHelper.boxDecoration(
                widget.app, member, widget.listBackground),
        child: ListView.separated(
            separatorBuilder: (context, index) => StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminListStyle()
                .divider(widget.app, context),
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: values.length,
            itemBuilder: (context, index) {
              final value = values[index];

              if (widget.widgetProvider != null) {
                return widget.widgetProvider!(value);
              }

              return MemberSubscriptionListItem(
                app: widget.app,
                value: value,
//            app: accessState.app,
                onDismissed: (direction) {
                  BlocProvider.of<MemberSubscriptionListBloc>(context)
                      .add(DeleteMemberSubscriptionList(value: value));
                  ScaffoldMessenger.of(context).showSnackBar(DeleteSnackBar(
                    message: "MemberSubscription $value.documentID",
                    onUndo: () =>
                        BlocProvider.of<MemberSubscriptionListBloc>(context)
                            .add(AddMemberSubscriptionList(value: value)),
                  ));
                },
                onTap: () async {},
              );
            }));
  }
}

class MemberSubscriptionListItem extends StatelessWidget {
  final AppModel app;
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final MemberSubscriptionModel value;

  MemberSubscriptionListItem({
    super.key,
    required this.app,
    required this.onDismissed,
    required this.onTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('__MemberSubscription_item_${value.documentID}'),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        title: Center(
            child: StyleRegistry.registry()
                .styleWithApp(app)
                .frontEndStyle()
                .textStyle()
                .text(app, context, value.app!.documentID)),
        subtitle: value.app!.title != null
            ? Center(
                child: StyleRegistry.registry()
                    .styleWithApp(app)
                    .frontEndStyle()
                    .textStyle()
                    .text(app, context, value.app!.title!))
            : Container(),
      ),
    );
  }
}
