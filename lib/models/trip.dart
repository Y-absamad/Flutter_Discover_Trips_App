class Trip {
  final String name;
  final int id;
  final int categoryId;
  final String imageUrl;
  final String informaion;
  final List<String> activities;
  final List<String> program;
  final String loction;
  final String season;
  final String tripType;
  final bool isInSummer;
  final bool isInWinter;
  final bool isForFamilies;

  
  const Trip( {
    required this.name,
    required this.id,
    required this.categoryId,
    required this.imageUrl,
    required this.informaion,
    required this.activities,
    required this.program,
    required this.loction,
    required this.season,
    required this.tripType,
    required this.isInSummer,
    required this.isInWinter,
    required this.isForFamilies,
  });
}

