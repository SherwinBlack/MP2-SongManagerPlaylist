class Song {
  // TODO: Implement the Song class

  // Properties, constructor, and methods go here
  String title;
  String artist;
  int duration;

  Song(this.title, this.artist, this.duration);

  void display() {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    print(
        '$title by $artist (${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')})');
  }
}

// TODO: Implement the Playlist class
class Playlist {
  // Properties, constructor, and methods go here
  String name;
  List<Song> songs;

  Playlist(this.name) : songs = [];

  void addSong(Song song) => songs.add(song);

  void displayPlaylist() {
    print('Playlist: $name');
    songs.forEach((song) => song.display());
  }

  void sortByArtist() => songs.sort((a, b) => a.artist.compareTo(b.artist));
}

// TODO: Implement the MusicFestival class
class MusicFestival {
  // Properties, constructor, and methods go here
  String win;
  List<Playlist> stages;

  MusicFestival(this.win) : stages = [];

  void addStage(Playlist playlist) => stages.add(playlist);

  int totalFestivalDuration() => stages.fold(
      0,
      (sum, playlist) =>
          sum +
          playlist.songs.fold(0, (songSum, song) => songSum + song.duration));

  void displayFestival() {
    print('Music Festival: $win');
    stages.forEach((stage) => stage.displayPlaylist());
  }
}

void main() {
// Your code to test the classes goes here
  print('Welcome to the Music Festival Playlist Manager!');
  print('');
  // Create and manipulate objects here

  // Create some sample songs
  final winfavSongs = [
    Song('Love', 'WavetoEarth', 305),
    Song('Seasons', 'WavetoEarth', 256),
    Song('Valentine', 'Laufey', 168),
    Song('From the start', 'Laufey', 170),
    Song('The night we met', 'Lord Huron', 208),
    Song('Makasama', 'Lucas Miguel', 223),
    Song('Homesick', 'WavetoEarth', 300),
  ];

  // Create playlists for different festival stages
  final mainStage = Playlist('Main Stage')
    ..addSong(winfavSongs[0])
    ..addSong(winfavSongs[3])
    ..addSong(winfavSongs[4])
    ..addSong(winfavSongs[5])
    ..addSong(winfavSongs[6]);

  final indieStage = Playlist('Indie Stage')..addSong(winfavSongs[1]);
  final electronicStage = Playlist('Electronic Stage')..addSong(winfavSongs[2]);

  // Create the music festival
  final festival = MusicFestival('Twice Music Festival')
    ..addStage(mainStage)
    ..addStage(indieStage)
    ..addStage(electronicStage);

  // Display total festival duration
  print('Total Festival Duration: ${festival.totalFestivalDuration()} seconds');
  print('');

  // Display random songs from different stages
  print('Random Songs:');
  indieStage.songs[0].display();
  electronicStage.songs[0].display();
  mainStage.songs[0].display();
  print('');

  // Sort the main stage playlist by artist and display
  mainStage.sortByArtist();
  print('Main Stage playlist sorted by artist:');
  mainStage.displayPlaylist();
}
