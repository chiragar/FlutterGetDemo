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
    id: 13458,
    name: "Michael Johnson",
    email: "michael@example.com",
    profilePic: "https://example.com/michael.jpg",
    hireDt: "20-02-2024"
  ),
   UserModel(
    id: 13459,
    name: "Sarah Rodriguez",
    email: "sarah@example.com",
    profilePic: "https://example.com/sarah.jpg",
    hireDt: "05-04-2024"
  ),
   UserModel(
    id: 13460,
    name: "David Smith",
    email: "david@example.com",
    profilePic: "https://example.com/david.jpg",
    hireDt: "12-01-2024"
  ),
   UserModel(
    id: 13461,
    name: "Jennifer Lee",
    email: "jennifer@example.com",
    profilePic: "https://example.com/jennifer.jpg",
    hireDt: "28-03-2024"
  ),
   UserModel(
    id: 13462,
    name: "Kevin Brown",
    email: "kevin@example.com",
    profilePic: "https://example.com/kevin.jpg",
    hireDt: "03-02-2024"
  ),
   UserModel(
    id: 13463,
    name: "Jessica Taylor",
    email: "jessica@example.com",
    profilePic: "https://example.com/jessica.jpg",
    hireDt: "10-04-2024"
  ),
   UserModel(
    id: 13464,
    name: "Daniel Martinez",
    email: "daniel@example.com",
    profilePic: "https://example.com/daniel.jpg",
    hireDt: "18-03-2024"
  ),
   UserModel(
    id: 13465,
    name: "Emma Wilson",
    email: "emma@example.com",
    profilePic: "https://example.com/emma.jpg",
    hireDt: "22-01-2024"
  ),
   UserModel(
    id: 13466,
    name: "Matthew Davis",
    email: "matthew@example.com",
    profilePic: "https://example.com/matthew.jpg",
    hireDt: "07-04-2024"
  ),
];
