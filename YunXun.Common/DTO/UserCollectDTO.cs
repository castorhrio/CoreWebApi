namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="UserCollectDTO" />.
    /// </summary>
    public class UserCollectDTO
    {
        /// <summary>
        /// Gets or sets the userId
        /// 用户ID.
        /// </summary>
        public int userId { get; set; }

        /// <summary>
        /// Gets or sets the objId
        /// 收藏对象ID.
        /// </summary>
        public int objId { get; set; }

        /// <summary>
        /// Gets or sets the name
        /// 收藏对象的名称.
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// Gets or sets the type
        /// 收藏类型 0：穴位，1食物，2疾病.
        /// </summary>
        public int type { get; set; }

        /// <summary>
        /// Gets or sets the createDate
        /// 创建时间.
        /// </summary>
        public int createDate { get; set; }
    }
}
