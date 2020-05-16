using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
    public class ErrorRespone
    {
        /// <summary>
        /// 返回码
        /// </summary>
        public string code { get; set; }
        /// <summary>
        /// 返回值描述
        /// </summary>

        public string desc { get; set; }

        /// <summary>
        /// 堆栈信息(调试使用)
        /// </summary>
        public string DevelopmentMessage { get; set; }
    }
}
