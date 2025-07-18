// Flutter Material Design Bibliothek importieren.
// Enthält alles, was wir für UI-Elemente wie Buttons, AppBar, Text etc. brauchen.
import 'package:flutter/material.dart';

// Unsere eigene Datei mit dem Startscreen der App (TravelHomePage) importieren.
import 'screens/travel_home_page.dart';

// Einstiegspunkt der App. Wird beim Start einmal aufgerufen.
void main() {
  // Wir starten unsere App und übergeben ihr das oberste Widget: TravelApp.
  runApp(const TravelApp());
}

// TravelApp ist das Wurzel-Widget der gesamten App. Es ist "stateless",
// also verändert sich der Inhalt dieses Widgets selbst nicht.
class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp ist das Grundgerüst der App im Material Design-Stil.
    return MaterialApp(
      // App-Titel (z. B. sichtbar im App-Switcher oder bei manchen Android-Versionen)
      title: 'Travel Picks',

      // Hier definieren wir das globale Theme der App.
      theme: ThemeData(
        // Farb-Basis für das gesamte Farbschema der App
        colorSchemeSeed: Colors.teal,

        // Aktiviert das moderne Material Design 3 (auch "Material You")
        useMaterial3: true,

        // Legt fest, ob die App hell oder dunkel ist (hier: hell)
        brightness: Brightness.light,
      ),

      // Entfernt das "Debug"-Banner oben rechts im App-Fenster
      debugShowCheckedModeBanner: false,

      // Das Start-Widget der App – also was als erstes angezeigt wird
      home: const TravelHomePage(),
    );
  }
}
