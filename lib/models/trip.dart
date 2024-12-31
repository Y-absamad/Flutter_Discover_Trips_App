class Trip {
  final String id;
  final List<String> categories;
  final String name;
  final String imageUrl;
  final List<String> activities;
  final List<String> program;
  final int duration;
  final Season season;
  final TripType tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  
  const Trip({
    required this.id,
    required this.categories,
    required this.name,
    required this.imageUrl,
    required this.activities,
    required this.program,
    required this.duration,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}

enum Season {
  winter,
  summer,
  spring,
  autumn,
}

enum TripType {
  adventure,
  family,
  romantic,
  cultural,
  recovery,
  therapy,
  activities,
}
