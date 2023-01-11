import 'package:diox/diox.dart';
import 'package:diox_response_validator/diox_response_validator.dart';

void main() async {
  final dio = Dio();

  final successResponse =
      await dio.get('https://vrchat.com/api/1/config').validate(
            transform: (data) => data['apiKey'],
          );

  // Prints the api key
  printResponse(successResponse);

  final failureResponse =
      await dio.get('https://vrchat.com/api/2/config').validate();

  // Prints a 404 error
  printResponse(failureResponse);
}

void printResponse(ValidatedResponse response) {
  if (response.success != null) {
    print(response.success!.data);
  } else {
    print(response.failure!);
  }
}
