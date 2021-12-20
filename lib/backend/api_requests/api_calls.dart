import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

Future<ApiCallResponse> getCategoriesCall({
  int count = 4,
  int offset = 0,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'getCategories',
    apiUrl: 'https://jservice.io/api/categories',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'count': count,
      'offset': offset,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> categoryCall({
  int id,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'category',
    apiUrl: 'https://jservice.io/api/category',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'id': id,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> questionCall({
  int category,
  int value,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'question',
    apiUrl: 'https://jservice.io/api/clues',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'category': category,
      'value': value,
    },
    returnBody: true,
  );
}

Future<ApiCallResponse> allQuestionsCall({
  int category,
}) {
  return ApiManager.instance.makeApiCall(
    callName: 'allQuestions',
    apiUrl: 'https://jservice.io/api/clues',
    callType: ApiCallType.GET,
    headers: {},
    params: {
      'category': category,
    },
    returnBody: true,
  );
}
