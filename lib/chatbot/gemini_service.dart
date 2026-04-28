import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // تذكر: ضع هنا مفتاحك الجديد (بدون مسافات)
  static const String apiKey = "AIzaSyBUVmrLjlhrpQ8hXtra0R7yoJWcppeJ6eI";

  static Future<String> sendMessage(String message) async {

    print("My API Key is: $apiKey");
    if (apiKey.isEmpty) {
      print("تحذير: الـ API Key فارغ، تأكد من ملف .env أو المتغير");
      return "خطأ: المفتاح غير موجود";
    }


    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: 'AIzaSyBUVmrLjlhrpQ8hXtra0R7yoJWcppeJ6eI',
      );

      final content = [Content.text(message)];


      final response = await model.generateContent(content);

      if (response.text != null) {
        return response.text!;
      } else {
        return "البوت لم يقم بالرد";
      }
    } catch (e) {
      print("Error: $e"); // هذا السطر سيخبرنا بالسبب الدقيق إذا فشل الاتصال
      return "حدث خطأ أثناء الاتصال بالبوت";
    }
  }
}
