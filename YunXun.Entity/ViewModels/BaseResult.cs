namespace YunXun.Entity.ViewModels
{
    /// <summary>
    /// Defines the <see cref="BaseResult{T}" />.
    /// </summary>
    /// <typeparam name="T">.</typeparam>
    public class BaseResult<T>
    {
        /// <summary>
        /// Gets or sets the code
        /// 返回码.
        /// </summary>
        public string code { get; set; }

        /// <summary>
        /// Gets or sets the data
        /// 返回的主要数据实体.
        /// </summary>
        public PageData<T> data { get; set; }

        /// <summary>
        /// Gets or sets the desc
        /// 返回值描述.
        /// </summary>
        public string desc { get; set; }
    }
}
