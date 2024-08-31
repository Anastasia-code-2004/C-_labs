using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NikolaychikLAB1.Entities;
using System.Net.Http.Json;
using System.Diagnostics;

using System.Text.Json;

namespace NikolaychikLAB1.Services
{
    class RateService(HttpClient httpClient) : IRateService
    {
        private readonly HttpClient _httpClient = httpClient;

        public async Task<IEnumerable<Rate>?> GetRates(DateTime date)
        {
            string newURI = $"{_httpClient.BaseAddress}?ondate={date:yyyy-MM-dd}&periodicity=0";
            
            return await _httpClient.GetFromJsonAsync<List<Rate>>(newURI);
        }
    }
}
