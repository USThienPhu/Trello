import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  // Constructor riêng tư để chặn khởi tạo
  UrlHelper._();

  static Future<void> openUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
          mode: LaunchMode.externalApplication, // Mở bằng trình duyệt ngoài
        );
      } else {
        throw 'Could not launch $urlString';
      }
    } catch (e) { }
  }
}
