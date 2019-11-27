class AttendanceTitle {
  int id;
  String title;
  String type;
  int count;

  AttendanceTitle({this.id, this.title, this.type, this.count});

  AttendanceTitle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['type'] = this.type;
    data['count'] = this.count;
    return data;
  }
}