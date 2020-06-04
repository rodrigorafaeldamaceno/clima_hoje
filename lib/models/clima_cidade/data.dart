class Data {
  String date;
  String dateBr;
  Rain rain;
  Uv uv;
  MinMax thermalSensation;
  TextIcon textIcon;
  Temperature temperature;
  Sun sun;

  Data(
      {this.date,
      this.dateBr,
      this.rain,
      this.uv,
      this.thermalSensation,
      this.textIcon,
      this.temperature,
      this.sun});

  Data.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateBr = json['date_br'];
    uv = json['uv'] != null ? new Uv.fromJson(json['uv']) : null;
    thermalSensation = json['thermal_sensation'] != null
        ? new MinMax.fromJson(json['thermal_sensation'])
        : null;
    textIcon = json['text_icon'] != null
        ? new TextIcon.fromJson(json['text_icon'])
        : null;
    rain = json['rain'] != null ? new Rain.fromJson(json['rain']) : null;
    sun = json['sun'] != null ? new Sun.fromJson(json['sun']) : null;
    temperature = json['temperature'] != null
        ? new Temperature.fromJson(json['temperature'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['date_br'] = this.dateBr;
    if (this.rain != null) {
      data['rain'] = this.rain.toJson();
    }
    if (this.uv != null) {
      data['uv'] = this.uv.toJson();
    }
    if (this.thermalSensation != null) {
      data['thermal_sensation'] = this.thermalSensation.toJson();
    }
    if (this.textIcon != null) {
      data['text_icon'] = this.textIcon.toJson();
    }
    if (this.temperature != null) {
      data['temperature'] = this.temperature.toJson();
    }

    if (this.sun != null) {
      data['sun'] = this.sun.toJson();
    }
    return data;
  }
}

class Temperature {
  int min;
  int max;
  MinMax dawn;
  MinMax morning;
  MinMax afternoon;
  MinMax night;

  Temperature(
      {this.min,
      this.max,
      this.dawn,
      this.morning,
      this.afternoon,
      this.night});

  Temperature.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    dawn = json['dawn'] != null ? new MinMax.fromJson(json['dawn']) : null;
    morning =
        json['morning'] != null ? new MinMax.fromJson(json['morning']) : null;
    afternoon = json['afternoon'] != null
        ? new MinMax.fromJson(json['afternoon'])
        : null;
    night = json['night'] != null ? new MinMax.fromJson(json['night']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    if (this.dawn != null) {
      data['dawn'] = this.dawn.toJson();
    }
    if (this.morning != null) {
      data['morning'] = this.morning.toJson();
    }
    if (this.afternoon != null) {
      data['afternoon'] = this.afternoon.toJson();
    }
    if (this.night != null) {
      data['night'] = this.night.toJson();
    }
    return data;
  }
}

class MinMax {
  int min;
  int max;

  MinMax({this.min, this.max});

  MinMax.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    return data;
  }
}

class Rain {
  int probability;
  int precipitation;

  Rain({this.probability, this.precipitation});

  Rain.fromJson(Map<String, dynamic> json) {
    probability = json['probability'];
    precipitation = json['precipitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['probability'] = this.probability;
    data['precipitation'] = this.precipitation;
    return data;
  }
}

class Uv {
  var max;

  Uv({this.max});

  Uv.fromJson(Map<String, dynamic> json) {
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    return data;
  }
}

class TextIcon {
  Icon icon;
  TextDescricao text;

  TextIcon({this.icon, this.text});

  TextIcon.fromJson(Map<String, dynamic> json) {
    icon = json['icon'] != null ? new Icon.fromJson(json['icon']) : null;
    text = json['text'] != null ? new TextDescricao.fromJson(json['text']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.text != null) {
      data['text'] = this.text.toJson();
    }
    return data;
  }
}

class Icon {
  String dawn;
  String morning;
  String afternoon;
  String night;
  String day;

  Icon({this.dawn, this.morning, this.afternoon, this.night, this.day});

  Icon.fromJson(Map<String, dynamic> json) {
    dawn = json['dawn'];
    morning = json['morning'];
    afternoon = json['afternoon'];
    night = json['night'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dawn'] = this.dawn;
    data['morning'] = this.morning;
    data['afternoon'] = this.afternoon;
    data['night'] = this.night;
    data['day'] = this.day;
    return data;
  }
}

class TextDescricao {
  String pt;
  String en;
  String es;
  Phrase phrase;

  TextDescricao({this.pt, this.en, this.es, this.phrase});

  TextDescricao.fromJson(Map<String, dynamic> json) {
    pt = json['pt'];
    en = json['en'];
    es = json['es'];
    phrase =
        json['phrase'] != null ? new Phrase.fromJson(json['phrase']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt'] = this.pt;
    data['en'] = this.en;
    data['es'] = this.es;
    if (this.phrase != null) {
      data['phrase'] = this.phrase.toJson();
    }
    return data;
  }
}

class Phrase {
  String reduced;
  String morning;
  String afternoon;
  String night;
  String dawn;

  Phrase({this.reduced, this.morning, this.afternoon, this.night, this.dawn});

  Phrase.fromJson(Map<String, dynamic> json) {
    reduced = json['reduced'];
    morning = json['morning'];
    afternoon = json['afternoon'];
    night = json['night'];
    dawn = json['dawn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reduced'] = this.reduced;
    data['morning'] = this.morning;
    data['afternoon'] = this.afternoon;
    data['night'] = this.night;
    data['dawn'] = this.dawn;
    return data;
  }
}

class Morning {
  var low;
  var mid;
  int high;

  Morning({this.low, this.mid, this.high});

  Morning.fromJson(Map<String, dynamic> json) {
    low = json['low'];
    mid = json['mid']();
    high = json['high'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['low'] = this.low;
    data['mid'] = this.mid;
    data['high'] = this.high;
    return data;
  }
}

class Sun {
  String sunrise;
  String sunset;

  Sun({this.sunrise, this.sunset});

  Sun.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    return data;
  }
}
