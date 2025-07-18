// Flutter Material Design importieren – für Widgets wie Card, Text, Padding etc.
import 'package:flutter/material.dart';

// WelcomeCard ist ein StatelessWidget – es zeigt einen Begrüßungstext an,
// ändert sich aber selbst nicht dynamisch.
class WelcomeCard extends StatelessWidget {
  const WelcomeCard({
    super.key,
  }); // Konstruktor mit optionalem Key (für Flutter intern)

  @override
  Widget build(BuildContext context) {
    // Wir bauen eine Card – das ist ein typischer Material Design-Kasten mit Schatten
    return Card(
      elevation: 4, // Erzeugt einen leichten Schatten für 3D-Effekt
      color: Colors.lightBlueAccent, // Hintergrundfarbe der Karte
      // Innenabstand innerhalb der Karte – sorgt für Luft um den Text
      child: Padding(
        padding: const EdgeInsets.all(24.0),

        // Unser eigentlicher Inhalt: ein einfacher Text mit Emoji und Willkommensnachricht
        child: Text(
          "🌎 Willkommen zu deinen Reiseinspirationen", // Der angezeigte Text
          style: const TextStyle(
            fontSize: 18, // Schriftgröße
            color: Colors.white, // Schriftfarbe (weiß auf blauem Hintergrund)
          ),
        ),
      ),
    );
  }
}
