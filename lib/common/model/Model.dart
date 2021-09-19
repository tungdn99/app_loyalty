class Login {
  String username;
  String password;

  Login({required this.username, required this.password});

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        username: json["username"],
        password: json["password"],
      );
}

class DataLogin {
  DataLogin({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory DataLogin.fromJson(Map<String, dynamic> parsedJson) => DataLogin(
        accessToken: parsedJson["accessToken"],
        refreshToken: parsedJson["refreshToken"],
      );
}

class Voucher {
  int id;
  String title;
  String name;
  int point;

  Voucher({
    required this.id,
    required this.title,
    required this.name,
    required this.point,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        point: json["point"],
      );
}

class Post {
  int id;
  int userId;
  String title;
  String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      id: json["id"] == null ? null : json["id"],
      userId: json["userId"],
      title: json["title"],
      body: json["body"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
