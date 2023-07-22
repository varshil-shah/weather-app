String apiUrl(lat, long, apiKey) {
  String url =
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&appid=$apiKey&units=metric";
  return url;
}
