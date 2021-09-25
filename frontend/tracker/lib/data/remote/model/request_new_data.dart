class RequestNewData {
  Parent parent;
  Properties properties;

  RequestNewData({
    required this.parent,
    required this.properties,
  });

  factory RequestNewData.fromJson(Map<String, dynamic> json) => RequestNewData(
        parent: Parent.fromJson(json['parent']),
        properties: Properties.fromJson(json['properties']),
      );

  Map<String, dynamic> toJson() => {
        'parent': parent.toJson(),
        'properties': properties.toJson(),
      };
}

class Parent {
  String databaseId;

  Parent({
    required this.databaseId,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        databaseId: json['database_id'],
      );

  Map<String, dynamic> toJson() => {
        'database_id': databaseId,
      };
}

class Properties {
  Properties({
    required this.price,
    required this.desc,
    required this.category,
    required this.date,
    required this.name,
  });

  Price price;
  Desc desc;
  Category category;
  Date date;
  Name name;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        price: Price.fromJson(json['Price']),
        desc: Desc.fromJson(json['Desc']),
        category: Category.fromJson(json['Category']),
        date: Date.fromJson(json['Date']),
        name: Name.fromJson(json['Name']),
      );

  Map<String, dynamic> toJson() => {
        'Price': price.toJson(),
        'Desc': desc.toJson(),
        'Category': category.toJson(),
        'Date': date.toJson(),
        'Name': name.toJson(),
      };
}

class Category {
  Category({
    required this.select,
  });

  Select select;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        select: Select.fromJson(json['select']),
      );

  Map<String, dynamic> toJson() => {
        'select': select.toJson(),
      };
}

class Select {
  Select({
    required this.id,
    required this.name,
    required this.color,
  });

  String id;
  String name;
  String color;

  factory Select.fromJson(Map<String, dynamic> json) => Select(
        id: json['id'],
        name: json['name'],
        color: json['color'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
      };
}

class Date {
  Date({
    required this.date,
  });

  DateClass date;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: DateClass.fromJson(json['date']),
      );

  Map<String, dynamic> toJson() => {
        'date': date.toJson(),
      };
}

class DateClass {
  DateClass({
    required this.start,
    required this.end,
  });

  DateTime start;
  dynamic end;

  factory DateClass.fromJson(Map<String, dynamic> json) => DateClass(
        start: DateTime.parse(json['start']),
        end: json['end'],
      );

  Map<String, dynamic> toJson() => {
        'start':
            "${start.year.toString().padLeft(4, '0')}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}",
        'end': end,
      };
}

class Desc {
  Desc({
    required this.richText,
  });

  List<RichText> richText;

  factory Desc.fromJson(Map<String, dynamic> json) => Desc(
        richText: List<RichText>.from(
            json['rich_text'].map((x) => RichText.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'rich_text': List<dynamic>.from(richText.map((x) => x.toJson())),
      };
}

class RichText {
  RichText({
    required this.plainText,
  });

  String plainText;

  factory RichText.fromJson(Map<String, dynamic> json) => RichText(
        plainText: json['plain_text'],
      );

  Map<String, dynamic> toJson() => {
        'plain_text': plainText,
      };
}

class Name {
  Name({
    required this.title,
  });

  List<RichText> title;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title:
            List<RichText>.from(json['title'].map((x) => RichText.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'title': List<dynamic>.from(title.map((x) => x.toJson())),
      };
}

class Price {
  Price({
    required this.number,
  });

  int number;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        number: json['number'],
      );

  Map<String, dynamic> toJson() => {
        'number': number,
      };
}
