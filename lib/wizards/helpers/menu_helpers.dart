import 'package:eliud_core_main/apis/action_api/actions/goto_page.dart';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/model/icon_model.dart';
import 'package:flutter/material.dart';

import '../../model/menu_item_model.dart';
import '../tools/document_identifier.dart';

MenuItemModel menuItem(
        String uniqueId, AppModel app, pageID, text, IconData iconData) =>
    MenuItemModel(
        documentID: constructDocumentId(uniqueId: uniqueId, documentId: pageID),
        text: text,
        description: text,
        icon: IconModel(
            codePoint: iconData.codePoint,
            fontFamily: Icons.settings.fontFamily),
        action: GotoPage(app,
            pageID:
                constructDocumentId(uniqueId: uniqueId, documentId: pageID)));
