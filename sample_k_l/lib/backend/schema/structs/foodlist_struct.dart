// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodlistStruct extends FFFirebaseStruct {
  FoodlistStruct({
    String? title,
    String? detail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _detail = detail,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  set detail(String? val) => _detail = val;

  bool hasDetail() => _detail != null;

  static FoodlistStruct fromMap(Map<String, dynamic> data) => FoodlistStruct(
        title: data['title'] as String?,
        detail: data['detail'] as String?,
      );

  static FoodlistStruct? maybeFromMap(dynamic data) =>
      data is Map ? FoodlistStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'detail': _detail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'detail': serializeParam(
          _detail,
          ParamType.String,
        ),
      }.withoutNulls;

  static FoodlistStruct fromSerializableMap(Map<String, dynamic> data) =>
      FoodlistStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        detail: deserializeParam(
          data['detail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FoodlistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FoodlistStruct &&
        title == other.title &&
        detail == other.detail;
  }

  @override
  int get hashCode => const ListEquality().hash([title, detail]);
}

FoodlistStruct createFoodlistStruct({
  String? title,
  String? detail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FoodlistStruct(
      title: title,
      detail: detail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FoodlistStruct? updateFoodlistStruct(
  FoodlistStruct? foodlist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    foodlist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFoodlistStructData(
  Map<String, dynamic> firestoreData,
  FoodlistStruct? foodlist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (foodlist == null) {
    return;
  }
  if (foodlist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && foodlist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final foodlistData = getFoodlistFirestoreData(foodlist, forFieldValue);
  final nestedData = foodlistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = foodlist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFoodlistFirestoreData(
  FoodlistStruct? foodlist, [
  bool forFieldValue = false,
]) {
  if (foodlist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(foodlist.toMap());

  // Add any Firestore field values
  foodlist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFoodlistListFirestoreData(
  List<FoodlistStruct>? foodlists,
) =>
    foodlists?.map((e) => getFoodlistFirestoreData(e, true)).toList() ?? [];
