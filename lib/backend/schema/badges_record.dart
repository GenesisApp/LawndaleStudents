import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgesRecord extends FirestoreRecord {
  BadgesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "badge_name" field.
  String? _badgeName;
  String get badgeName => _badgeName ?? '';
  bool hasBadgeName() => _badgeName != null;

  // "badge_description" field.
  String? _badgeDescription;
  String get badgeDescription => _badgeDescription ?? '';
  bool hasBadgeDescription() => _badgeDescription != null;

  // "badge_image" field.
  String? _badgeImage;
  String get badgeImage => _badgeImage ?? '';
  bool hasBadgeImage() => _badgeImage != null;

  // "badge_7Days" field.
  bool? _badge7Days;
  bool get badge7Days => _badge7Days ?? false;
  bool hasBadge7Days() => _badge7Days != null;

  // "badge_30Days" field.
  bool? _badge30Days;
  bool get badge30Days => _badge30Days ?? false;
  bool hasBadge30Days() => _badge30Days != null;

  // "badge_100Days" field.
  bool? _badge100Days;
  bool get badge100Days => _badge100Days ?? false;
  bool hasBadge100Days() => _badge100Days != null;

  // "badge_200Days" field.
  bool? _badge200Days;
  bool get badge200Days => _badge200Days ?? false;
  bool hasBadge200Days() => _badge200Days != null;

  // "badge_365Days" field.
  bool? _badge365Days;
  bool get badge365Days => _badge365Days ?? false;
  bool hasBadge365Days() => _badge365Days != null;

  // "prayer_badge" field.
  bool? _prayerBadge;
  bool get prayerBadge => _prayerBadge ?? false;
  bool hasPrayerBadge() => _prayerBadge != null;

  // "badgeNumber" field.
  int? _badgeNumber;
  int get badgeNumber => _badgeNumber ?? 0;
  bool hasBadgeNumber() => _badgeNumber != null;

  void _initializeFields() {
    _badgeName = snapshotData['badge_name'] as String?;
    _badgeDescription = snapshotData['badge_description'] as String?;
    _badgeImage = snapshotData['badge_image'] as String?;
    _badge7Days = snapshotData['badge_7Days'] as bool?;
    _badge30Days = snapshotData['badge_30Days'] as bool?;
    _badge100Days = snapshotData['badge_100Days'] as bool?;
    _badge200Days = snapshotData['badge_200Days'] as bool?;
    _badge365Days = snapshotData['badge_365Days'] as bool?;
    _prayerBadge = snapshotData['prayer_badge'] as bool?;
    _badgeNumber = castToType<int>(snapshotData['badgeNumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('badges');

  static Stream<BadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesRecord.fromSnapshot(s));

  static Future<BadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesRecord.fromSnapshot(s));

  static BadgesRecord fromSnapshot(DocumentSnapshot snapshot) => BadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesRecordData({
  String? badgeName,
  String? badgeDescription,
  String? badgeImage,
  bool? badge7Days,
  bool? badge30Days,
  bool? badge100Days,
  bool? badge200Days,
  bool? badge365Days,
  bool? prayerBadge,
  int? badgeNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'badge_name': badgeName,
      'badge_description': badgeDescription,
      'badge_image': badgeImage,
      'badge_7Days': badge7Days,
      'badge_30Days': badge30Days,
      'badge_100Days': badge100Days,
      'badge_200Days': badge200Days,
      'badge_365Days': badge365Days,
      'prayer_badge': prayerBadge,
      'badgeNumber': badgeNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    return e1?.badgeName == e2?.badgeName &&
        e1?.badgeDescription == e2?.badgeDescription &&
        e1?.badgeImage == e2?.badgeImage &&
        e1?.badge7Days == e2?.badge7Days &&
        e1?.badge30Days == e2?.badge30Days &&
        e1?.badge100Days == e2?.badge100Days &&
        e1?.badge200Days == e2?.badge200Days &&
        e1?.badge365Days == e2?.badge365Days &&
        e1?.prayerBadge == e2?.prayerBadge &&
        e1?.badgeNumber == e2?.badgeNumber;
  }

  @override
  int hash(BadgesRecord? e) => const ListEquality().hash([
        e?.badgeName,
        e?.badgeDescription,
        e?.badgeImage,
        e?.badge7Days,
        e?.badge30Days,
        e?.badge100Days,
        e?.badge200Days,
        e?.badge365Days,
        e?.prayerBadge,
        e?.badgeNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
