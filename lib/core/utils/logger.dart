import 'package:logger/logger.dart';

class AppLogger {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2, // Show method calls in logs
      errorMethodCount: 8, // Stack trace lines for errors
      lineLength: 100, // Line length
      colors: true, // Enable colored logs
      printEmojis: true, // Use emojis
      printTime: true, // Add timestamps
    ),
  );
}
