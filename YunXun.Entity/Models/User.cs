using System;
using System.Collections.Generic;
using System.Text;


namespace YunXun.Entity.Models
{
    public class UserEntity : BaseEntity<int>
    {
        public int userId { get; set; }
        /// <summary>
        /// 用户名 必传
        /// </summary>
        public string userName { get; set; }
        /// <summary>
        /// 密码 必传
        /// </summary>
        public string passWord { get; set; }
        /// <summary>
        /// 年龄
        /// </summary>
        public int age { get; set; }
        /// <summary>
        /// 是否删除
        /// </summary>
        public int isDelete { get; set; }
        /// <summary>
        /// 是否管理员1是0不是
        /// </summary>
        public int isManager { get; set; }
    }
}
