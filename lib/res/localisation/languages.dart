import 'package:get/get.dart';

class Languages with Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "message": "What is your name?",
          "answer": "Arundhati Chodankar",
          'noInternetText':
              'Looks like you are in the low network area.\nPlease check your internet connection and try again later',
       'generalErrorText':
              'Something went wrong please try again later',
          'retry': 'Retry',
          'welcome_back':'Welcome\nBack',
          'login':'Login',
          'enter_email':'Enter email',
          'enter_password':'Enter password',
          'empty_email_error':'Email cannot be empty',
          'empty_password_error':'Password cannot be empty',

        },

        "mr_IN": {"message": "तुझं नाव काय आहे?", "answer": "अरुंधती चोडणकर"}
      };
}
