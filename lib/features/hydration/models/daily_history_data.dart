class DailyHistoryData {
  final DateTime date;
  final int intakeMl;
  final int goalMl;

  DailyHistoryData({
    required this.date,
    required this.intakeMl,
    required this.goalMl,
  });

  double get progress => goalMl > 0 ? (intakeMl / goalMl).clamp(0.0, 1.0) : 0.0;
}
