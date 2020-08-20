class PokemonListModel {

 List<Pokemon> pokemonList;

 PokemonListModel(list) {
    this.pokemonList = list;
   
  }
}


class Pokemon {

  String name;
  String thumbnailUri;

  Pokemon(name, thumbnailUri) {
    this.name = name;
    this.thumbnailUri = thumbnailUri;
  }
}