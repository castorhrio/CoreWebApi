using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
    public class UserCollectQueryDTO:QueryDTO
    {
        /// <summary>
        /// 用户ID
        /// </summary>
        public int userId { get; set; }

        /// <summary>
        /// 收藏对象ID 必传
        /// </summary>
        public int objId { get; set; }

        private int Type;
        /// <summary>
        /// 收藏类型 0：穴位，1食物，2疾病
        /// </summary>
        public int type
        {
            //get; set;
            get
            {
                if (Type < 0 )
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
