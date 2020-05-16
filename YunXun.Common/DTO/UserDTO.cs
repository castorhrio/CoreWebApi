namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="UserDTO" />.
    /// </summary>
    public class UserDTO
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
        /// Gets or sets the oldPassWord
        /// 旧密码.
        /// </summary>
        public string oldPassWord { get; set; }

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
        /// Defines the IsManager.
        /// </summary>
        private int IsManager;

        /// <summary>
        /// Gets or sets the isManager
        /// 是否管理员1是0不是.
        /// </summary>
        public int isManager
        {
            get
            {
                if (IsManager != 0)
                {
                    return 1;
                }
                else
                    return 0;
            }
            set
            {
                IsManager = value;
            }
        }

        /// <summary>
        /// Gets or sets the editManager
        /// 管理员.
        /// </summary>
        public string editManager { get; set; }

        /// <summary>
        /// Gets or sets the newPassword
        /// 新密码.
        /// </summary>
        public string newPassword { get; set; }

        /// <summary>
        /// Gets or sets the comfirPassword
        /// 确认密码.
        /// </summary>
        public string comfirPassword { get; set; }
    }
}
