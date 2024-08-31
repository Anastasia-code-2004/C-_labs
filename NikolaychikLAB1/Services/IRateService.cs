using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;
using NikolaychikLAB1.Entities;

namespace NikolaychikLAB1.Services
{
    public interface IRateService
    {
        Task<IEnumerable<Rate>?> GetRates(DateTime date);
    }
}
