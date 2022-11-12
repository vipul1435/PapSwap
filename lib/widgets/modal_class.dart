// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//     Welcome({
//        required this.documents,
//     });

//     List<Document> documents;

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
//     };
// }

// class Document {
//     Document({
//        required this.name,
//        required this.fields,
//        required this.createTime,
//        required this.updateTime,
//     });

//     String name;
//     Fields fields;
//     DateTime createTime;
//     DateTime updateTime;

//     factory Document.fromJson(Map<String, dynamic> json) => Document(
//         name: json["name"],
//         fields: Fields.fromJson(json["fields"]),
//         createTime: DateTime.parse(json["createTime"]),
//         updateTime: DateTime.parse(json["updateTime"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "name": name,
//         "fields": fields.toJson(),
//         "createTime": createTime.toIso8601String(),
//         "updateTime": updateTime.toIso8601String(),
//     };
// }

// class Fields {
//     Fields({
//        required this.image,
//     });

//     IImage image;

//     factory Fields.fromJson(Map<String, dynamic> json) => Fields(
//         image: IImage.fromJson(json["image"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "image": image.toJson(),
//     };
// }

// class IImage {
//     IImage({
//        required this.stringValue,
//     });

//     String stringValue;

//     factory IImage.fromJson(Map<String, dynamic> json) => IImage(
//         stringValue: json["stringValue"],
//     );

//     Map<String, dynamic> toJson() => {
//         "stringValue": stringValue,
//     };
// }
import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
      required  this.documents,
    });

    List<Document> documents;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        documents: List<Document>.from(json["documents"].map((x) => Document.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
    };
}

class Document {
    Document({
       required this.name,
      required  this.fields,
       required this.createTime,
       required this.updateTime,
    });

    String name;
    Fields fields;
    DateTime createTime;
    DateTime updateTime;

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        name: json["name"],
        fields: Fields.fromJson(json["fields"]),
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "fields": fields.toJson(),
        "createTime": createTime.toIso8601String(),
        "updateTime": updateTime.toIso8601String(),
    };
}

class Fields {
    Fields({
      required  this.like,
      required  this.comment,
      required  this.image,
    });

    Like like;
    Comment comment;
    IImage image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        like: Like.fromJson(json["like"]),
        comment: Comment.fromJson(json["comment"]),
        image: IImage.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "like": like.toJson(),
        "comment": comment.toJson(),
        "image": image.toJson(),
    };
}

class Comment {
    Comment({
       required this.mapValue,
    });

    MapValue mapValue;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        mapValue: MapValue.fromJson(json["mapValue"]),
    );

    Map<String, dynamic> toJson() => {
        "mapValue": mapValue.toJson(),
    };
}

class MapValue {
    MapValue({
      required  this.fields,
    });

    Map<String, IImage> fields;

    factory MapValue.fromJson(Map<String, dynamic> json) => MapValue(
        fields: Map.from(json["fields"]).map((k, v) => MapEntry<String, IImage>(k, IImage.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "fields": Map.from(fields).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class IImage {
    IImage({
      required  this.stringValue,
    });

    String stringValue;

    factory IImage.fromJson(Map<String, dynamic> json) => IImage(
        stringValue: json["stringValue"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
    };
}

class Like {
    Like({
      required  this.integerValue,
    });

    String integerValue;

    factory Like.fromJson(Map<String, dynamic> json) => Like(
        integerValue: json["integerValue"],
    );

    Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
    };
}
