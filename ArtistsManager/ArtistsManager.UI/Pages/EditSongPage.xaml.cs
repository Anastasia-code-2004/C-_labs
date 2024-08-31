using ArtistsManager.UI.ViewModels;

namespace ArtistsManager.UI.Pages;

public partial class EditSongPage : ContentPage
{
    public EditSongPage(EditSongViewModel editSongViewModel)
    {
        InitializeComponent();
        BindingContext = editSongViewModel;
    }
}