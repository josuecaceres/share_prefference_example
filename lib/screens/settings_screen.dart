import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:preferences/providers/theme_provider.dart';
import 'package:preferences/share_preferences/preferences.dart';
import 'package:preferences/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  static const String routerName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
/*   bool isDarkmode = false;
  int gender = 1;
  String name = 'Romeo'; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const CustomDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'Ajustes',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                  value: Preferences.isDarkmode,
                  title: const Text('Darkmode'),
                  onChanged: (value) {
                    setState(() {
                      Preferences.isDarkmode = value;
                      final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
                      value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                    });
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: const Text('Masculino'),
                  onChanged: (value) {
                    setState(() {
                      Preferences.gender = value ?? 1;
                    });
                  },
                ),
                const Divider(),
                RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  title: const Text('Femenino'),
                  onChanged: (value) {
                    setState(() {
                      Preferences.gender = value ?? 2;
                    });
                  },
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    initialValue: Preferences.name,
                    decoration: const InputDecoration(
                      labelText: 'Nombre',
                      helperText: 'Nombre de usuario',
                    ),
                    onChanged: (value) {
                      setState(() {
                        Preferences.name = value;
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
