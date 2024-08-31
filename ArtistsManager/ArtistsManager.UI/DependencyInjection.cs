using ArtistsManager.UI.Pages;
using ArtistsManager.UI.ViewModels;

namespace ArtistsManager.UI;

public static class DependencyInjection
{
    public static IServiceCollection RegisterPages(this IServiceCollection services)
    {
        services.AddSingleton<ArtistsPage>()
                .AddTransient<SongDetailsPage>()
                .AddTransient<AddArtistPage>()
                .AddTransient<AddSongPage>()
                .AddTransient<MoveSongPage>()
                .AddTransient<EditSongPage>()
                .AddTransient<EditArtistPage>();
        return services;
    }
    public static IServiceCollection RegisterViewModels(this IServiceCollection services)
    {
        services.AddSingleton<ArtistsViewModel>()
            .AddTransient<SongDetailsViewModel>()
            .AddTransient<AddArtistViewModel>()
            .AddTransient<AddSongViewModel>()
            .AddTransient<MoveSongViewModel>()
            .AddTransient<EditSongViewModel>()
            .AddTransient<EditArtistViewModel>();
        return services;
    }
}