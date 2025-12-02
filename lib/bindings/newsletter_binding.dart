import 'package:get/get.dart';
import 'package:hkdigiskill_admin/screens/newsletter/all_newsletter/controllers/newsletter_controller.dart';
import 'package:hkdigiskill_admin/screens/newsletter/create_newsletter/controllers/create_newsletter_controller.dart';

class NewsletterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsletterController>(() => NewsletterController());
    Get.lazyPut<CreateNewsletterController>(() => CreateNewsletterController());
  }
}
