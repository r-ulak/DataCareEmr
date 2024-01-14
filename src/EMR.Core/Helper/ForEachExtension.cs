using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EMR.Helper
{
    public static class ForEachExtension
    {
        public static async Task ForEachAsync<T>(this IList<T> list, Func<T, Task> func)
        {
            foreach (var value in list)
            {
                await func(value);
            }
        }
    }
}
