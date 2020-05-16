namespace YunXun.WebApi.Unit
{
    /// <summary>
    /// Defines the <see cref="JsonErrorResponse" />.
    /// </summary>
    public class JsonErrorResponse
    {
        /// <summary>
        /// Gets or sets the Message
        /// 生产环境的消息.
        /// </summary>
        public string Message { get; set; }

        /// <summary>
        /// Gets or sets the DevelopmentMessage
        /// 开发环境的消息.
        /// </summary>
        public string DevelopmentMessage { get; set; }
    }
}
