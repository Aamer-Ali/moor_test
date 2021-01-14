import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text().withLength(min: 1, max: 50)();

  DateTimeColumn get dueDate => dateTime().nullable()();

  BoolColumn get isCompleted => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Tasks], daos: [TaskDao])
class Database extends _$Database {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(
            path: "db.sqlite", logStatements: true));

  @override
  int get schemaVersion => 1;
}

@UseDao(tables: [
  Tasks
], queries: {
  'completedTasksGenerated': 'SELECT * FROM tasks WHERE is_completed = 1;',
})
class TaskDao extends DatabaseAccessor<Database> with _$TaskDaoMixin {
  final Database db;

  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTask() => select(tasks).get();

  Stream<List<Task>> watchAllTask() => select(tasks).watch();

  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);

  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);

  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);

  Future<List<Task>> getAllTaskOrderByDate() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.name, mode: OrderingMode.asc),
          ]))
        .get();
  }

  Future<List<Task>> getAllTaskCompleted() {
    return (select(tasks)
          ..orderBy([
            (t) => OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.name, mode: OrderingMode.asc),
          ])
          ..where((tbl) => tbl._isCompleted.equals(true)))
        .get();
  }

// Future<List<Task>> getAllTaskCompletedCustom() {
//   return customSelectedStream(d)
// }
}

// AppDatabase()
//     : super(FlutterQueryExecutor.inDatabaseFolder(
// path:"db.sqlite", logStatements: true));
//
// @override
// int get schemaVersion => 1;
