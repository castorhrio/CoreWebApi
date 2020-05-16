using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Entity.Models
{
    public class UserCollectEntity : BaseEntity<int>
    {
        /// <summary>
        /// 用户ID 必传
        /// </summary>
        public int userId { get; set; }
        /// <summary>
        /// 收藏对象ID 必传
        /// </summary>
        public int objId { get; set; }
        /// <summary>
        /// 收藏对象name 必传
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// 收藏类型 0：穴位，1食物，必传
        /// </summary>
        public int type { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime createDate { get; set; }
    }
}
