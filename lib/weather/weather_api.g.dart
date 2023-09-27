// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_api.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherApiAdapter extends TypeAdapter<WeatherApi> {
  @override
  final int typeId = 0;

  @override
  WeatherApi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherApi(
      location: fields[0] as Location?,
      current: fields[1] as Current?,
      forecast: fields[2] as Forecast?,
    );
  }

  @override
  void write(BinaryWriter writer, WeatherApi obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.location)
      ..writeByte(1)
      ..write(obj.current)
      ..writeByte(2)
      ..write(obj.forecast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherApiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ForecastAdapter extends TypeAdapter<Forecast> {
  @override
  final int typeId = 1;

  @override
  Forecast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Forecast(
      forecastday: (fields[0] as List?)?.cast<Forecastday>(),
    );
  }

  @override
  void write(BinaryWriter writer, Forecast obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.forecastday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ForecastdayAdapter extends TypeAdapter<Forecastday> {
  @override
  final int typeId = 2;

  @override
  Forecastday read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Forecastday(
      date: fields[0] as String?,
      dateEpoch: fields[1] as int?,
      day: fields[2] as Day?,
      astro: fields[3] as Astro?,
      hour: (fields[4] as List?)?.cast<Hour>(),
    );
  }

  @override
  void write(BinaryWriter writer, Forecastday obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.dateEpoch)
      ..writeByte(2)
      ..write(obj.day)
      ..writeByte(3)
      ..write(obj.astro)
      ..writeByte(4)
      ..write(obj.hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastdayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HourAdapter extends TypeAdapter<Hour> {
  @override
  final int typeId = 3;

  @override
  Hour read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hour(
      timeEpoch: fields[0] as int?,
      time: fields[1] as String?,
      tempC: fields[2] as double?,
      tempF: fields[3] as double?,
      isDay: fields[4] as int?,
      condition: fields[5] as Condition?,
      windMph: fields[6] as double?,
      windKph: fields[7] as double?,
      windDegree: fields[8] as int?,
      windDir: fields[9] as String?,
      pressureMb: fields[10] as double?,
      pressureIn: fields[11] as double?,
      precipMm: fields[12] as double?,
      precipIn: fields[13] as double?,
      humidity: fields[14] as int?,
      cloud: fields[15] as int?,
      feelslikeC: fields[16] as double?,
      feelslikeF: fields[17] as double?,
      windchillC: fields[18] as double?,
      windchillF: fields[19] as double?,
      heatindexC: fields[20] as double?,
      heatindexF: fields[21] as double?,
      dewpointC: fields[22] as double?,
      dewpointF: fields[23] as double?,
      willItRain: fields[24] as int?,
      chanceOfRain: fields[25] as int?,
      willItSnow: fields[26] as int?,
      chanceOfSnow: fields[27] as int?,
      visKm: fields[28] as double?,
      visMiles: fields[29] as double?,
      gustMph: fields[30] as double?,
      gustKph: fields[31] as double?,
      uv: fields[32] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Hour obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.timeEpoch)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.tempC)
      ..writeByte(3)
      ..write(obj.tempF)
      ..writeByte(4)
      ..write(obj.isDay)
      ..writeByte(5)
      ..write(obj.condition)
      ..writeByte(6)
      ..write(obj.windMph)
      ..writeByte(7)
      ..write(obj.windKph)
      ..writeByte(8)
      ..write(obj.windDegree)
      ..writeByte(9)
      ..write(obj.windDir)
      ..writeByte(10)
      ..write(obj.pressureMb)
      ..writeByte(11)
      ..write(obj.pressureIn)
      ..writeByte(12)
      ..write(obj.precipMm)
      ..writeByte(13)
      ..write(obj.precipIn)
      ..writeByte(14)
      ..write(obj.humidity)
      ..writeByte(15)
      ..write(obj.cloud)
      ..writeByte(16)
      ..write(obj.feelslikeC)
      ..writeByte(17)
      ..write(obj.feelslikeF)
      ..writeByte(18)
      ..write(obj.windchillC)
      ..writeByte(19)
      ..write(obj.windchillF)
      ..writeByte(20)
      ..write(obj.heatindexC)
      ..writeByte(21)
      ..write(obj.heatindexF)
      ..writeByte(22)
      ..write(obj.dewpointC)
      ..writeByte(23)
      ..write(obj.dewpointF)
      ..writeByte(24)
      ..write(obj.willItRain)
      ..writeByte(25)
      ..write(obj.chanceOfRain)
      ..writeByte(26)
      ..write(obj.willItSnow)
      ..writeByte(27)
      ..write(obj.chanceOfSnow)
      ..writeByte(28)
      ..write(obj.visKm)
      ..writeByte(29)
      ..write(obj.visMiles)
      ..writeByte(30)
      ..write(obj.gustMph)
      ..writeByte(31)
      ..write(obj.gustKph)
      ..writeByte(32)
      ..write(obj.uv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConditionAdapter extends TypeAdapter<Condition> {
  @override
  final int typeId = 4;

  @override
  Condition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Condition(
      text: fields[0] as String?,
      icon: fields[1] as String?,
      code: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Condition obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConditionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AstroAdapter extends TypeAdapter<Astro> {
  @override
  final int typeId = 5;

  @override
  Astro read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Astro(
      sunrise: fields[0] as String?,
      sunset: fields[1] as String?,
      moonrise: fields[2] as String?,
      moonset: fields[3] as String?,
      moonPhase: fields[4] as String?,
      moonIllumination: fields[5] as String?,
      isMoonUp: fields[6] as int?,
      isSunUp: fields[7] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Astro obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sunrise)
      ..writeByte(1)
      ..write(obj.sunset)
      ..writeByte(2)
      ..write(obj.moonrise)
      ..writeByte(3)
      ..write(obj.moonset)
      ..writeByte(4)
      ..write(obj.moonPhase)
      ..writeByte(5)
      ..write(obj.moonIllumination)
      ..writeByte(6)
      ..write(obj.isMoonUp)
      ..writeByte(7)
      ..write(obj.isSunUp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DayAdapter extends TypeAdapter<Day> {
  @override
  final int typeId = 6;

  @override
  Day read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Day(
      maxtempC: fields[0] as double?,
      maxtempF: fields[1] as double?,
      mintempC: fields[2] as double?,
      mintempF: fields[3] as double?,
      avgtempC: fields[4] as double?,
      avgtempF: fields[5] as double?,
      maxwindMph: fields[6] as double?,
      maxwindKph: fields[7] as double?,
      totalprecipMm: fields[8] as double?,
      totalprecipIn: fields[9] as double?,
      totalsnowCm: fields[10] as double?,
      avgvisKm: fields[11] as double?,
      avgvisMiles: fields[12] as double?,
      avghumidity: fields[13] as double?,
      dailyWillItRain: fields[14] as int?,
      dailyChanceOfRain: fields[15] as int?,
      dailyWillItSnow: fields[16] as int?,
      dailyChanceOfSnow: fields[17] as int?,
      condition: fields[18] as Condition?,
      uv: fields[19] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Day obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.maxtempC)
      ..writeByte(1)
      ..write(obj.maxtempF)
      ..writeByte(2)
      ..write(obj.mintempC)
      ..writeByte(3)
      ..write(obj.mintempF)
      ..writeByte(4)
      ..write(obj.avgtempC)
      ..writeByte(5)
      ..write(obj.avgtempF)
      ..writeByte(6)
      ..write(obj.maxwindMph)
      ..writeByte(7)
      ..write(obj.maxwindKph)
      ..writeByte(8)
      ..write(obj.totalprecipMm)
      ..writeByte(9)
      ..write(obj.totalprecipIn)
      ..writeByte(10)
      ..write(obj.totalsnowCm)
      ..writeByte(11)
      ..write(obj.avgvisKm)
      ..writeByte(12)
      ..write(obj.avgvisMiles)
      ..writeByte(13)
      ..write(obj.avghumidity)
      ..writeByte(14)
      ..write(obj.dailyWillItRain)
      ..writeByte(15)
      ..write(obj.dailyChanceOfRain)
      ..writeByte(16)
      ..write(obj.dailyWillItSnow)
      ..writeByte(17)
      ..write(obj.dailyChanceOfSnow)
      ..writeByte(18)
      ..write(obj.condition)
      ..writeByte(19)
      ..write(obj.uv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CurrentAdapter extends TypeAdapter<Current> {
  @override
  final int typeId = 7;

  @override
  Current read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Current(
      lastUpdatedEpoch: fields[0] as int?,
      lastUpdated: fields[1] as String?,
      tempC: fields[2] as double?,
      tempF: fields[3] as double?,
      isDay: fields[4] as int?,
      condition: fields[5] as Condition?,
      windMph: fields[6] as double?,
      windKph: fields[7] as double?,
      windDegree: fields[8] as int?,
      windDir: fields[9] as String?,
      pressureMb: fields[10] as double?,
      pressureIn: fields[11] as double?,
      precipMm: fields[12] as double?,
      precipIn: fields[13] as double?,
      humidity: fields[14] as int?,
      cloud: fields[15] as int?,
      feelslikeC: fields[16] as double?,
      feelslikeF: fields[17] as double?,
      visKm: fields[18] as double?,
      visMiles: fields[19] as double?,
      uv: fields[20] as double?,
      gustMph: fields[21] as double?,
      gustKph: fields[22] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Current obj) {
    writer
      ..writeByte(23)
      ..writeByte(0)
      ..write(obj.lastUpdatedEpoch)
      ..writeByte(1)
      ..write(obj.lastUpdated)
      ..writeByte(2)
      ..write(obj.tempC)
      ..writeByte(3)
      ..write(obj.tempF)
      ..writeByte(4)
      ..write(obj.isDay)
      ..writeByte(5)
      ..write(obj.condition)
      ..writeByte(6)
      ..write(obj.windMph)
      ..writeByte(7)
      ..write(obj.windKph)
      ..writeByte(8)
      ..write(obj.windDegree)
      ..writeByte(9)
      ..write(obj.windDir)
      ..writeByte(10)
      ..write(obj.pressureMb)
      ..writeByte(11)
      ..write(obj.pressureIn)
      ..writeByte(12)
      ..write(obj.precipMm)
      ..writeByte(13)
      ..write(obj.precipIn)
      ..writeByte(14)
      ..write(obj.humidity)
      ..writeByte(15)
      ..write(obj.cloud)
      ..writeByte(16)
      ..write(obj.feelslikeC)
      ..writeByte(17)
      ..write(obj.feelslikeF)
      ..writeByte(18)
      ..write(obj.visKm)
      ..writeByte(19)
      ..write(obj.visMiles)
      ..writeByte(20)
      ..write(obj.uv)
      ..writeByte(21)
      ..write(obj.gustMph)
      ..writeByte(22)
      ..write(obj.gustKph);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LocationAdapter extends TypeAdapter<Location> {
  @override
  final int typeId = 8;

  @override
  Location read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Location(
      name: fields[0] as String?,
      region: fields[1] as String?,
      country: fields[2] as String?,
      lat: fields[3] as double?,
      lon: fields[4] as double?,
      tzId: fields[5] as String?,
      localtimeEpoch: fields[6] as int?,
      localtime: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Location obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.region)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.lat)
      ..writeByte(4)
      ..write(obj.lon)
      ..writeByte(5)
      ..write(obj.tzId)
      ..writeByte(6)
      ..write(obj.localtimeEpoch)
      ..writeByte(7)
      ..write(obj.localtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
