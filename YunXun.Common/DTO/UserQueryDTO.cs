using System;
using System.Collections.Generic;
using System.Text;
using YunXun.Common.DTO;

namespace YunXun.Common.DTO
{
    public class UserQueryDTO : QueryDTO
    {
        /// <summary>
        /// 用户名 
        /// </summary>
        public string userName { get; set; }
    }
}
