class PixabayApiModal {
  late List<Hit> hits;

  PixabayApiModal({required this.hits});

  factory PixabayApiModal.fromApi(Map m1){
    return PixabayApiModal(hits: (m1['hits'] as List).map((e) => Hit.fromJson(e),).toList(),);
  }
}

class Hit {
  late int id, likes, comments, downloads, views;
  late String webFormatURL, previewURL;

  Hit({
    required this.id,
    required this.likes,
    required this.comments,
    required this.downloads,
    required this.views,
    required this.webFormatURL,
    required this.previewURL,
  });

  factory Hit.fromJson(Map m1) {
    return Hit(
      id: m1['id'],
      likes: m1['likes'],
      comments: m1['comments'],
      downloads: m1['downloads'],
      views: m1['views'],
      webFormatURL: m1['webformatURL'],
      previewURL: m1['previewURL'],
    );
  }
}