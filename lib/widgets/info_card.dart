// Flutter-Bibliothek importieren – enthält alle UI-Komponenten wie Card, Icon, Padding usw.
import 'package:flutter/material.dart';

// InfoCard ist ein wiederverwendbares, flexibles Karten-Widget.
// Es zeigt optional ein Icon, einen Titel und darunter beliebigen Inhalt (über `child`).
class InfoCard extends StatelessWidget {
  // Der Inhalt, der innerhalb der Karte angezeigt werden soll (z. B. Text oder Widgets)
  final Widget child;

  // Hintergrundfarbe der Karte (Standard: weiß)
  final Color color;

  // Optionales Symbol (Icon) vor dem Titel
  final IconData? icon;

  // Optionaler Titeltext oben in der Karte
  final String? title;

  // Konstruktor mit benannten Parametern, `child` ist verpflichtend, Rest optional
  const InfoCard({
    super.key,
    required this.child,
    this.color = Colors.white,
    this.icon,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    // Die Karte bekommt eine feste Breite relativ zur Bildschirmgröße (88 %)
    return FractionallySizedBox(
      widthFactor: 0.88,

      // Material Design Card mit Farbe, Schatten und abgerundeten Ecken
      child: Card(
        elevation: 4, // Leichter Schatten für 3D-Effekt
        color: color, // Hintergrundfarbe (standardmäßig weiß)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Runde Ecken
        ),

        // Innenabstand rund um den Inhalt
        child: Padding(
          padding: const EdgeInsets.all(16),

          // Der Inhalt ist eine vertikale Spalte (Column)
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wenn ein Titel vorhanden ist, dann zeigen wir ihn zusammen mit dem Icon
              if (title != null)
                Row(
                  children: [
                    // Wenn auch ein Icon vorhanden ist, dann zeige es links neben dem Titel
                    if (icon != null)
                      Icon(icon, size: 20, color: Colors.blueGrey),

                    // Kleiner Abstand zwischen Icon und Text
                    if (icon != null) const SizedBox(width: 8),

                    // Der Titeltext in fetter und größerer Schrift
                    Text(
                      title!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

              // Wenn es einen Titel gibt, dann fügen wir darunter etwas Abstand ein
              if (title != null) const SizedBox(height: 12),

              // Schließlich wird der eigentliche Inhalt (child) angezeigt
              child,
            ],
          ),
        ),
      ),
    );
  }
}
