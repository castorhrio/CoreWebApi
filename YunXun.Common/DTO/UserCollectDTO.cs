using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
    public class UserCollectDTO
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int userId { get; set; }
        /// <summary>
        /// 收藏对象ID
        /// </summary>
        public int objId { get; set; }
        /// <summary>
        /// 收藏对象的名称
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// 收藏类型 0：穴位，1食物，2疾病
        /// </summary>
        public int type { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public int createDate { get; set; }
    }
}
