using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
    public class UserDTO
    {
        public int userId { get; set; }
        /// <summary>
        /// 用户名 必传
        /// </summary>
        public string userName { get; set; }
        /// <summary>
        /// 旧密码
        /// </summary>
        public string oldPassWord { get; set; }
        /// <summary>
        /// 年龄
        /// </summary>
        public int age { get; set; }
        /// <summary>
        /// 是否删除
        /// </summary>
        public int isDelete { get; set; }
        private int IsManager;
        /// <summary>
        /// 是否管理员1是0不是
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
        /// 管理员
        /// </summary>
        public string editManager { get; set; }
        /// <summary>
        /// 新密码
        /// </summary>
        public string newPassword { get; set; }
        /// <summary>
        /// 确认密码
        /// </summary>
        public string comfirPassword { get; set; }
    }
}
