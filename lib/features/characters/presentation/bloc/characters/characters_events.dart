sealed class CharactersEvents {}

/// Notifies bloc to get page.
class GetCharacters extends CharactersEvents {
  final int page;

  GetCharacters({
      this.page = 1,
  });
}
