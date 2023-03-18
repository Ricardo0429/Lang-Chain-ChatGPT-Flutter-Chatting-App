const String API_KEY = "YOUR OPENAI API KEY IS HERE";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }



class TextCompletionModel {
  final num created;
  final List<TextCompletionData> choices;

  TextCompletionModel({required this.created, required this.choices});

  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textCompletionItems = json['choices'] as List;
    List<TextCompletionData> choices = textCompletionItems
        .map((singleItem) => TextCompletionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
      choices: choices,
      created: json['created'],
    );
  }
}


class TextCompletionData{
  final String text;
  final num index;
  final String finish_reason;

  TextCompletionData({required this.text,required this.index,required this.finish_reason});


  factory TextCompletionData.fromJson(Map<String,dynamic> json){

    return TextCompletionData(
      text: json['text'],
      index: json['index'],
      finish_reason: json['finish_reason'],
    );
  }
}
