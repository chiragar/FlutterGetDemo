class UserModel {
  int? id;
  String? name;
  String? email;
  String? profilePic;
  String? hireDt;

  UserModel({this.id, this.name, this.email, this.profilePic, this.hireDt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePic = json['profilePic'];
    hireDt = json['hireDt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profilePic'] = this.profilePic;
    data['hireDt'] = this.hireDt;
    return data;
  }
}

var userList = [
  UserModel(
      id: 13456,
      name: "Raj Shah",
      email: "raj@jdeanztech.com",
      profilePic: "",
      hireDt: "10-04-2024"),
  UserModel(
      id: 198765,
      name: "Kavi Patel",
      email: "kavi@jdeanztech.com",
      profilePic: "",
      hireDt: "08-04-2024"),
  UserModel(
      id: 125423,
      name: "Kalpen Panda",
      email: "kalpen@jdeanztech.com",
      profilePic: "",
      hireDt: "05-02-2024"),
  UserModel(
      id: 3456789,
      name: "Maulik Joshi",
      email: "joshi1@jdeanztech.com",
      profilePic: "",
      hireDt: "10-04-2024"),
  UserModel(
      id: 3456,
      name: "Gopi Gandhi",
      email: "gopi@jdeanztech.com",
      profilePic: "",
      hireDt: "16-01-2024"),
  UserModel(
      id: 1234567,
      name: "Rami Mehul",
      email: "mehul@jdeanztech.com",
      profilePic: "",
      hireDt: "12-02-2024"),
  UserModel(
      id: 432567,
      name: "Krishna Patel",
      email: "krishna@jdeanztech.com",
      profilePic: "",
      hireDt: "12-12-2023"),
  UserModel(
      id: 987654,
      name: "Jasmit Bumrah",
      email: "jsmit@jdeanztech.com",
      profilePic: "",
      hireDt: "01-08-2023"),
  UserModel(
      id: 9873456,
      name: "Variku Gaja",
      email: "variku@jdeanztech.com",
      profilePic: "",
      hireDt: "11-05-2023"),
  UserModel(
      id: 9873457,
      name: "Lal bhai",
      email: "lalu@jdeanztech.com",
      profilePic: "",
      hireDt: "21-05-2023"),
  UserModel(
      id: 876543,
      name: "Amit Shah",
      email: "amit@jdeanztech.com",
      profilePic: "",
      hireDt: "04-03-2023"),
  UserModel(
      id: 23276543,
      name: "Naria Ramesh",
      email: "ramieshan@jdeanztech.com",
      profilePic: "",
      hireDt: "04-03-2023"),
  UserModel(
      id: 459867,
      name: "Kavita Krishnamurti",
      email: "kavita@jdeanztech.com",
      profilePic: "",
      hireDt: "14-02-2023"),
  UserModel(
      id: 22222,
      name: "Sita Fogaat",
      email: "sita@jdeanztech.com",
      profilePic: "",
      hireDt: "11-01-2023"),
  UserModel(
      id: 22223,
      name: "Gita Fogaat",
      email: "sita@jdeanztech.com",
      profilePic: "",
      hireDt: "10-01-2023"),
  UserModel(
      id: 22224,
      name: "Rita Shah",
      email: "rita@jdeanztech.com",
      profilePic: "",
      hireDt: "10-12-2021"),
  UserModel(
      id: 22225,
      name: "Morish Jha",
      email: "morish@jdeanztech.com",
      profilePic: "",
      hireDt: "10-11-2021"),
  UserModel(
      id: 22226,
      name: "Girish Vadhel",
      email: "girish@jdeanztech.com",
      profilePic: "",
      hireDt: "08-10-2021"),
  UserModel(
      id: 22227,
      name: "Dhruvam Jha",
      email: "dhruvam@jdeanztech.com",
      profilePic: "",
      hireDt: "08-08-2021"),
  UserModel(
      id: 22228,
      name: "Samshera",
      email: "sham@jdeanztech.com",
      profilePic: "",
      hireDt: "01-05-2021"),
  UserModel(
      id: 22229,
      name: "Gujjubhai",
      email: "gujju@jdeanztech.com",
      profilePic: "",
      hireDt: "01-01-2021"),
  UserModel(
      id: 333331,
      name: "Ritu Jaishwal",
      email: "ritu@jdeanztech.com",
      profilePic: "",
      hireDt: "01-11-2020"),
  UserModel(
      id: 333332,
      name: "Darshan Gandhi",
      email: "ritu@jdeanztech.com",
      profilePic: "",
      hireDt: "23-10-2020"),
  UserModel(
      id: 333333,
      name: "Priyal Patel",
      email: "priyal@jdeanztech.com",
      profilePic: "",
      hireDt: "23-07-2020"),
  UserModel(
      id: 333334,
      name: "Elica Patel",
      email: "elica@jdeanztech.com",
      profilePic: "",
      hireDt: "21-04-2020"),
  UserModel(
      id: 333335,
      name: "Kaushal Chaudhri",
      email: "kaushal@jdeanztech.com",
      profilePic: "",
      hireDt: "15-03-2020"),
  UserModel(
      id: 333336,
      name: "Vivel Patel",
      email: "kaushal@jdeanztech.com",
      profilePic: "",
      hireDt: "15-03-2020"),
  UserModel(
      id: 333337,
      name: "Pritish Kanani",
      email: "pritish@jdeanztech.com",
      profilePic: "",
      hireDt: "12-02-2020"),
  UserModel(
      id: 333338,
      name: "Birju Kanani",
      email: "birju@jdeanztech.com",
      profilePic: "",
      hireDt: "12-02-2019"),
  UserModel(
      id: 333339,
      name: "Keval Shah",
      email: "keval@jdeanztech.com",
      profilePic: "",
      hireDt: "12-12-2019"),
];
