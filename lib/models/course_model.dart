class CourseModel {
  String imagePath;
  String title;

  CourseModel({
    required this.imagePath,
    required this.title,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      imagePath: map['imagePath'],
      title: map['title'],
    );
  }
}
