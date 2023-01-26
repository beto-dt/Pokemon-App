class PokedexDetails {
  final int? id;
  final String? name;
  final String? imageUrl;
  final List<String>? types;
  final int? height;
  final int? weight;
  final String? description;

  PokedexDetails(
      {this.id,
      this.name,
      this.imageUrl,
      this.types,
      this.height,
      this.weight,
      this.description});
}
