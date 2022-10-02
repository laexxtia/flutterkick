class User {
  String? id;
  String? name;
  String? position;
  String? profilePic;
  String? industry;
  String? gender;
  String? status;

  User({
    required this.id,
    required this.name,
    required this.position,
    required this.profilePic,
    required this.industry,
    required this.gender,
    required this.status,
  });

  User.fromJson(Map<String, dynamic> json) : id = json['id'], name = json['name'], position = json['position'],
        profilePic = json['profilePic'], industry = json['industry'], gender = json['gender'], status = json['status'];

  Map toJson() => {
    'id': id,
    'name': name,
    'position': position,
    'profilePic': profilePic,
    'industry': industry,
    'gender': gender,
    'status': status,
  };
}