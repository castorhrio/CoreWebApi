namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="FoodDTO" />.
    /// </summary>
    public class FoodDTO
    {
        /// <summary>
        /// Gets the Image.
        /// </summary>
        public string Image
        {
            get
            {
                return image == null ? null : "https://www.chjb.com" + image;
            }
        }

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
