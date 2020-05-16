namespace YunXun.Entity.Models
{
    using System;

    /// <summary>
    /// Defines the <see cref="UserCollectEntity" />.
    /// </summary>
    public class UserCollectEntity : BaseEntity<int>
    {
        /// <summary>
        /// Gets or sets the userId
        /// 用户ID 必传.
        /// </summary>
        public int userId { get; set; }

        /// <summary>
        /// Gets or sets the objId
        /// 收藏对象ID 必传.
        /// </summary>
        public int objId { get; set; }

        /// <summary>
        /// Gets or sets the name
        /// 收藏对象name 必传.
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// Gets or sets the type
        /// 收藏类型 0：穴位，1食物，必传.
        /// </summary>
        public int type { get; set; }

        /// <summary>
        /// Gets or sets the createDate
        /// 创建时间.
        /// </summary>
        public DateTime createDate { get; set; }
    }
}
