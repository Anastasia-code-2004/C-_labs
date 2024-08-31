using ArtistsManager.UI.ViewModels;
namespace ArtistsManager.UI.Pages;

public partial class SongDetailsPage : ContentPage
{
	public SongDetailsPage(SongDetailsViewModel songDetailsViewModel)
	{
		InitializeComponent();
		BindingContext = songDetailsViewModel;
	}
}