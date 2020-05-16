namespace YunXun.Entity.ViewModels
{
    using System.Collections.Generic;

    /// <summary>
    /// Defines the <see cref="PageData{T}" />.
    /// </summary>
    /// <typeparam name="T">.</typeparam>
    public partial class PageData<T>
    {
        /// <summary>
        /// Gets or sets the list
        /// 查询的分页数据.
        /// </summary>
        public IList<T> list { get; set; }

        /// <summary>
        /// Gets or sets the total
        /// 总页数.
        /// </summary>
        public int total { get; set; }
    }
}
