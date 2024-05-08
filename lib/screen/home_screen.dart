import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_chienbm/bloc/weather_bloc_bloc.dart';
import 'package:weather_app_chienbm/values/assets.dart';
import 'package:weather_app_chienbm/values/datetime_pattern.dart';
import 'package:weather_app_chienbm/values/string.dart';
import 'package:weather_app_chienbm/widget/align_widget.dart';
import 'package:weather_app_chienbm/widget/divider.dart';
import 'package:weather_app_chienbm/widget/get_icon_weather.dart';
import 'package:weather_app_chienbm/widget/text_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: alignWidget(
            BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
              builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${state.weather.areaName}' ' - ' '${state.weather.country}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          AppStr.goodMorning,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        textWeather(
                            '${state.weather.temperature!.celsius!.round()}ºC',
                            55,
                            FontWeight.w600),
                        textWeather('${state.weather.weatherMain}', 25,
                            FontWeight.w500),
                        textWeather(
                            DateFormat(DateTimePattern.PATTERN_16)
                                .add_jm()
                                .format(state.weather.date!),
                            16,
                            FontWeight.w300),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAsset.sunrise,
                                  scale: 8,
                                ),
                                const SizedBox(height: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWeather(AppStr.sunrire, 16, FontWeight.w300),
                                    const SizedBox(height: 3),
                                    textWeather(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
                                        16,
                                        FontWeight.w700),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAsset.sunset,
                                  scale: 8,
                                ),
                                const SizedBox(height: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWeather(AppStr.sunset, 16, FontWeight.w300),
                                    const SizedBox(height: 3),
                                    textWeather(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunset!),
                                        16,
                                        FontWeight.w700),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppAsset.tempMax,
                                  scale: 8,
                                ),
                                const SizedBox(height: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWeather(
                                        AppStr.tempMax, 16, FontWeight.w300),
                                    const SizedBox(height: 3),
                                    textWeather(
                                        "${state.weather.tempMax!.celsius!.round()}ºC ",
                                        16,
                                        FontWeight.w700),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppAsset.tempMin,
                                  scale: 8,
                                ),
                                const SizedBox(height: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textWeather(
                                        AppStr.tempMin, 16, FontWeight.w300),
                                    const SizedBox(height: 3),
                                    textWeather(
                                        "${state.weather.tempMin!.celsius!.round()}ºC ",
                                        16,
                                        FontWeight.w700),
                                  ],
                                )
                              ],
                            ),
                           
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
