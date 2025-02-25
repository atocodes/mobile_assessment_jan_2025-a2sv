class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromMap(Map<String, dynamic> data) {
    return Rating(
      count: data['count'],
      rate: double.parse(data['rate'].toString()),
    );
  }
}
