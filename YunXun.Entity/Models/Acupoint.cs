namespace YunXun.Entity.Models
{
    /// <summary>
    /// 穴位.
    /// </summary>
    public class AcupointEntity : BaseEntity<int>
    {
        /// <summary>
        /// Gets or sets the name
        /// 名称.
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// Gets or sets the findout
        /// 取穴.
        /// </summary>
        public string findout { get; set; }

        /// <summary>
        /// Gets or sets the overview
        /// 概述.
        /// </summary>
        public string overview { get; set; }

        /// <summary>
        /// Gets or sets the info
        /// 信息.
        /// </summary>
        public string info { get; set; }

        /// <summary>
        /// Gets or sets the handle
        /// 操作.
        /// </summary>
        public string handle { get; set; }

        /// <summary>
        /// Gets or sets the IsDelete
        /// 删除标记  0未删除 1 删除.
        /// </summary>
        public int IsDelete { get; set; }

        /// <summary>
        /// Gets or sets the image
        /// 图片.
        /// </summary>
        public string image { get; set; }

        /// <summary>
        /// Gets or sets the imageUrl
        /// url链接.
        /// </summary>
        public string imageUrl
        {
            get
            {
                return image == null ? null : UrlFile.UserUrl + image;
            }
            set { }
        }
    }
}
