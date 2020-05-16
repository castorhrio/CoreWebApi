using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Entity.Models
{
    public class SickEntity : BaseEntity<int>
    {
        /// <summary>
        /// 产后疾病标题
        /// </summary>
        public string title { get; set; }
        /// <summary>
        /// 概述
        /// </summary>
        public string overview { get; set; }
        /// <summary>
        /// 穴位按摩
        /// </summary>
        public string acupoint { get; set; }
        /// <summary>
        /// 常见病因及症状
        /// </summary>
        public string pathogeny { get; set; }
        /// <summary>
        /// 病因分析与鉴别
        /// </summary>
        public string analysis { get; set; }
        /// <summary>
        /// 饮食调理
        /// </summary>
        public string food { get; set; }

        public int IsDelete { get; set; }
    }
}
