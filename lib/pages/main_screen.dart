// ignore_for_file: dead_code
import 'package:demoapp/api/consts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final WeatherFactory _wF = WeatherFactory(OPENWEATHER_API_KEY);
  final TextEditingController _cityController = TextEditingController();

  Weather? weather;

  @override
  void initState() {
    super.initState();
    _fetchWeatherData("London");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    if (weather == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _cityController,
              onSubmitted: (value) {
                _fetchWeatherData(value);
              },
              decoration: InputDecoration(
                labelText: 'City name',
                hintText: 'Enter city name',
                hintStyle: TextStyle(
                    color: Colors.white,
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 10,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _fetchWeatherData(_cityController.text);
                  },
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _localHeader(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _dateTimeInfo(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _weatherIcon(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _currentTemp(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _extraInfo(),
          ],
        ),
      ),
    );
  }

  void _fetchWeatherData(String cityName) {
    _wF.currentWeatherByCityName(cityName).then((w) {
      setState(() {
        weather = w;
      });
    });
  }

  Widget _localHeader() {
    return SingleChildScrollView(
      child: Text(
        weather!.areaName ?? "",
        style: const TextStyle(
            fontSize: 20,
            fontFamily: "Lato",
            fontWeight: FontWeight.w500,
            color: Colors.white),
      ),
    );
  }

  Widget _dateTimeInfo() {
    DateTime now = weather!.date!;
    return Column(
      children: [
        Text(
          DateFormat("hh:mm a").format(now),
          style: const TextStyle(
              fontSize: 30,
              fontFamily: "Lato",
              fontWeight: FontWeight.w500,
              color: Colors.white),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat(" EEEE ").format(now),
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              "  ${DateFormat("d.m.y").format(now)}",
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Lato",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://openweathermap.org/img/wn/${weather?.weatherIcon}@4x.png"),
            ),
          ),
        ),
        Text(
          weather?.weatherDescription ?? "",
          style: GoogleFonts.lato(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _currentTemp() {
    return Text(
      "${weather?.temperature!.celsius?.toStringAsFixed(0)}°C",
      style: GoogleFonts.lato(
          fontSize: 90, color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.15,
      width: MediaQuery.sizeOf(context).width * 0.80,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${weather?.tempMax?.celsius?.toStringAsFixed(0)}°C",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
              Text(
                "Max: ${weather?.tempMin?.celsius?.toStringAsFixed(0)}°C",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
              Text(
                "humidity: ${weather?.humidity?.toStringAsFixed(0)}%",
                style: GoogleFonts.lato(fontSize: 15, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
