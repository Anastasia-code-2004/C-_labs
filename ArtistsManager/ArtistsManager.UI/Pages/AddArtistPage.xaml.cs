using ArtistsManager.UI.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.UI.Pages;

public partial class AddArtistPage : ContentPage
{
    public AddArtistPage(AddArtistViewModel addArtistViewModel)
    {
        InitializeComponent();
        BindingContext = addArtistViewModel;
    }
}