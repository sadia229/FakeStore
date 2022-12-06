import 'package:connectivity_plus/connectivity_plus.dart';

class CheckInternetConnection {
  Connectivity connectivity = Connectivity();

  checkConnection() async {
    var connection = await connectivity.checkConnectivity();
    connectivity.onConnectivityChanged.listen((event) {
      if (connection == ConnectivityResult.mobile &&
          connection == ConnectivityResult.wifi)
        print('stable connection');
      else {
        print('No connection');
      }
    });
  }
}
