import 'package:flutter/material.dart';

class Tema {
  static String imageStorm = 'assets/images/storm.png';
  static String imageRain = 'assets/images/rain.png';
  static String imageClearDay = 'assets/images/clear_day.png';
  static String imageCloudlyDay = 'assets/images/cloudly_day.png';
  static String imageCloudlyNight = 'assets/images/cloudly_night.png';
  static String imageClearNight = 'assets/images/clear_night.png';
  static String imageFog = 'assets/images/fog.png';
  static String imageHail = 'assets/images/hail.png';

  static Color corPrincipal = Color(0xFF21A3BE);

  static String verificaImagem(String condition) {
    switch (condition) {
      case 'storm':
        return Tema.imageStorm;
        break;
      case 'rain':
        return imageRain;
        break;
      case 'cloudly_day':
        return imageCloudlyDay;
        break;
      case 'cloudly_day':
        return imageCloudlyNight;
        break;
      case 'cloud':
        return imageCloudlyDay;
        break;
      case 'clear_day':
        return imageClearDay;
        break;
      case 'clear_night':
        return imageClearNight;
        break;
      case 'fog':
        return imageFog;
        break;
      case 'hail':
        return imageHail;
        break;
      case 'snow':
        return imageHail;
        break;
      case 'none_day':
        return imageClearDay;
        break;
      case 'none_night':
        return imageClearNight;
        break;
      default:
        return imageClearDay;
    }
  }

  static Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');

    return Color(int.parse('FF$hexCode', radix: 16)).withOpacity(1);
  }

  static Color colorFromRGB(String rbgColor) {
    int red = int.parse(rbgColor.split(',')[0]);
    int green = int.parse(rbgColor.split(',')[1]);
    int blue = int.parse(rbgColor.split(',')[2]);

    return Color.fromRGBO(red, green, blue, 1);
  }
}
