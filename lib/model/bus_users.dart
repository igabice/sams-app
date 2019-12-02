class busUsers {
  int id;
  String studentId;
  String address;
  String phone;
  Student student;

  busUsers({this.id, this.studentId, this.address, this.phone, this.student});

  busUsers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    address = json['address'];
    phone = json['phone'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_id'] = this.studentId;
    data['address'] = this.address;
    data['phone'] = this.phone;
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
  String activeClass;

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

  String getFullName() {
    return name + " " + othername + " " +lastname;
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