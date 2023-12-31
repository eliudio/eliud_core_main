{
  "id": "MemberMedium",
  "packageName": "eliud_core_main",
  "packageFriendlyName": "core",
  "isAppModel": true,
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": true,
    "generateFirestoreRepository": true,
    "generateRepositorySingleton": true,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": true,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true,
    "documentSubCollectionOf": "app"
  },
  "extraImports": {
    "entity": "import 'package:http/http.dart' as http;",
    "model": "import 'package:eliud_core_helpers/helpers/medium_collect_references.dart';"
  },
  "codeToExtractData": "    if (url != null) {\n      var theUrl = Uri.parse(url!);\n      final response = await http.get(theUrl);\n      var bytes = response.bodyBytes.toList();\n      theDocument['extract'] = bytes.toList();\n    }",
  "memberIdentifier": "authorId",
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "group": "general"
    },
    {
      "fieldName": "appId",
      "required": true,
      "displayName": "App ID",
      "fieldType": "String",
      "iconName": "vpn_key",
      "hidden": true,
      "group": "general"
    },
    {
      "fieldName": "authorId",
      "displayName": "Author ID",
      "fieldType": "String"
    },
    {
      "fieldName": "base",
      "displayName": "Base Name",
      "fieldType": "String"
    },
    {
      "fieldName": "ext",
      "displayName": "Extension",
      "fieldType": "String"
    },
    {
      "fieldName": "url",
      "displayName": "Image URL",
      "fieldType": "String"
    },
    {
      "fieldName": "ref",
      "displayName": "Image Ref on Firebase Storage",
      "fieldType": "String"
    },
    {
      "fieldName": "urlThumbnail",
      "displayName": "Image Thumbnail URL",
      "fieldType": "String"
    },
    {
      "fieldName": "refThumbnail",
      "displayName": "Image Ref on Firebase Storage",
      "fieldType": "String"
    },
    {
      "fieldName": "accessibleByGroup",
      "fieldType": "enum",
      "enumName": "MemberMediumAccessibleByGroup",
      "enumValues" : [ "public", "followers", "me", "specificMembers" ]
    },
    {
      "fieldName": "accessibleByMembers",
      "remark": "In case accessibleByGroup == SpecificMembers, then these are the members",
      "displayName": "Accessible By Members",
      "fieldType": "String",
      "iconName": "text_format",
      "arrayType": "Array",
      "hidden": true
    },
    {
      "fieldName": "readAccess",
      "displayName": "Members that can read this detail of the chat. This is determined in functions, based on accessibleByGroup and accessibleByMembers",
      "fieldType": "String",
      "iconName": "text_format",
      "arrayType": "Array",
      "hidden": true
    },
    {
      "fieldName": "mediumType",
      "fieldType": "enum",
      "enumName": "MediumType",
      "enumValues" : [ "photo", "video", "pdf", "text" ]
    },
    {
      "fieldName": "mediumWidth",
      "fieldType": "int"
    },
    {
      "fieldName": "mediumHeight",
      "fieldType": "int"
    },
    {
      "fieldName": "thumbnailWidth",
      "fieldType": "int"
    },
    {
      "fieldName": "thumbnailHeight",
      "fieldType": "int"
    },
    {
      "fieldName": "relatedMediumId",
      "remark": "In case a medium has multiple related media, then we refer to the related media with this field. For example, for a pdf, we store images of all pages. These are referenced using a chain of these references.",
      "fieldType": "String",
      "refCode": "referencesCollector.addAll(await mediumCollectReferences(appId: appId, relatedMediumId: relatedMediumId, repo: memberMediumRepository(appId: appId)!, packageName: packageName, id: id));"
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "imageSource",
        "description": "Source"
    },
    {
        "group": "filename",
        "description": "Photo"
    }
  ],
  "listFields": {
    "title": "Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.documentID))",
    "subTitle": "value.url != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.url!)) : Container()"
  }
}
