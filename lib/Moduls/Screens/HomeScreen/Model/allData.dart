class AllData {
  String position;
  String name;
  String velocity;
  String distance;
  String description;
  String image;
  String color;

  AllData({
    required this.position,
    required this.name,
    required this.velocity,
    required this.distance,
    required this.description,
    required this.image,
    required this.color,
  });

  factory AllData.fromJson({required Map data}) {
    return AllData(
      position: data['position'],
      name: data['name'],
      velocity: data['velocity'],
      distance: data['distance'],
      description: data['description'],
      image: data['image'],
      color: data['color'],
    );
  }
}
