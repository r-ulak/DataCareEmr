using System.Collections.Generic;

namespace EMR.DTO.Common
{
    public class PermissionsTreeViewDto
    {
        public string Text { get; set; }
        public string Data { get; set; }
        public long Id { get; set; }
        public List<PermissionsTreeViewDto> Children { get; set; }
        public TreeState State { get; set; }
        public static PermissionsTreeViewDto Find(PermissionsTreeViewDto node, string name)
        {
            if (node == null)
                return null;

            if (node.Text == name)
                return node;

            foreach (var child in node.Children)
            {
                var found = Find(child, name);
                if (found != null)
                    return found;
            }
            return null;
        }
    }
    public class TreeState
    {
        public bool Opened { get; set; }
        public bool Disabled { get; set; }
        public bool Selected { get; set; }
    }
}
