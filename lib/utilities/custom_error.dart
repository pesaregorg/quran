enum AppError {
  notFound,
  unAuthorized,
  unProcessableEntity,
  validationError
}

class CustomError {
  final AppError key;
  final String? message;
  final Map? errors;

  const CustomError({
    required this.key,
    this.message,
    this.errors
  });
}