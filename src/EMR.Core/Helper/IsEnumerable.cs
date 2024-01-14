using System;
using System.Collections.Generic;
using System.Linq;

namespace EMR.Helper
{
    public static class IsEnumerable
    {
        public static bool IsEnumerableType(Type type)
        {
            return type.GetInterfaces().Any(myType => myType.IsGenericType && myType.GetGenericTypeDefinition() == typeof(IEnumerable<>));
        }
    }
}
