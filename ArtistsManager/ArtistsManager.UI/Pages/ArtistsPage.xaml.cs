using ArtistsManager.UI.ViewModels;

namespace ArtistsManager.UI.Pages;

public partial class ArtistsPage : ContentPage
{
	public ArtistsPage(ArtistsViewModel artistsViewModel)
	{
		InitializeComponent();
		BindingContext = artistsViewModel;
	}
}