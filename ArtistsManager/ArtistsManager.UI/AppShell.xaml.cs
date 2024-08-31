using ArtistsManager.UI.Pages;

namespace ArtistsManager.UI
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute(nameof(SongDetailsPage), typeof(SongDetailsPage));
            Routing.RegisterRoute(nameof(AddArtistPage), typeof(AddArtistPage));
            Routing.RegisterRoute(nameof(AddSongPage), typeof(AddSongPage));
            Routing.RegisterRoute(nameof(MoveSongPage), typeof(MoveSongPage));
            Routing.RegisterRoute(nameof(EditSongPage), typeof(EditSongPage));
            Routing.RegisterRoute(nameof(EditArtistPage), typeof(EditArtistPage));
        }
    }
}
