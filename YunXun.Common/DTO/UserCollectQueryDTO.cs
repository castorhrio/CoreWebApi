namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="UserCollectQueryDTO" />.
    /// </summary>
    public class UserCollectQueryDTO : QueryDTO
    {
        /// <summary>
        /// Gets or sets the userId
        /// 用户ID.
        /// </summary>
        public int userId { get; set; }

        /// <summary>
        /// Gets or sets the objId
        /// 收藏对象ID 必传.
        /// </summary>
        public int objId { get; set; }

        /// <summary>
        /// Defines the Type.
        /// </summary>
        private int Type;

        /// <summary>
        /// Gets or sets the type
        /// 收藏类型 0：穴位，1食物，2疾病.
        /// </summary>
        public int type
        {
            //get; set;
            get
            {
                if (Type < 0)
                {
                    return 0;
                }
                else
                    return Type;
            }
            set
            {
                Type = value;
            }
        }
    }
}
