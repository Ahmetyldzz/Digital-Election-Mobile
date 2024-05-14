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
  String? id;
  String? password;

  AuthModel({this.id, this.password});

  AuthModel.fromJson(Map<String, dynamic> json) {
    id = json['kimlikNo'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kimlikNo'] = this.id;
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

class ElectionNewModel {
  String? sId;
  String? initDate;
  String? endDate;
  String? electionTitle;
  String? electionExplanation;
  ElectionType? electionType;
  List<Candidate>? candidates;
  List<Voter>? voter;
  int? iV;

  ElectionNewModel(
      {this.sId,
      this.initDate,
      this.endDate,
      this.electionTitle,
      this.electionExplanation,
      this.electionType,
      this.candidates,
      this.voter,
      this.iV});

  ElectionNewModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    initDate = json['initDate'];
    endDate = json['endDate'];
    electionTitle = json['electionTitle'];
    electionExplanation = json['electionExplanation'];
    electionType = json['electionType'] != null
        ? new ElectionType.fromJson(json['electionType'])
        : null;
    if (json['candidates'] != null) {
      candidates = <Candidate>[];
      json['candidates'].forEach((v) {
        candidates!.add(new Candidate.fromJson(v));
      });
    }
    if (json['voter'] != null) {
      voter = <Voter>[];
      json['voter'].forEach((v) {
        voter!.add(new Voter.fromJson(v));
      });
    }
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['initDate'] = this.initDate;
    data['endDate'] = this.endDate;
    data['electionTitle'] = this.electionTitle;
    data['electionExplanation'] = this.electionExplanation;
    if (this.electionType != null) {
      data['electionType'] = this.electionType!.toJson();
    }
    if (this.candidates != null) {
      data['candidates'] = this.candidates!.map((v) => v.toJson()).toList();
    }
    if (this.voter != null) {
      data['voter'] = this.voter!.map((v) => v.toJson()).toList();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class ElectionType {
  String? sId;
  String? electionType;
  int? iV;

  ElectionType({this.sId, this.electionType, this.iV});

  ElectionType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    electionType = json['electionType'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['electionType'] = this.electionType;
    data['__v'] = this.iV;
    return data;
  }
}

class Candidate {
  String? sId;
  CandidateId? candidateId;
  int? vote;
  int? iV;
  String? aboutCandidate;

  Candidate(
      {this.sId, this.candidateId, this.vote, this.iV, this.aboutCandidate});

  Candidate.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    candidateId = json['candidateId'] != null
        ? new CandidateId.fromJson(json['candidateId'])
        : null;
    vote = json['vote'];
    iV = json['__v'];
    aboutCandidate = json['aboutCandidate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.candidateId != null) {
      data['candidateId'] = this.candidateId!.toJson();
    }
    data['vote'] = this.vote;
    data['__v'] = this.iV;
    data['aboutCandidate'] = this.aboutCandidate;
    return data;
  }
}

class CandidateId {
  String? sId;
  String? name;
  String? surname;
  String? kimlikNo;
  String? password;
  String? dogumTrh;
  int? telNo;
  bool? isAdmin;
  int? iV;

  CandidateId(
      {this.sId,
      this.name,
      this.surname,
      this.kimlikNo,
      this.password,
      this.dogumTrh,
      this.telNo,
      this.isAdmin,
      this.iV});

  CandidateId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    surname = json['surname'];
    kimlikNo = json['kimlikNo'];
    password = json['password'];
    dogumTrh = json['dogumTrh'];
    telNo = json['telNo'];
    isAdmin = json['isAdmin'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['kimlikNo'] = this.kimlikNo;
    data['password'] = this.password;
    data['dogumTrh'] = this.dogumTrh;
    data['telNo'] = this.telNo;
    data['isAdmin'] = this.isAdmin;
    data['__v'] = this.iV;
    return data;
  }
}

class Voter {
  String? sId;
  String? kimlikNo;
  bool? isVoted;
  int? iV;

  Voter({this.sId, this.kimlikNo, this.isVoted, this.iV});

  Voter.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    kimlikNo = json['kimlikNo'];
    isVoted = json['isVoted'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['kimlikNo'] = this.kimlikNo;
    data['isVoted'] = this.isVoted;
    data['__v'] = this.iV;
    return data;
  }
}

class CandidatesModel {
  CandidateId? candidateId;
  int? vote;

  CandidatesModel({this.candidateId, this.vote});

  CandidatesModel.fromJson(Map<String, dynamic> json) {
    candidateId = json['candidateId'] != null
        ? new CandidateId.fromJson(json['candidateId'])
        : null;
    vote = json['vote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidateId != null) {
      data['candidateId'] = this.candidateId!.toJson();
    }
    data['vote'] = this.vote;
    return data;
  }
}
