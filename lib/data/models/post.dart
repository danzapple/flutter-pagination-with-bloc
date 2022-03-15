class Post {
  final String? title;
  final String? body;
  final String foto;

  Post.fromJson(Map json)
      : title = json['judul'],
        body = json['deskripsi'],
        foto =
            "https://banyuwangitourism.com/bankdata/assets/img/" + json['foto'];
}
