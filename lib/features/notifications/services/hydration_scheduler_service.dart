import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:daftfits/core/auth/models/user_profile.dart';
import 'package:daftfits/features/notifications/services/notification_service.dart';

class HydrationSchedulerService {
  final NotificationService _notificationService;

  HydrationSchedulerService(this._notificationService);

  Future<void> scheduleDailyReminders(
      UserProfile profile, int dailyGoalMl, int currentIntakeMl) async {
    print('📅 [HydrationScheduler] Starting scheduleDailyReminders');
    print('   Goal: ${dailyGoalMl}ml, Current: ${currentIntakeMl}ml');

    // 1. Cancel existing
    await _notificationService.cancelAllNotifications();
    print('   ✅ Cancelled all previous notifications');

    // 2. Check if goal reached
    if (currentIntakeMl >= dailyGoalMl) {
      print('   🎉 Goal already reached! No reminders needed.');
      return;
    }

    // 3. Calculate intervals
    final now = DateTime.now();
    print('   🕐 Current time: ${now.hour}:${now.minute}');

    // Construct BedTime for today
    DateTime bedTime = DateTime(
      now.year,
      now.month,
      now.day,
      profile.bedTimeHour,
      profile.bedTimeMinute,
    );

    // If bedTime is past (e.g. it's 11PM and bedTime is 10PM), no reminders for today.
    // However, if bedTime is small (e.g. 1AM tomorrow), we should handle that.
    // For simplicity, let's assume bedTime is within the same calendar day or early next day.
    // If bedTime hour < wakeUpHour, assume it's next day.
    if (profile.bedTimeHour < profile.wakeUpHour) {
      bedTime = bedTime.add(const Duration(days: 1));
      print('   🌙 BedTime is tomorrow: ${bedTime.hour}:${bedTime.minute}');
    } else {
      print('   🌙 BedTime today: ${bedTime.hour}:${bedTime.minute}');
    }

    if (now.isAfter(bedTime)) {
      print('   ⏸️ Current time is past bedtime. No reminders for today.');
      return;
    }

    // Start scheduling from later of (Now, WakeUpTime)
    DateTime startTime = DateTime(
      now.year,
      now.month,
      now.day,
      profile.wakeUpHour,
      profile.wakeUpMinute,
    );

    if (now.isAfter(startTime)) {
      startTime = now;
      print('   ⏰ Starting from current time');
    } else {
      print(
          '   ⏰ Starting from wake time: ${startTime.hour}:${startTime.minute}');
    }

    // Schedule every hour until bedtime
    // Next hour mark
    DateTime nextReminder = startTime.add(const Duration(hours: 1));
    // Flatten to :00 minutes? Or just add 1 hour from now?
    // Let's do rounded hours for cleaner schedule: 9:00, 10:00...
    if (startTime.minute > 0) {
      nextReminder = DateTime(startTime.year, startTime.month, startTime.day,
          startTime.hour + 1, 0);
    }

    int reminderId = 0;

    while (nextReminder.isBefore(bedTime)) {
      reminderId++;

      await _notificationService.scheduleNotification(
        id: reminderId,
        title: '¡Hora de hidratarse! 💧',
        body: 'Mantén tu racha. Bebe un vaso de agua.',
        scheduledDate: nextReminder,
      );

      print(
          '   ✅ Scheduled notification #$reminderId at ${nextReminder.hour}:${nextReminder.minute.toString().padLeft(2, '0')}');

      nextReminder = nextReminder.add(const Duration(hours: 1));
    }

    print('   📊 Total notifications scheduled: $reminderId');
  }
}
