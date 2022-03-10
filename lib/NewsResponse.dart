
class NewsResponse {
  bool? success;
  Data? data;

  NewsResponse({this.success, this.data});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Items>? items;

  Data({this.items});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  int? userId;
  String? title;
  String? slug;
  String? type;
  String? content;
  String? tweetContent;
  List<CodeSnippet>? codeSnippet;
  String? cover;
  List<Images>? images;
  String? digest;
  int? publish;
  String? sponsor;
  List<Video>? videos;
  String? createdAt;
  String? updatedAt;
  String? publishedAt;
  int? isCover;
  List<AssociatedTags>? associatedTags;
  List<String>? tags;
  List<Source>? source;
  String? authorName;
  String? cardName;

  Items(
      {this.id,
      this.userId,
      this.title,
      this.slug,
      this.type,
      this.content,
      this.tweetContent,
      this.codeSnippet,
      this.cover,
      this.images,
      this.digest,
      this.publish,
      this.sponsor,
      this.videos,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.isCover,
      this.associatedTags,
      this.tags,
      this.source,
      this.authorName,
      this.cardName});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    slug = json['slug'];
    type = json['type'];
    content = json['content'];
    tweetContent = json['tweet_content'];
    if (json['code_snippet'] != null) {
      codeSnippet = <CodeSnippet>[];
      json['code_snippet'].forEach((v) {
        codeSnippet!.add(CodeSnippet.fromJson(v));
      });
    }
    cover = json['cover'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    digest = json['digest'];
    publish = json['publish'];
    sponsor = json['sponsor'];
    if (json['videos'] != null) {
      videos = <Video>[];
      json['videos'].forEach((v) {
        videos!.add(Video.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishedAt = json['published_at'];
    isCover = json['is_cover'];
    if (json['associated_tags'] != null) {
      associatedTags = <AssociatedTags>[];
      json['associated_tags'].forEach((v) {
        associatedTags!.add(AssociatedTags.fromJson(v));
      });
    }
    tags = json['tags'].cast<String>();
    if (json['source'] != null) {
      source = <Source>[];
      json['source'].forEach((v) {
        source!.add(Source.fromJson(v));
      });
    }
    authorName = json['author_name'];
    cardName = json['card_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    data['slug'] = slug;
    data['type'] = type;
    data['content'] = content;
    data['tweet_content'] = tweetContent;
    if (codeSnippet != null) {
      data['code_snippet'] = codeSnippet!.map((v) => v.toJson()).toList();
    }
    data['cover'] = cover;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    data['digest'] = digest;
    data['publish'] = publish;
    data['sponsor'] = sponsor;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['published_at'] = publishedAt;
    data['is_cover'] = isCover;
    if (associatedTags != null) {
      data['associated_tags'] = associatedTags!.map((v) => v.toJson()).toList();
    }
    data['tags'] = tags;
    if (source != null) {
      data['source'] = source!.map((v) => v.toJson()).toList();
    }
    data['author_name'] = authorName;
    data['card_name'] = cardName;
    return data;
  }
}

class AssociatedTags {
  int? id;
  String? name;
  String? type;
  String? hexColorCode;

  AssociatedTags({this.id, this.name, this.type, this.hexColorCode});

  AssociatedTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    hexColorCode = json['hex_color_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['hex_color_code'] = hexColorCode;
    return data;
  }
}

class Source {
  String? name;
  String? link;

  Source({this.name, this.link});

  Source.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['link'] = link;
    return data;
  }
}

class CodeSnippet {
  String? title;
  String? content;
  int? position;

  CodeSnippet({this.title, this.content, this.position});

  CodeSnippet.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['content'] = content;
    data['position'] = position;
    return data;
  }
}

class Images {
  String? image;
  String? caption;
  int? position;

  Images({this.image, this.caption, this.position});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    caption = json['caption'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['caption'] = caption;
    data['position'] = position;
    return data;
  }
}

class Video {
  String? url;
  int? start;
  int? end;
  int? position;

  Video({this.url, this.start, this.end, this.position});

  Video.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    start = json['start'];
    end = json['end'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['start'] = start;
    data['end'] = end;
    data['position'] = position;
    return data;
  }
}
