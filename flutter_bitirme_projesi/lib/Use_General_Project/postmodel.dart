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

class RegisterNewModel {
  String nameee = "";
  String surname = "";
  String kimlikNo = "";
  String password = "";
  String dogumTrh = "";
  int? telNo;
  bool? isAdmin;

  RegisterNewModel(
      {required this.nameee,
      required this.surname,
      required this.kimlikNo,
      required this.password,
      required this.dogumTrh,
      this.telNo,
      this.isAdmin});

  RegisterNewModel.fromJson(Map<String, dynamic> json) {
    nameee = json['name'];
    surname = json['surname'];
    kimlikNo = json['kimlikNo'];
    password = json['password'];
    dogumTrh = json['dogumTrh'];
    telNo = json['telNo'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.nameee;
    data['surname'] = this.surname;
    data['kimlikNo'] = this.kimlikNo;
    data['password'] = this.password;
    data['dogumTrh'] = this.dogumTrh;
    data['telNo'] = this.telNo;
    data['isAdmin'] = this.isAdmin;
    return data;
  }
}

class AuthModel {
  String? kimlikNo;
  String? password;

  AuthModel({this.kimlikNo, this.password});

  AuthModel.fromJson(Map<String, dynamic> json) {
    kimlikNo = json['kimlikNo'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kimlikNo'] = this.kimlikNo;
    data['password'] = this.password;
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

class RegisterModel {
  String? name;
  String? surname;
  String? kimlikNo;
  String? password;
  String? dogumTrh;
  int? telNo;

  RegisterModel(
      {this.name,
      this.surname,
      this.kimlikNo,
      this.password,
      this.dogumTrh,
      this.telNo});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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

class ElectionModel {
  String? initDate;
  String? endDate;
  String? electionTitle;
  String? electionExplanation;
  String? electionType;
  List<String>? candidates;
  List<String>? voter;

  ElectionModel(
      {this.initDate,
      this.endDate,
      this.electionTitle,
      this.electionExplanation,
      this.electionType,
      this.candidates,
      this.voter});

  ElectionModel.fromJson(Map<String, dynamic> json) {
    initDate = json['initDate'];
    endDate = json['endDate'];
    electionTitle = json['electionTitle'];
    electionExplanation = json['electionExplanation'];
    electionType = json['electionType'];
    candidates = json['candidates'].cast<String>();
    voter = json['voter'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['initDate'] = this.initDate;
    data['endDate'] = this.endDate;
    data['electionTitle'] = this.electionTitle;
    data['electionExplanation'] = this.electionExplanation;
    data['electionType'] = this.electionType;
    data['candidates'] = this.candidates;
    data['voter'] = this.voter;
    return data;
  }
}

