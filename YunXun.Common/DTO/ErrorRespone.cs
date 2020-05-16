namespace YunXun.Common.DTO
{
    /// <summary>
    /// Defines the <see cref="ErrorRespone" />.
    /// </summary>
    public class ErrorRespone
    {
        /// <summary>
        /// Gets or sets the code
        /// 返回码.
        /// </summary>
        public string code { get; set; }

        /// <summary>
        /// Gets or sets the desc
        /// 返回值描述.
        /// </summary>
        public string desc { get; set; }

        /// <summary>
        /// Gets or sets the DevelopmentMessage
        /// 堆栈信息(调试使用).
        /// </summary>
        public string DevelopmentMessage { get; set; }
    }
}
