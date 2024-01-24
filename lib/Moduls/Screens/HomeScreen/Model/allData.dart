class AllData {
  String position;
  String name;
  String velocity;
  String distance;
  String description;
  String image;

  AllData({
    required this.position,
    required this.name,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.image,
  });

  factory AllData.fromJson({required Map data}) {
    return AllData(
        position: data['position'],
        name: data['name'],
        velocity: data['velocity'],
        distance: data['distance'],
        description: data['description'],
        image: data['image']);
  }
}
