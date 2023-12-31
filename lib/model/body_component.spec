{
  "id": "BodyComponent",
  "packageName": "eliud_core_main",
  "packageFriendlyName": "core",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": true,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "componentName",
      "defaultValue": "IDENTIFIER",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "componentName",
      "group": "componentName",
      "remark": "The component name, such as 'carousel' which is required on this body",
      "fieldType": "String",
      "bespokeFormField": "ExtensionTypeField"
    },
    {
      "fieldName": "componentId",
      "group": "componentId",
      "remark": "For that specific component, e.g. 'carousel', which Component ID, i.e. which carousel to include in the page",
      "fieldType": "String",
      "bespokeFormField": "ComponentIdField(widget.app, componentName: state.value!.componentName, originalValue: state.value!.componentId, trigger: (value, _) => _onComponentIdChanged(value))"
    }
  ],
  "groups": [
    {
        "group": "componentName",
        "description": "Component"
    },
    {
        "group": "componentId",
        "description": "Component spec"
    }
  ],
  "listFields": {
    "title": "value.componentName != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.componentName!)) : Container()",
    "subTitle": "value.componentId != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.componentId!)) : Container()"
  }
}
