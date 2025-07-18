// Dart-Zufallsfunktion importieren – brauchen wir für die zufällige Länderauswahl
import 'dart:math';

// Flutter-UI importieren
import 'package:flutter/material.dart';

// Unser eigenes InfoCard-Widget importieren – es kümmert sich um das Design
import 'info_card.dart';

// DailySuggestionCard ist ein StatelessWidget – zeigt zwei zufällige Länder an
class DailySuggestionCard extends StatelessWidget {
  // Liste der verfügbaren Länder (kommt von außen)
  final List<Map<String, String>> countries;

  // Konstruktor mit required countries-Parameter
  const DailySuggestionCard({super.key, required this.countries});

  @override
  Widget build(BuildContext context) {
    // Zufallsgenerator
    final random = Random();

    // Zwei zufällige Länder aus der Liste auswählen
    final picks = List.generate(
      2, // zwei Einträge
      (_) => countries[random.nextInt(countries.length)],
    );

    // Rückgabe: Wir nutzen unsere gemeinsame InfoCard als Rahmen
    return InfoCard(
      color: Colors.orange.shade50, // Hintergrundfarbe der Karte
      icon: Icons.public, // Weltkugel-Icon
      title: "Deine Reiseziele des Tages", // Überschrift
      // Kind-Widget der Karte: Eine Spalte mit zwei Ländern
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Linksbündig
        children: picks.map((p) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4), // Abstand nach unten
            child: Row(
              children: [
                // Emoji-Flagge
                Text(p['emoji']!, style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 8), // Abstand zum Ländernamen
                // Ländername
                Text(p['name']!, style: const TextStyle(fontSize: 18)),
              ],
            ),
          );
        }).toList(), // Alle Einträge als Liste zurückgeben
      ),
    );
  }
}
