class User {
  String id;
  String title;
  String name;
  String lastname;
  String othername;
  String email;
  String phone;
  String image;
  String isActive;
  String dateOfBirth;
  String address;
  String roleId;
  String schoolId;
  String activeClass;
  String token;

  User({ 
    this.id, this.name, this.othername, this.lastname, this.email, this.phone, this.image, this.dateOfBirth, 
    this.address, this.roleId, this.activeClass, this.schoolId, this.isActive});

  User.fromJson(Map<String, dynamic> json, String ttoken) {
    id = json['id'];
    address = json['address'];
    isActive = json['active'] ;
    title = json['title'];
    name = json['name'];
    lastname = json['lastname'];
    othername = json['othername'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    schoolId = json['school_id'];
    roleId = json['role_id'];
    activeClass = json['active_class'];
    dateOfBirth = json['dob'];
    token = ttoken;
  }


  User.fromRouteJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    isActive = json['active'] ;
    title = json['title'];
    name = json['name'];
    lastname = json['lastname'];
    othername = json['othername'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    schoolId = json['school_id'];
    roleId = json['role_id'];
    activeClass = json['active_class'];
    dateOfBirth = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['name'] = this.name;
    data['title'] = this.title;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['school_id'] = this.schoolId;
    data['role_id'] = this.roleId;
    data['active_class'] = this.activeClass;
    data['dob'] = this.dateOfBirth;
    data['token'] = this.token;
    
    return data;
  }

  String getTitleName() {
    return title + " " +name + " " + lastname;
  }
  String getFullName() {
    return name + " " + othername + " " +lastname;
  }
}


class Location {
  String street;
  String city;
  String state;
  Coordinates coordinates;

  Location({
    this.street,
    this.city,
    this.state,
    this.coordinates,
  });

  Location.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates.toJson();
    }
    return data;
  }
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}



