class NewsModel {
  final List<Data>? data;

  NewsModel({
    this.data,
  });

  NewsModel.fromJson(Map<String, dynamic> json)
      : data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Data {
  final String? id;
  final String? title;
  final String? content;
  final String? readmore;
  final String? image;
  final int? v;

  Data({
    this.id,
    this.title,
    this.content,
    this.readmore,
    this.image,
    this.v,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        readmore = json['readmore'] as String?,
        image = json['image'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'title' : title,
    'content' : content,
    'readmore' : readmore,
    'image' : image,
    '__v' : v
  };
}