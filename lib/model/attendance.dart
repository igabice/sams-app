

class Attendance {
  int id;
  int studentId;
  int staffId;
  String createdAt;
  Student student;

  Attendance(
      {this.id, this.studentId, this.staffId, this.createdAt, this.student});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    staffId = json['staff_id'];
    createdAt = json['created_at'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['staff_id'] = this.staffId;
    data['created_at'] = this.createdAt;
    if (this.student != null) {
      data['student'] = this.student.toJson();
    }
    return data;
  }
}

class Student {
  String name;
  String othername;
  String lastname;
  String address;
  String phone;
  String image;
  int activeClass;

  Student(
      {this.name,
      this.othername,
      this.lastname,
      this.address,
      this.phone,
      this.image,
      this.activeClass});

  Student.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    othername = json['othername'];
    lastname = json['lastname'];
    address = json['address'];
    phone = json['phone'];
    image = json['image'];
    activeClass = json['active_class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['othername'] = this.othername;
    data['lastname'] = this.lastname;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['active_class'] = this.activeClass;
    return data;
  }
}
