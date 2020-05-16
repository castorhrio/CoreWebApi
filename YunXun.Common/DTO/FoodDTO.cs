using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
   public class FoodDTO
    {
        /// <summary>
        /// 
        /// </summary>
        public string Image
        {
            get
            {
                return image == null ? null : "https://www.chjb.com" + image;
            }
        }
        /// <summary>
        /// 名称
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// 食物图
        /// </summary>
        public string image { get; set; }

        /// <summary>
        /// 原料
        /// </summary>
        public string material { get; set; }
        /// <summary>
        /// 制法
        /// </summary>
        public string method { get; set; }
        /// <summary>
        /// 功效
        /// </summary>
        public string act { get; set; }
        /// <summary>
        ///  删除标记  0未删除 1 删除
        /// </summary>
        public int IsDelete { get; set; }
    }
}
