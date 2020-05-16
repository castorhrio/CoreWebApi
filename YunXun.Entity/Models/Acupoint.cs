using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Entity.Models
{
    /// <summary>
    /// 穴位
    /// </summary>
    public class AcupointEntity : BaseEntity<int>
    {
        /// <summary>
        /// 名称
        /// </summary>
        public string name { get; set; }
        /// <summary>
        /// 取穴
        /// </summary>
        public string findout { get; set; }
        /// <summary>
        /// 概述
        /// </summary>
        public string overview { get; set; }
        /// <summary>
        /// 信息
        /// </summary>
        public string info { get; set; }
        /// <summary>
        /// 操作
        /// </summary>
        public string handle { get; set; }
        /// <summary>
        /// 删除标记  0未删除 1 删除
        /// </summary>
        public int IsDelete { get; set; }
        /// <summary>
        /// 图片
        /// </summary>
        public string image { get; set; }
        /// <summary>
        /// url链接
        /// </summary>
        public string imageUrl
        {
            get
            {
                return image == null ? null : UrlFile.UserUrl + image;
            }
            set { }
        }
    }
}
