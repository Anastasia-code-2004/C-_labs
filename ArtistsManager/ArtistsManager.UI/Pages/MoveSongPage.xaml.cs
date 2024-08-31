using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ArtistsManager.UI.ViewModels;

namespace ArtistsManager.UI.Pages;

public partial class MoveSongPage : ContentPage
{
    public MoveSongPage(MoveSongViewModel moveSongViewModel)
    {
        InitializeComponent();
        BindingContext = moveSongViewModel;
    }
}