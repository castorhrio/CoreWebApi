namespace YunXun.Entity.Models
{
    /// <summary>
    /// Defines the <see cref="UserEntity" />.
    /// </summary>
    public class UserEntity : BaseEntity<int>
    {
        /// <summary>
        /// Gets or sets the userId.
        /// </summary>
        public int userId { get; set; }

        /// <summary>
        /// Gets or sets the userName
        /// 用户名 必传.
        /// </summary>
        public string userName { get; set; }

        /// <summary>
        /// Gets or sets the passWord
        /// 密码 必传.
        /// </summary>
        public string passWord { get; set; }

        /// <summary>
        /// Gets or sets the age
        /// 年龄.
        /// </summary>
        public int age { get; set; }

        /// <summary>
        /// Gets or sets the isDelete
        /// 是否删除.
        /// </summary>
        public int isDelete { get; set; }

        /// <summary>
        /// Gets or sets the isManager
        /// 是否管理员1是0不是.
        /// </summary>
        public int isManager { get; set; }
    }
}
