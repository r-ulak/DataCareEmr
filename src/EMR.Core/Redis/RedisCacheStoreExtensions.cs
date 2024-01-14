using System;
using System.Collections;
using System.Threading.Tasks;
using EMR.Helper;

namespace EMR.Redis
{
    public static class RedisCacheStoreExtensions
    {
        public static T Get<T>(this IRedisCacheStore source, string key, TimeSpan time, Func<T> fetch) where T : class
        {
            if (source.Exists(key))
            {
                return source.Get<T>(key);
            }
            else
            {
                var result = fetch();

                if (result != null)
                {
                    source.Set(key, result, time);
                }

                return result;
            }
        }

        public static async Task<T> GetAsync<T>(this IRedisCacheStore source, string key, TimeSpan time, Func<Task<T>> fetch) where T : class
        {

            var getResult = await source.GetAsync<T>(key);
            if (getResult == null) return await SetAsync<T>(source, key, time, fetch);
            if (!IsEnumerable.IsEnumerableType(getResult.GetType())) return getResult;
            var enumerable = getResult as ICollection;
            return enumerable != null && enumerable.Count > 0
                ? getResult
                : await SetAsync(source, key, time, fetch);

        }

        public static async Task<T> SetAsync<T>(this IRedisCacheStore source, string key, TimeSpan time,
            Func<Task<T>> fetch) where T : class
        {
            var result = await fetch();

            return await CheckResultAndSetCache<T>(source, key, time, result);
        }

        private static async Task<T> CheckResultAndSetCache<T>(IRedisCacheStore source, string key, TimeSpan time, T result) where T : class
        {
            if (result == null) return null;
            if (IsEnumerable.IsEnumerableType(result.GetType()))
            {
                var enumerable = result as ICollection;
                if (enumerable != null && enumerable.Count > 0)
                {
                    await source.SetAsync(key, result, time);
                }
            }
            else
            {
                await source.SetAsync(key, result, time);
            }

            return result;
        }
    }

}
