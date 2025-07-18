import 'package:flutter/material.dart';
// Imports für die einzelnen Widget-Bausteine
import '../widgets/country_section.dart';
import '../widgets/welcome_card.dart';
import '../widgets/daily_suggestion_card.dart';
import '../data/country_data.dart';

// Hauptseite der App
class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

// Der State für TravelHomePage – hier wird z. B. gespeichert, welche Länder ausgewählt sind
class _TravelHomePageState extends State<TravelHomePage> {
  // Liste der Lieblingsländer
  final List<String> _selectedCountries = [];

  // Aktuell ausgewählter Tab-Index (Home, Suche, Profil)
  int _currentIndex = 0;

  // Fügt ein Land zu den Favoriten hinzu (wenn es noch nicht drin ist)
  void _addCountry(String name) {
    if (!_selectedCountries.contains(name)) {
      setState(() => _selectedCountries.add(name));
    }
  }

  // Wird aufgerufen, wenn man in der Navigation einen Tab antippt
  void _onTabSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Liste der verschiedenen Seiteninhalte
    final List<Widget> pages = [
      _buildHomeContent(), // Startseite
      _buildSearchContent(), // Suchseite
      _buildProfileContent(), // Profilseite
    ];

    return Scaffold(
      // Oberer App-Balken
      appBar: AppBar(title: const Text("Travel Picks")),

      // Der sichtbare Inhalt richtet sich nach dem aktuellen Tab
      body: pages[_currentIndex],

      // Die neue Material 3 NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onTabSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Suche'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // Inhalt für die Startseite (Home)
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeCard(), // Begrüßungskarte
          const SizedBox(height: 16),

          // Vorschläge des Tages (aus allen Ländern)
          DailySuggestionCard(
            countries: [...europeCountries, ...southAmericaCountries],
          ),
          const SizedBox(height: 24),

          // Abschnitt für Europa-Länder
          CountrySection(
            title: "Europa",
            countries: europeCountries,
            onCountryTap: _addCountry,
          ),

          // Abschnitt für Südamerika-Länder
          CountrySection(
            title: "Südamerika",
            countries: southAmericaCountries,
            onCountryTap: _addCountry,
          ),

          // Bereich für die Favoriten
          const Text("Favoriten", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),

          // Anzeige der gewählten Lieblingsländer als Chips
          Wrap(
            spacing: 8,
            children: _selectedCountries
                .map((name) => Chip(label: Text(name)))
                .toList(),
          ),
        ],
      ),
    );
  }

  // Inhalt für die Such-Seite (noch Platzhalter)
  Widget _buildSearchContent() {
    return const Center(child: Text("🔍 Hier könnte eine Suchfunktion stehen"));
  }

  // Inhalt für die Profil-Seite (noch Platzhalter)
  Widget _buildProfileContent() {
    return const Center(child: Text("👤 Dein Profil kommt bald"));
  }
}
