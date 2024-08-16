
import 'dart:convert';

class AuthModel {
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;
    String token;
    String refreshToken;

    AuthModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.token,
        required this.refreshToken,
    });

    factory AuthModel.fromRawJson(String str) => AuthModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        token: json["token"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
        "refreshToken": refreshToken,
    };
}
