/// State holder enum for the current active stories view mode
enum StoriesViewType { list, grid }

/// Contains all the available sections in the API provider
enum StorySection {
  arts("arts"),
  automobiles("automobiles"),
  books("books"),
  business("business"),
  fashion("fashion"),
  food("food"),
  health("health"),
  home("home"),
  insider("insider"),
  magazine("magazine"),
  movies("movies"),
  nyRegion("nyregion"),
  obituaries("obituaries"),
  opinion("opinion"),
  politics("politics"),
  realEstate("realestate"),
  science("science"),
  sports("sports"),
  sundayreview("sundayreview"),
  technology("technology"),
  theater("theater"),
  tMagazine("t-magazine"),
  travel("travel"),
  upshot("upshot"),
  us("us"),
  world("world");

  const StorySection(this.name);
  final String name;
}
