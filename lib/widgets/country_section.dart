// Flutter-Bibliothek importieren (enthält alle grundlegenden UI-Elemente)
import 'package:flutter/material.dart';

// Unsere eigene wiederverwendbare Länderkarten-Komponente
import 'country_card.dart';

// CountrySection ist ein wiederverwendbares Widget, das eine Ländergruppe mit Titel zeigt
class CountrySection extends StatelessWidget {
  // Titel der Sektion, z. B. "Europa"
  final String title;

  // Liste mit Ländern, z. B. [{"emoji": "🇫🇷", "name": "Frankreich"}, …]
  final List<Map<String, String>> countries;

  // Callback-Funktion, wenn ein Land angeklickt wird
  final Function(String) onCountryTap;

  // Optionales Icon für die Sektion
  final IconData? icon;

  // Konstruktor
  const CountrySection({
    super.key,
    required this.title,
    required this.countries,
    required this.onCountryTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Linksbündig
      children: [
        // Kopfzeile mit optionalem Icon und Titel
        Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ), // Abstand zwischen Icon & Text
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.blueGrey,
                ), // Icon anzeigen
              ),
            // Titeltext in der passenden Theme-Schriftart (z. B. fett & mittelgroß)
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 8), // Abstand nach der Überschrift
        // Horizontale Liste mit Ländern (als Karten)
        SizedBox(
          height: 140, // Höhe der ListView
          child: ListView.separated(
            scrollDirection: Axis.horizontal, // von links nach rechts scrollen
            physics: const BouncingScrollPhysics(), // iOS-typischer "Gummizug"
            itemCount: countries.length, // Anzahl der Länder
            separatorBuilder: (_, __) =>
                const SizedBox(width: 8), // Abstand zwischen Karten
            itemBuilder: (context, index) {
              final country = countries[index]; // einzelnes Land aus der Liste
              return CountryCard(
                emoji: country['emoji']!, // z. B. 🇮🇹
                name: country['name']!, // z. B. Italien
                onTap: () => onCountryTap(country['name']!), // Callback bei Tap
              );
            },
          ),
        ),
        const SizedBox(height: 24), // Abstand zur nächsten Sektion
      ],
    );
  }
}
