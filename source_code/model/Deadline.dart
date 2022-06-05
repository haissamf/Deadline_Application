

class Deadline{
  final String name;
  final DateTime start_date;
  DateTime end_date;

  double progress = 0;

  Deadline( {
    required this.name,
    required this.start_date,
    required this.end_date});

  void changeProgress(double progress){
    this.progress = progress;
  }
}