namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="IsCollectDTO" />.
    /// </summary>
    public class IsCollectDTO
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
        /// Defines the Type.
        /// </summary>
        private int Type;

        /// <summary>
        /// Gets or sets the type
        /// 收藏类型 0：穴位，1食物，2疾病.
        /// </summary>
        public int type
        {

            get
            {
                if (Type < 0)
                {
                    return 3;
                }
                else
                {
                    return Type;
                }
            }
            set
            {
                Type = value;
            }
        }

        /// <summary>
        /// Gets or sets a value indicating whether isCollect
        /// 判断用户是否被收藏.
        /// </summary>
        public bool isCollect { get; set; }
    }
}
