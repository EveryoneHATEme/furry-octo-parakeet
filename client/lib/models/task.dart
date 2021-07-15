class Task {
  int id = 0;
  String name = '';
  String description = '';
  DateTime createdAt = DateTime.now();

  static int lastId = 0;

  Task(this.name, this.description, [DateTime? createdAt]) {
    this.name = name;
    this.description = description;
    this.createdAt = createdAt ?? DateTime.now();
    id = lastId;
    lastId = id + 1;
  }
}
