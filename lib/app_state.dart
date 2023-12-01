import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _recentActivity = prefs.getBool('ff_recentActivity') ?? _recentActivity;
    });
    _safeInit(() {
      _pollLiveState = prefs.getBool('ff_pollLiveState') ?? _pollLiveState;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _showFullList = true;
  bool get showFullList => _showFullList;
  set showFullList(bool _value) {
    _showFullList = _value;
  }

  bool _showReactions = false;
  bool get showReactions => _showReactions;
  set showReactions(bool _value) {
    _showReactions = _value;
  }

  bool _photoAdded = false;
  bool get photoAdded => _photoAdded;
  set photoAdded(bool _value) {
    _photoAdded = _value;
  }

  bool _pdfAdded = false;
  bool get pdfAdded => _pdfAdded;
  set pdfAdded(bool _value) {
    _pdfAdded = _value;
  }

  bool _showOptions = false;
  bool get showOptions => _showOptions;
  set showOptions(bool _value) {
    _showOptions = _value;
  }

  bool _newestFirst = true;
  bool get newestFirst => _newestFirst;
  set newestFirst(bool _value) {
    _newestFirst = _value;
  }

  bool _messageOptionsVisible = false;
  bool get messageOptionsVisible => _messageOptionsVisible;
  set messageOptionsVisible(bool _value) {
    _messageOptionsVisible = _value;
  }

  bool _OneWeekAdmin = true;
  bool get OneWeekAdmin => _OneWeekAdmin;
  set OneWeekAdmin(bool _value) {
    _OneWeekAdmin = _value;
  }

  bool _OneMonthAdmin = false;
  bool get OneMonthAdmin => _OneMonthAdmin;
  set OneMonthAdmin(bool _value) {
    _OneMonthAdmin = _value;
  }

  bool _SixMonthsAdmin = false;
  bool get SixMonthsAdmin => _SixMonthsAdmin;
  set SixMonthsAdmin(bool _value) {
    _SixMonthsAdmin = _value;
  }

  bool _OneYearAdmin = false;
  bool get OneYearAdmin => _OneYearAdmin;
  set OneYearAdmin(bool _value) {
    _OneYearAdmin = _value;
  }

  int _bufferTimeCompleted = 0;
  int get bufferTimeCompleted => _bufferTimeCompleted;
  set bufferTimeCompleted(int _value) {
    _bufferTimeCompleted = _value;
  }

  int _bufferDay = 0;
  int get bufferDay => _bufferDay;
  set bufferDay(int _value) {
    _bufferDay = _value;
  }

  bool _replying = false;
  bool get replying => _replying;
  set replying(bool _value) {
    _replying = _value;
  }

  bool _PageRefresh = false;
  bool get PageRefresh => _PageRefresh;
  set PageRefresh(bool _value) {
    _PageRefresh = _value;
  }

  bool _WorshipUpdateFuture = true;
  bool get WorshipUpdateFuture => _WorshipUpdateFuture;
  set WorshipUpdateFuture(bool _value) {
    _WorshipUpdateFuture = _value;
  }

  bool _ScriptureUpdateFuture = false;
  bool get ScriptureUpdateFuture => _ScriptureUpdateFuture;
  set ScriptureUpdateFuture(bool _value) {
    _ScriptureUpdateFuture = _value;
  }

  bool _PrayerUpdateFuture = false;
  bool get PrayerUpdateFuture => _PrayerUpdateFuture;
  set PrayerUpdateFuture(bool _value) {
    _PrayerUpdateFuture = _value;
  }

  bool _recentActivity = true;
  bool get recentActivity => _recentActivity;
  set recentActivity(bool _value) {
    _recentActivity = _value;
    prefs.setBool('ff_recentActivity', _value);
  }

  bool _pollLiveState = false;
  bool get pollLiveState => _pollLiveState;
  set pollLiveState(bool _value) {
    _pollLiveState = _value;
    prefs.setBool('ff_pollLiveState', _value);
  }

  String _meetingDay = '';
  String get meetingDay => _meetingDay;
  set meetingDay(String _value) {
    _meetingDay = _value;
  }

  String _meetingTime = '';
  String get meetingTime => _meetingTime;
  set meetingTime(String _value) {
    _meetingTime = _value;
  }

  String _ageRange = '';
  String get ageRange => _ageRange;
  set ageRange(String _value) {
    _ageRange = _value;
  }

  String _gender = '';
  String get gender => _gender;
  set gender(String _value) {
    _gender = _value;
  }

  String _groupCategory = '';
  String get groupCategory => _groupCategory;
  set groupCategory(String _value) {
    _groupCategory = _value;
  }

  bool _groupsFilterSet = false;
  bool get groupsFilterSet => _groupsFilterSet;
  set groupsFilterSet(bool _value) {
    _groupsFilterSet = _value;
  }

  List<DocumentReference> _groupLeaders = [];
  List<DocumentReference> get groupLeaders => _groupLeaders;
  set groupLeaders(List<DocumentReference> _value) {
    _groupLeaders = _value;
  }

  void addToGroupLeaders(DocumentReference _value) {
    _groupLeaders.add(_value);
  }

  void removeFromGroupLeaders(DocumentReference _value) {
    _groupLeaders.remove(_value);
  }

  void removeAtIndexFromGroupLeaders(int _index) {
    _groupLeaders.removeAt(_index);
  }

  void updateGroupLeadersAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _groupLeaders[_index] = updateFn(_groupLeaders[_index]);
  }

  void insertAtIndexInGroupLeaders(int _index, DocumentReference _value) {
    _groupLeaders.insert(_index, _value);
  }

  bool _series = false;
  bool get series => _series;
  set series(bool _value) {
    _series = _value;
  }

  bool _timerStarted = false;
  bool get timerStarted => _timerStarted;
  set timerStarted(bool _value) {
    _timerStarted = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
