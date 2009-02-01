/* I added this comment */

int
main()
{
  struct Person hero = { 20, "Robin Hood", 191 };
  struct Person sidekick;

  sidekick.age = 31;
  sidekick.name = "John Little"
  sidekick.height_in_cm = 237;

  printf("%s is %d years old and stands %dcm tall in his socks\n",
         sidekick.name, sidekick.age, sidekick.height_in_cm);

  printf( "He is often seen with %s.\n", hero.name );

  return 0;
}