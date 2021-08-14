// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultant_data.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultantData on ConsultantBase, Store {
  final _$consultantRecommendationAtom =
      Atom(name: 'ConsultantBase.consultantRecommendation');

  @override
  List<Consultant> get consultantRecommendation {
    _$consultantRecommendationAtom.reportRead();
    return super.consultantRecommendation;
  }

  @override
  set consultantRecommendation(List<Consultant> value) {
    _$consultantRecommendationAtom
        .reportWrite(value, super.consultantRecommendation, () {
      super.consultantRecommendation = value;
    });
  }

  final _$topicsAtom = Atom(name: 'ConsultantBase.topics');

  @override
  List<Topic> get topics {
    _$topicsAtom.reportRead();
    return super.topics;
  }

  @override
  set topics(List<Topic> value) {
    _$topicsAtom.reportWrite(value, super.topics, () {
      super.topics = value;
    });
  }

  final _$selectedTopicAtom = Atom(name: 'ConsultantBase.selectedTopic');

  @override
  Topic? get selectedTopic {
    _$selectedTopicAtom.reportRead();
    return super.selectedTopic;
  }

  @override
  set selectedTopic(Topic? value) {
    _$selectedTopicAtom.reportWrite(value, super.selectedTopic, () {
      super.selectedTopic = value;
    });
  }

  final _$isLoadingConsultantRecommendationAtom =
      Atom(name: 'ConsultantBase.isLoadingConsultantRecommendation');

  @override
  bool get isLoadingConsultantRecommendation {
    _$isLoadingConsultantRecommendationAtom.reportRead();
    return super.isLoadingConsultantRecommendation;
  }

  @override
  set isLoadingConsultantRecommendation(bool value) {
    _$isLoadingConsultantRecommendationAtom
        .reportWrite(value, super.isLoadingConsultantRecommendation, () {
      super.isLoadingConsultantRecommendation = value;
    });
  }

  final _$ConsultantBaseActionController =
      ActionController(name: 'ConsultantBase');

  @override
  void getConsultantRecommendation({int? limit}) {
    final _$actionInfo = _$ConsultantBaseActionController.startAction(
        name: 'ConsultantBase.getConsultantRecommendation');
    try {
      return super.getConsultantRecommendation(limit: limit);
    } finally {
      _$ConsultantBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchConsultantByNameTopic({required String nameTopic}) {
    final _$actionInfo = _$ConsultantBaseActionController.startAction(
        name: 'ConsultantBase.searchConsultantByNameTopic');
    try {
      return super.searchConsultantByNameTopic(nameTopic: nameTopic);
    } finally {
      _$ConsultantBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getConsultantRecommendationByTopic({required String topic}) {
    final _$actionInfo = _$ConsultantBaseActionController.startAction(
        name: 'ConsultantBase.getConsultantRecommendationByTopic');
    try {
      return super.getConsultantRecommendationByTopic(topic: topic);
    } finally {
      _$ConsultantBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
consultantRecommendation: ${consultantRecommendation},
topics: ${topics},
selectedTopic: ${selectedTopic},
isLoadingConsultantRecommendation: ${isLoadingConsultantRecommendation}
    ''';
  }
}
