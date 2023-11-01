class CurrentWeatherModel {
  CurrentWeatherModel({
      this.latitude, 
      this.longitude, 
      this.generationtimeMs, 
      this.utcOffsetSeconds, 
      this.timezone, 
      this.timezoneAbbreviation, 
      this.elevation, 
      this.currentWeatherUnits, 
      this.currentWeather,});

  CurrentWeatherModel.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentWeatherUnits = json['current_weather_units'] != null ? CurrentWeatherUnits.fromJson(json['current_weather_units']) : null;
    currentWeather = json['current_weather'] != null ? CurrentWeather.fromJson(json['current_weather']) : null;
  }
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  CurrentWeatherUnits? currentWeatherUnits;
  CurrentWeather? currentWeather;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['generationtime_ms'] = generationtimeMs;
    map['utc_offset_seconds'] = utcOffsetSeconds;
    map['timezone'] = timezone;
    map['timezone_abbreviation'] = timezoneAbbreviation;
    map['elevation'] = elevation;
    if (currentWeatherUnits != null) {
      map['current_weather_units'] = currentWeatherUnits?.toJson();
    }
    if (currentWeather != null) {
      map['current_weather'] = currentWeather?.toJson();
    }
    return map;
  }

}

class CurrentWeather {
  CurrentWeather({
      this.time, 
      this.interval, 
      this.temperature, 
      this.windspeed, 
      this.winddirection, 
      this.isDay, 
      this.weathercode,});

  CurrentWeather.fromJson(dynamic json) {
    time = json['time'];
    interval = json['interval'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    isDay = json['is_day'];
    weathercode = json['weathercode'];
  }
  String? time;
  num? interval;
  num? temperature;
  num? windspeed;
  num? winddirection;
  num? isDay;
  num? weathercode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['interval'] = interval;
    map['temperature'] = temperature;
    map['windspeed'] = windspeed;
    map['winddirection'] = winddirection;
    map['is_day'] = isDay;
    map['weathercode'] = weathercode;
    return map;
  }

}

class CurrentWeatherUnits {
  CurrentWeatherUnits({
      this.time, 
      this.interval, 
      this.temperature, 
      this.windspeed, 
      this.winddirection, 
      this.isDay, 
      this.weathercode,});

  CurrentWeatherUnits.fromJson(dynamic json) {
    time = json['time'];
    interval = json['interval'];
    temperature = json['temperature'];
    windspeed = json['windspeed'];
    winddirection = json['winddirection'];
    isDay = json['is_day'];
    weathercode = json['weathercode'];
  }
  String? time;
  String? interval;
  String? temperature;
  String? windspeed;
  String? winddirection;
  String? isDay;
  String? weathercode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['interval'] = interval;
    map['temperature'] = temperature;
    map['windspeed'] = windspeed;
    map['winddirection'] = winddirection;
    map['is_day'] = isDay;
    map['weathercode'] = weathercode;
    return map;
  }

}