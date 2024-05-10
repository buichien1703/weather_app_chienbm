import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app_chienbm/bloc/weather_bloc_bloc.dart';
import 'package:weather_app_chienbm/screen/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			debugShowCheckedModeBanner: false,
      home: FutureBuilder(
				future: _determinePosition(),
        builder: (context, snap) {
					if(snap.hasData) {
						return BlocProvider<WeatherBlocBloc>(
							create: (context) => WeatherBlocBloc()..add(
								FetchWeather(snap.data as Position)
							),
							child: const HomeScreen(),
						);
					} else {
						return const Scaffold(
							body: Center(
								child: CircularProgressIndicator(),
							),
						);
					}
        }
      )
    );
  }
}


/// Xác định vị trí hiện tại của thiết bị.
///
/// Khi dịch vụ định vị không được bật hoặc không có quyền
/// Future bị từ chốisẽ trả về lỗi.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

// Kiểm tra xem định vị có được bật hay không.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
// định vị không được kích hoạt, không tiếp tục
    // truy cập vị trí và yêu cầu người dùng
    //  kích hoạt định vị.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
     // bị từ chối,   thử lại
      // yêu cầu lại quyền 
      // Ứng dụng  sẽ hiển thị giao diện người dùng.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Quyền bị từ chối vĩnh viễn
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 
  //oke
  // tiếp tục truy cập vị trí của thiết bị.
  return await Geolocator.getCurrentPosition();
}