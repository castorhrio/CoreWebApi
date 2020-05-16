namespace YunXun.Entity.Models
{
    /// <summary>
    /// Defines the <see cref="FoodEntity" />.
    /// </summary>
    public class FoodEntity : BaseEntity<int>
    {
        /// <summary>
        /// Gets or sets the name
        /// 名称.
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// Gets or sets the image
        /// 食物图.
        /// </summary>
        public string image { get; set; }

        /// <summary>
        /// Gets the imageUrl.
        /// </summary>
        public string imageUrl
        {
            get
            {
                return image == null ? null : UrlFile.UserUrl + image;
            }
        }

        /// <summary>
        /// Gets or sets the material
        /// 原料.
        /// </summary>
        public string material { get; set; }

        /// <summary>
        /// Gets or sets the method
        /// 制法.
        /// </summary>
        public string method { get; set; }

        /// <summary>
        /// Gets or sets the act
        /// 功效.
        /// </summary>
        public string act { get; set; }

        /// <summary>
        /// Gets or sets the IsDelete
        /// 删除标记  0未删除 1 删除.
        /// </summary>
        public int IsDelete { get; set; }
    }
}
