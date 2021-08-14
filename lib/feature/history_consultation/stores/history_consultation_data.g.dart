// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_consultation_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultationHistoryData on ConsultationHistoryBase, Store {
  final _$consultationHistoriesAtom =
      Atom(name: 'ConsultationHistoryBase.consultationHistories');

  @override
  List<ConsultationHistory> get consultationHistories {
    _$consultationHistoriesAtom.reportRead();
    return super.consultationHistories;
  }

  @override
  set consultationHistories(List<ConsultationHistory> value) {
    _$consultationHistoriesAtom.reportWrite(value, super.consultationHistories,
        () {
      super.consultationHistories = value;
    });
  }

  final _$isLoadingHistoryAtom =
      Atom(name: 'ConsultationHistoryBase.isLoadingHistory');

  @override
  bool get isLoadingHistory {
    _$isLoadingHistoryAtom.reportRead();
    return super.isLoadingHistory;
  }

  @override
  set isLoadingHistory(bool value) {
    _$isLoadingHistoryAtom.reportWrite(value, super.isLoadingHistory, () {
      super.isLoadingHistory = value;
    });
  }

  final _$ConsultationHistoryBaseActionController =
      ActionController(name: 'ConsultationHistoryBase');

  @override
  void getConsultationHistories() {
    final _$actionInfo = _$ConsultationHistoryBaseActionController.startAction(
        name: 'ConsultationHistoryBase.getConsultationHistories');
    try {
      return super.getConsultationHistories();
    } finally {
      _$ConsultationHistoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consultationHistories: ${consultationHistories},
isLoadingHistory: ${isLoadingHistory}
    ''';
  }
}
