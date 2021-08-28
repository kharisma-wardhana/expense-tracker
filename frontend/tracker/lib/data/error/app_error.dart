class AppError {
  final String message;
  AppError({required this.message});
}

enum AppErrorType { ApiError, AppError }
