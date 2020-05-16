using System;
using System.Collections.Generic;
using System.Text;

namespace YunXun.Common.DTO
{
    public class QueryDTO
    {
        private int PageIndex;

        /// <summary>
        /// 第几页
        /// </summary>
        public int pageIndex
        {
            //get; set;
            get
            {
                if (PageIndex <= 0)
                {
                    return 1;
                }
                else
                    return PageIndex;
            }
            set
            {
                PageIndex = value;
            }
        }
        private int PageSize;
        /// <summary>
        /// 一页多少条数据
        /// </summary>
        public int pageSize
        {
            //get; set;
            get
            {
                if (PageSize <= 0)
                {
                    return 10000;
                }
                else
                    return PageSize;
            }
            set
            {
                PageSize = value;
            }
        }
        private int SortRule;

        /// <summary>
        /// 排序
        /// </summary>
        public int sortRule
        {
            //get; set;
            get
            {
                if (SortRule == 0)
                {
                    return 0;
                }
                else return 1;
            }
            set { SortRule = value; }
        }
        /// <summary>
        /// 名称
        /// </summary>
        public string name { get; set; }
    }
}
