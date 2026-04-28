import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // 1. تأكد من وضع API Key جديد تماماً (غير الذي نشرته سابقاً)
  static const String apiKey = "AIzaSyA3eKpWErhJfzO9ataX9gmFAyNb5abvack";

  static Future<String> sendMessage(String message) async {
    try {
      // 2. استخدم gemini-1.5-flash فهو يدعم v1beta بشكل أفضل
      final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

      // 3. تأكد من أن الـ Content يتم إرساله كقائمة (List)
      final content = [Content.text(message)];

      final response = await model.generateContent(content);

      if (response.text != null) {
        return response.text!;
      } else {
        return "⚠️ البوت لم يعطِ ردًا نصيًا";
      }
    } catch (error) {
      print("Detailed Error Type: ${error.runtimeType}");
      print("Detailed Error Message: $error");

      // هذا السطر سيخبرك إذا كانت المشكلة SocketException (إنترنت)
      // أو شيئاً آخر متعلق بالـ API Key
      return "حدث خطأ: $error";
    }
  }
}
