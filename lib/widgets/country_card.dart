// Flutter-Basisbibliothek für UI
import 'package:flutter/material.dart';

// CountryCard ist ein kleines, klickbares Widget, das ein Land anzeigt
class CountryCard extends StatelessWidget {
  // Emoji-Flagge des Landes, z. B. 🇮🇹
  final String emoji;

  // Name des Landes, z. B. "Italien"
  final String name;

  // Optionaler Tap-Callback – wird ausgelöst, wenn die Karte angeklickt wird
  final VoidCallback? onTap;

  // Konstruktor mit Pflichtfeldern emoji und name
  const CountryCard({
    super.key,
    required this.emoji,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wenn man auf die Karte tippt, wird die Callback-Funktion (falls vorhanden) ausgeführt
      onTap: onTap,
      child: Container(
        width: 120, // Feste Breite der Karte
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
        ), // Abstand zu anderen Karten
        child: Card(
          elevation: 4, // Schatteneffekt für etwas Tiefe
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ), // Innenabstand oben/unten
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Inhalte zentrieren
              children: [
                // Länder-Emoji als große Schrift
                Text(emoji, style: const TextStyle(fontSize: 32)),

                const SizedBox(height: 8), // Kleiner Abstand
                // Ländername unter dem Emoji
                Text(name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
