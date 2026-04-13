import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClosetItemsRecord extends FirestoreRecord {
  ClosetItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _photoUrl = snapshotData['photo_url'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('closet_items');

  static Stream<ClosetItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClosetItemsRecord.fromSnapshot(s));

  static Future<ClosetItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClosetItemsRecord.fromSnapshot(s));

  static ClosetItemsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClosetItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClosetItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClosetItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClosetItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClosetItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClosetItemsRecordData({
  String? category,
  DateTime? createdAt,
  String? photoUrl,
  DocumentReference? userRef,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'created_at': createdAt,
      'photo_url': photoUrl,
      'user_ref': userRef,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClosetItemsRecordDocumentEquality implements Equality<ClosetItemsRecord> {
  const ClosetItemsRecordDocumentEquality();

  @override
  bool equals(ClosetItemsRecord? e1, ClosetItemsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.category == e2?.category &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.userRef == e2?.userRef &&
        e1?.name == e2?.name;
  }

  @override
  int hash(ClosetItemsRecord? e) => const ListEquality().hash(
      [e?.category, e?.createdAt, e?.tags, e?.photoUrl, e?.userRef, e?.name]);

  @override
  bool isValidKey(Object? o) => o is ClosetItemsRecord;
}
