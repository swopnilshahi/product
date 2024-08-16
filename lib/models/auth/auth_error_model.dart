import 'dart:convert';

class AuthErrorModel {
    String message;

    AuthErrorModel({
        required this.message,
    });

    factory AuthErrorModel.fromRawJson(String str) => AuthErrorModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AuthErrorModel.fromJson(Map<String, dynamic> json) => AuthErrorModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}

// json
// {
  
//   "message":"Invalid credentials"
    
// }