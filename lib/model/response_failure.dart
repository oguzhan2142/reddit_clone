import 'package:reddit_clone/enum/failure_reason.dart';

const String _unknownErrorMessage = 'Bilinmeyen bir hata meydana geldi';

class ResponseFailure {
  final String message;
  final FailureReason failureReason;

  factory ResponseFailure.unknown() => ResponseFailure(
        message: _unknownErrorMessage,
        failureReason: FailureReason.UNKNOWN,
      );

  ResponseFailure({
    required this.message,
    required this.failureReason,
  });
}
