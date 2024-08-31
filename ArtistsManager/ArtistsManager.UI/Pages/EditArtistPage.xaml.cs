using ArtistsManager.UI.ViewModels;

namespace ArtistsManager.UI.Pages;

public partial class EditArtistPage : ContentPage
{
	public EditArtistPage(EditArtistViewModel editArtistViewModel)
	{
		InitializeComponent();
		BindingContext = editArtistViewModel;
	}
}