class Photo {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Map<String, String> src;
  bool liked;
  String alt;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: Map<String, String>.from(json['src']),
      liked: json['liked'],
      alt: json['alt'],
    );
  }
}

class PhotoResponse {
  int page;
  int perPage;
  List<Photo> photos;
  int totalResults;

  PhotoResponse({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  factory PhotoResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> photoList = json['photos'];
    List<Photo> photos =
        photoList.map((photoJson) => Photo.fromJson(photoJson)).toList();

    return PhotoResponse(
      page: json['page'],
      perPage: json['per_page'],
      photos: photos,
      totalResults: json['total_results'],
    );
  }
}