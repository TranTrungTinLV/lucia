import 'dart:convert';
import 'dart:typed_data';

class StoreCreationResponse {
  const StoreCreationResponse({
    required this.items,
  });

  final List<String> items;

  factory StoreCreationResponse.fromBytes(Uint8List bytes) {
    Map body = jsonDecode(utf8.decode(bytes));
    return StoreCreationResponse(
      items: body['items'].cast<String>(),
    );
  }
}

class ListInspirationsResponse {
  const ListInspirationsResponse({
    required this.prompt,
  });

  final String prompt;

  factory ListInspirationsResponse.fromBytes(Uint8List bytes) {
    Map body = jsonDecode(utf8.decode(bytes));
    return ListInspirationsResponse(
      prompt: body['prompt'],
    );
  }
}
