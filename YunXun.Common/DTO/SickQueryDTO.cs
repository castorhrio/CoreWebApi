namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="SickQueryDTO" />.
    /// </summary>
    public class SickQueryDTO
    {
        /// <summary>
        /// Defines the PageIndex.
        /// </summary>
        private int PageIndex;

        /// <summary>
        /// Gets or sets the pageIndex
        /// 第几页.
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

        /// <summary>
        /// Defines the PageSize.
        /// </summary>
        private int PageSize;

        /// <summary>
        /// Gets or sets the pageSize
        /// 一页多少条数据.
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

        /// <summary>
        /// Defines the SortRule.
        /// </summary>
        private int SortRule;

        /// <summary>
        /// Gets or sets the sortRule
        /// 排序.
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
        /// Gets or sets the title
        /// 名称.
        /// </summary>
        public string title { get; set; }
    }
}
