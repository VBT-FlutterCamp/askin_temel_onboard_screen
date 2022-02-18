class OnBoardModel {
  String title;
  String description;
  String image;
  OnBoardModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoardModel> models = [
  OnBoardModel(
      title: 'Lorem ipsum',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque est vel ligula vestibulum, eget vulputate orci pulvinar.',
      image: 'images/undraw_at_home_octe.svg'),
  OnBoardModel(
      title: 'Lorem ipsum',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque est vel ligula vestibulum, eget vulputate orci pulvinar.',
      image: 'images/undraw_design_stats_ne2k.svg'),
  OnBoardModel(
      title: 'Lorem ipsum',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque scelerisque est vel ligula vestibulum, eget vulputate orci pulvinar.',
      image: 'images/undraw_heatmap_uyye.svg')
];