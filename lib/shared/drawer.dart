import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_app/pages/auto_size_text/auto_size_text_page.dart';
import 'package:my_app/pages/battery_page/battery_page.dart';
import 'package:my_app/pages/pages.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey.shade700,
                  Colors.grey.shade200,
                ],
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://pbs.twimg.com/media/FnUFi3yXwAcL-uz.jpg:large",
              ),
            ),
            accountName: const Text(
              "Gabriel Saturi",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: const Text(
              "Gabrielsaturi@email.com",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ),
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.userAstronaut,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Meus dados',
            onTap: () => _navigateTo(context, DadosCadastraisHive()),
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.textWidth,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Auto Size Text',
            onTap: () => _navigateTo(context, AutoSizeTextPage()),
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.batteryFull,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Battery',
            onTap: () => _navigateTo(context, BatteryPage()),
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.google,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Abrir Google',
            onTap: () async {
              await launchUrl(Uri.parse('https://www.google.com'));
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.map,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Abrir Google maps',
            onTap: () async {
              await launchUrl(Uri.parse('https://www.google.com/maps'));
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.shareFromSquare,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Compartilhar',
            onTap: () async {
              Share.share('check out my website https://www.google.com',
                  subject: 'Look what I made!');
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.folder,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'path',
            onTap: () async {
              var appDocDir = await path_provider.getTemporaryDirectory();
              print(appDocDir);
              var appDoc =
                  await path_provider.getApplicationDocumentsDirectory();
              print(appDoc);
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.info,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Infos',
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              String appName = packageInfo.appName;
              String packageName = packageInfo.packageName;
              String version = packageInfo.version;
              String buildNumber = packageInfo.buildNumber;
              print(
                  'appName: $appName, packageName: $packageName, version: $version, buildNumber: $buildNumber');
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.dev,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Device infos',
            onTap: () async {
              DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
              AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
              print('Running on ${androidInfo.model}');
              print('Running on ${androidInfo.version}');
              print('Running on ${androidInfo.board}');
              print('Running on ${androidInfo.bootloader}');
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.wifi,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'Connectivity infos',
            onTap: () async {
              final List<ConnectivityResult> connectivityResult =
                  await (Connectivity().checkConnectivity());
              if (connectivityResult.contains(ConnectivityResult.mobile)) {
              } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
              } else if (connectivityResult
                  .contains(ConnectivityResult.ethernet)) {
              } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
              } else if (connectivityResult
                  .contains(ConnectivityResult.bluetooth)) {
              } else if (connectivityResult
                  .contains(ConnectivityResult.other)) {
              } else if (connectivityResult
                  .contains(ConnectivityResult.none)) {}
              print(connectivityResult);
            },
          ),
          const Divider(), // Adiciona uma linha divisória
          _createDrawerItem(
            icon: const FaIcon(
              FontAwesomeIcons.locationPin,
              color: Color.fromARGB(255, 57, 57, 59),
              size: 30,
            ),
            text: 'GPS infos',
            onTap: () async {
              Future<Position> _determinePosition() async {
                bool serviceEnabled;
                LocationPermission permission;
                serviceEnabled = await Geolocator.isLocationServiceEnabled();
                if (!serviceEnabled) {
                  return Future.error('Location services are disabled.');
                }
                permission = await Geolocator.checkPermission();
                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                  if (permission == LocationPermission.denied) {
                    return Future.error('Location permissions are denied');
                  }
                }

                if (permission == LocationPermission.deniedForever) {
                  return Future.error(
                      'Location permissions are permanently denied, we cannot request permissions.');
                }
                return await Geolocator.getCurrentPosition();
              }

              print(await _determinePosition());
            },
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required Widget icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Flexible(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pop(context); // Fecha o drawer
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
