  String getImagePath(String language, String region) {
    if (language == 'Hindi' && region == 'Upper Himachal') {
      return 'assets/upper_hindi_bg.png';
    } else if (language == 'Hindi' && region == 'Lower Himachal') {
      return 'assets/lower_hindi_bg.png';
    } else if (language == 'English' && region == 'Upper Himachal') {
      return 'assets/upper_eglish_bg.png';
    } else if (language == 'English' && region == 'Lower Himachal') {
      return 'assets/lower_english_bg.png';
    } else {
      return '';
    }
  }

  String getRotatingImagePath(String language, String region) {
    if (language == 'Hindi' && region == 'Upper Himachal') {
      return 'assets/upper_hindi_rotate.png';
    } else if (language == 'Hindi' && region == 'Lower Himachal') {
      return 'assets/lower_hindi_rotate.png';
    } else if (language == 'English' && region == 'Upper Himachal') {
      return 'assets/upper_eglish_rotate.png';
    } else if (language == 'English' && region == 'Lower Himachal') {
      return 'assets/lower_english_rotate.png';
    } else {
      return '';
    }
  }

