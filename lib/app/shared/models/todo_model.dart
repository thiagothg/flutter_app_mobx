class TodoModel {
  int id;
  String title;
  bool check = false;

  TodoModel({this.id, this.title = "", this.check = false});

  toJson() {
    return {"title": title, "check": check};
  }

  factory TodoModel.fromJson(Map json) {
    return TodoModel(
        id: json["id"], title: json["title"], check: json["check"]);
  }
}
