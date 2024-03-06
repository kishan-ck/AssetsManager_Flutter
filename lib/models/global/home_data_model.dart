class HomeDataModel {
  final int? status;
  final Data? data;
  final String? message;

  HomeDataModel({
    this.status,
    this.data,
    this.message,
  });

  HomeDataModel.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() =>
      {'status': status, 'data': data?.toJson(), 'message': message};
}

class Data {
  final List<News>? news;
  final List<Category>? category;
  final String? date;
  final String? day;

  Data({
    this.news,
    this.category,
    this.date,
    this.day,
  });

  Data.fromJson(Map<String, dynamic> json)
      : news = (json['News'] as List?)
            ?.map((dynamic e) => News.fromJson(e as Map<String, dynamic>))
            .toList(),
        category = (json['Category'] as List?)
            ?.map((dynamic e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        date = json['Date'] as String?,
        day = json['Day'] as String?;

  Map<String, dynamic> toJson() => {
        'News': news?.map((e) => e.toJson()).toList(),
        'Category': category?.map((e) => e.toJson()).toList(),
        'Date': date,
        'Day': day
      };
}

class News {
  final String? id;
  final String? title;
  final String? content;
  final String? readmore;
  final String? image;
  final int? v;

  News({
    this.id,
    this.title,
    this.content,
    this.readmore,
    this.image,
    this.v,
  });

  News.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        title = json['title'] as String?,
        content = json['content'] as String?,
        readmore = json['readmore'] as String?,
        image = json['image'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'content': content,
        'readmore': readmore,
        'image': image,
        '__v': v
      };
}

class Category {
  final String? id;
  final String? name;
  final String? image;
  final String? icon;
  final List<Measurement>? measurement;
  final int? v;
  final List<Subcategory>? subcategory;

  Category({
    this.id,
    this.name,
    this.image,
    this.icon,
    this.measurement,
    this.v,
    this.subcategory,
  });

  Category.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        image = json['image'] as String?,
        icon = json['icon'] as String?,
        measurement = (json['measurement'] as List?)
            ?.map(
                (dynamic e) => Measurement.fromJson(e as Map<String, dynamic>))
            .toList(),
        v = json['__v'] as int?,
        subcategory = (json['subcategory'] as List?)
            ?.map(
                (dynamic e) => Subcategory.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
        'icon': icon,
        'measurement': measurement?.map((e) => e.toJson()).toList(),
        '__v': v,
        'subcategory': subcategory?.map((e) => e.toJson()).toList()
      };
}

class Measurement {
  final String? name;
  final int? key;
  final String? catId;
  final String? id;

  Measurement({
    this.name,
    this.key,
    this.catId,
    this.id,
  });

  Measurement.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        key = json['key'] as int?,
        catId = json['cat_id'] as String?,
        id = json['_id'] as String?;

  Map<String, dynamic> toJson() =>
      {'name': name, 'key': key, 'cat_id': catId, '_id': id};
}

class Subcategory {
  final String? id;
  final String? name;
  final String? catId;
  final int? v;
  final int? currentVal;
  final int? profitVal;

  Subcategory({
    this.id,
    this.name,
    this.catId,
    this.v,
    this.currentVal,
    this.profitVal,
  });

  Subcategory.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        name = json['name'] as String?,
        catId = json['cat_id'] as String?,
        v = json['__v'] as int?,
        currentVal = json['currentval'] as int?,
        profitVal = json['profitval'] as int?;

  Map<String, dynamic> toJson() =>
      {'_id': id, 'name': name, 'cat_id': catId, '__v': v, 'currentval': currentVal, 'profitval': profitVal};
}
