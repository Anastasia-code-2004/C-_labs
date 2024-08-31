using ArtistsManager.UI.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsManager.UI.Pages;

public partial class AddSongPage : ContentPage
{
    public AddSongPage(AddSongViewModel addSongViewModel)
    {
        InitializeComponent();
        BindingContext = addSongViewModel;
    }
}