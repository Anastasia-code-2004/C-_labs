namespace NikolaychikLAB1;
using NikolaychikLAB1.Services;
using NikolaychikLAB1.Entities;
using CommunityToolkit.Maui.Views;

public partial class ArtistSongsPage : ContentPage
{
    IEnumerable<Artist> artists;
    readonly IDbService dbService;
    public ArtistSongsPage(IDbService dbService)
	{
		InitializeComponent();
        this.dbService = dbService;
        artists = [];
    }

    private void ContentPage_Loaded(object sender, EventArgs e)
    {
        dbService.Init();
        artistPicker.Items.Clear();
        artists = dbService.GetAllArtists();
        foreach (var artist in artists)
        {
            artistPicker.Items.Add(artist.Name);
        }
    }

    private void ArtistPicker_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = 0;
        foreach (var artist in artists)
        {
            if (artist.Name == artistPicker.SelectedItem?.ToString())
            {
                id = artist.Id;
                break;
            }
        }
        var songs = dbService.GetArtistSongs(id);

        var songNames = new List<string>();
        foreach (var song in songs)
        {
            songNames.Add(song.Name);
        }
        
        songsListView.ItemsSource = songNames;
    }

    private void songsListView_ItemTapped(object sender, ItemTappedEventArgs e)
    {
        if(e.Item.ToString() == "Space Song")
        {
            music.Source = MediaSource.FromResource("spacesong.mp3");
            music.Play();
        }

        if (e.Item.ToString() == "Deja Vu")
        {
            music.Source = MediaSource.FromResource("dejavu.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "Good 4 u")
        {
            music.Source = MediaSource.FromResource("good4u.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "West Coast")
        {
            music.Source = MediaSource.FromResource("westcoast.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "Get free")
        {
            music.Source = MediaSource.FromResource("getfree.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "Cherry")
        {
            music.Source = MediaSource.FromResource("cherry.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "Bartender")
        {
            music.Source = MediaSource.FromResource("bartender.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "brutal")
        {
            music.Source = "https://www.tonehappy.com/mp3/olivia-rodrigo-brutal-ringtone.mp3";
            music.Play();
        }
        if (e.Item.ToString() == "jelousy, jealousy")
        {
            music.Source = "https://www.tonehappy.com/mp3/olivia-rodrigo-jealousy-jealousy-ringtone.mp3";
            music.Play();
        }
        if (e.Item.ToString() == "Drunk in L.A.")
        {
            music.Source = MediaSource.FromResource("drunkinla.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "Master of None")
        {
            music.Source = MediaSource.FromResource("masterofnone.mp3");
            music.Play();
        }
        if (e.Item.ToString() == "Silver Soul")
        {
            music.Source = MediaSource.FromResource("silversoul.mp3");
            music.Play();
        }
    }

    private void StopButton_Clicked(object sender, EventArgs e)
    {
        music.Stop();
    }
}