class CategoriesModle {
  int? categoriesId;
  String? categoriesName;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModle({
    this.categoriesId,
    this.categoriesName,
    this.categoriesImage,
    this.categoriesDatetime,
  });

  CategoriesModle.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;
    return data;
  }
}
