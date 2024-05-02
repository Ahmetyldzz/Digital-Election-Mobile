class BackendFeatures {
  static const String baseUrl = "http://192.168.1.114:3000/api/";
  static String election = "$baseUrl + ${Paths.elections.name}";
  static String announcement = "$baseUrl + ${Paths.announcement.name}";
  static String candidate = "$baseUrl + ${Paths.candidate.name}";
  static String electiontypes = "$baseUrl + ${Paths.electiontypes.name}";
  static String signup = "$baseUrl + ${Paths.signup.name}";
  static String voterlist = "$baseUrl + ${Paths.voterlist.name}";
  static String directory = "$baseUrl + ${Paths.directory.name}";
}

enum Paths {
  candidate,
  elections,
  electiontypes,
  signup,
  voterlist,
  directory,
  announcement
}
