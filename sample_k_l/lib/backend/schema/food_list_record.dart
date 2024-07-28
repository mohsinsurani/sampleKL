import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FoodListRecord extends FirestoreRecord {
  FoodListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "food_name" field.
  String? _foodName;
  String get foodName => _foodName ?? '';
  bool hasFoodName() => _foodName != null;

  // "food_detail" field.
  String? _foodDetail;
  String get foodDetail => _foodDetail ?? '';
  bool hasFoodDetail() => _foodDetail != null;

  void _initializeFields() {
    _foodName = snapshotData['food_name'] as String?;
    _foodDetail = snapshotData['food_detail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('FoodList');

  static Stream<FoodListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FoodListRecord.fromSnapshot(s));

  static Future<FoodListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FoodListRecord.fromSnapshot(s));

  static FoodListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FoodListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FoodListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FoodListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FoodListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FoodListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFoodListRecordData({
  String? foodName,
  String? foodDetail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'food_name': foodName,
      'food_detail': foodDetail,
    }.withoutNulls,
  );

  return firestoreData;
}

class FoodListRecordDocumentEquality implements Equality<FoodListRecord> {
  const FoodListRecordDocumentEquality();

  @override
  bool equals(FoodListRecord? e1, FoodListRecord? e2) {
    return e1?.foodName == e2?.foodName && e1?.foodDetail == e2?.foodDetail;
  }

  @override
  int hash(FoodListRecord? e) =>
      const ListEquality().hash([e?.foodName, e?.foodDetail]);

  @override
  bool isValidKey(Object? o) => o is FoodListRecord;
}
