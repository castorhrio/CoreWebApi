using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
    public class IsCollectDTO
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int userId { get; set; }
        /// <summary>
        /// 收藏对象ID
        /// </summary>
        public int objId { get; set; }
        private int Type;
        /// <summary>
        /// 收藏类型 0：穴位，1食物，2疾病
        /// </summary>
        public int type {

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
        /// 判断用户是否被收藏
        /// </summary>
        public bool isCollect { get; set; }
    }
}
