class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

class Deneme {
  String? sId;
  String? picturePath;
  int? iV;

  Deneme({this.sId, this.picturePath, this.iV});

  Deneme.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    picturePath = json['picturePath'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['picturePath'] = this.picturePath;
    data['__v'] = this.iV;
    return data;
  }
}

class VotingNameModel {
  String? name;
  String? surname;

  VotingNameModel({this.name, this.surname});

  VotingNameModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    return data;
  }
}


class RegistersModel {
  String? name;
  String? surname;
  String? kimlikNo;
  String? password;
  String? dogumTrh;
  int? telNo;

  RegistersModel(
      {this.name,
      this.surname,
      this.kimlikNo,
      this.password,
      this.dogumTrh,
      this.telNo});

  RegistersModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    kimlikNo = json['kimlikNo'];
    password = json['password'];
    dogumTrh = json['dogumTrh'];
    telNo = json['telNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['kimlikNo'] = this.kimlikNo;
    data['password'] = this.password;
    data['dogumTrh'] = this.dogumTrh;
    data['telNo'] = this.telNo;
    return data;
  }
}

class AnnouncementModel {
  String? announcementTitle;
  String? announcementBody;

  AnnouncementModel({this.announcementTitle, this.announcementBody});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    announcementTitle = json['announcementTitle'];
    announcementBody = json['announcementBody'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['announcementTitle'] = this.announcementTitle;
    data['announcementBody'] = this.announcementBody;
    return data;
  }
}