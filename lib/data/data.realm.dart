// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieDB extends _MovieDB with RealmEntity, RealmObjectBase, RealmObject {
  MovieDB(
    String title,
    String year,
    String movieID,
    String poster,
    String type,
  ) {
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'year', year);
    RealmObjectBase.set(this, 'movieID', movieID);
    RealmObjectBase.set(this, 'poster', poster);
    RealmObjectBase.set(this, 'type', type);
  }

  MovieDB._();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get year => RealmObjectBase.get<String>(this, 'year') as String;
  @override
  set year(String value) => RealmObjectBase.set(this, 'year', value);

  @override
  String get movieID => RealmObjectBase.get<String>(this, 'movieID') as String;
  @override
  set movieID(String value) => RealmObjectBase.set(this, 'movieID', value);

  @override
  String get poster => RealmObjectBase.get<String>(this, 'poster') as String;
  @override
  set poster(String value) => RealmObjectBase.set(this, 'poster', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  Stream<RealmObjectChanges<MovieDB>> get changes =>
      RealmObjectBase.getChanges<MovieDB>(this);

  @override
  Stream<RealmObjectChanges<MovieDB>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MovieDB>(this, keyPaths);

  @override
  MovieDB freeze() => RealmObjectBase.freezeObject<MovieDB>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'title': title.toEJson(),
      'year': year.toEJson(),
      'movieID': movieID.toEJson(),
      'poster': poster.toEJson(),
      'type': type.toEJson(),
    };
  }

  static EJsonValue _toEJson(MovieDB value) => value.toEJson();
  static MovieDB _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'title': EJsonValue title,
        'year': EJsonValue year,
        'movieID': EJsonValue movieID,
        'poster': EJsonValue poster,
        'type': EJsonValue type,
      } =>
        MovieDB(
          fromEJson(title),
          fromEJson(year),
          fromEJson(movieID),
          fromEJson(poster),
          fromEJson(type),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MovieDB._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, MovieDB, 'MovieDB', [
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('year', RealmPropertyType.string),
      SchemaProperty('movieID', RealmPropertyType.string),
      SchemaProperty('poster', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
