import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// User outfits
class OutfitsRecord extends FirestoreRecord {
  OutfitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "top" field.
  DocumentReference? _top;
  DocumentReference? get top => _top;
  bool hasTop() => _top != null;

  // "bottom" field.
  DocumentReference? _bottom;
  DocumentReference? get bottom => _bottom;
  bool hasBottom() => _bottom != null;

  // "shoes" field.
  DocumentReference? _shoes;
  DocumentReference? get shoes => _shoes;
  bool hasShoes() => _shoes != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _top = snapshotData['top'] as DocumentReference?;
    _bottom = snapshotData['bottom'] as DocumentReference?;
    _shoes = snapshotData['shoes'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('outfits');

  static Stream<OutfitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutfitsRecord.fromSnapshot(s));

  static Future<OutfitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutfitsRecord.fromSnapshot(s));

  static OutfitsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OutfitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutfitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutfitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutfitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutfitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutfitsRecordData({
  String? name,
  DocumentReference? top,
  DocumentReference? bottom,
  DocumentReference? shoes,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'top': top,
      'bottom': bottom,
      'shoes': shoes,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutfitsRecordDocumentEquality implements Equality<OutfitsRecord> {
  const OutfitsRecordDocumentEquality();

  @override
  bool equals(OutfitsRecord? e1, OutfitsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.top == e2?.top &&
        e1?.bottom == e2?.bottom &&
        e1?.shoes == e2?.shoes &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(OutfitsRecord? e) => const ListEquality()
      .hash([e?.name, e?.top, e?.bottom, e?.shoes, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is OutfitsRecord;
}
