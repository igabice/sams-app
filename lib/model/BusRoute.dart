class BusRoute {
  int id;
  String active;
  String name;
  String capacity;
  String location;
  String cost;
  int schoolId;
  int createdBy;
  String createdAt;
  String updatedAt;
  int subscribedStudents;

  BusRoute(
      {this.id,
      this.active,
      this.name,
      this.capacity,
      this.location,
      this.cost,
      this.schoolId,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.subscribedStudents});

  BusRoute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    name = json['name'];
    capacity = json['capacity'];
    location = json['location'];
    cost = json['cost'];
    schoolId = int.parse(json['school_id']);
    createdBy = int.parse(json['created_by']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subscribedStudents = json['subscribed_students'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['name'] = this.name;
    data['capacity'] = this.capacity;
    data['location'] = this.location;
    data['cost'] = this.cost;
    data['school_id'] = this.schoolId;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subscribed_students'] = this.subscribedStudents;
    return data;
  }
}