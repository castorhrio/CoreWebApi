namespace YunXun.WebApi.Unit
{
    using System;

    /// <summary>
    /// Defines the <see cref="UserOperationException" />.
    /// </summary>
    public class UserOperationException : Exception
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="UserOperationException"/> class.
        /// </summary>
        public UserOperationException()
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="UserOperationException"/> class.
        /// </summary>
        /// <param name="message">The message<see cref="string"/>.</param>
        public UserOperationException(string message) : base(message)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="UserOperationException"/> class.
        /// </summary>
        /// <param name="message">The message<see cref="string"/>.</param>
        /// <param name="innerException">The innerException<see cref="Exception"/>.</param>
        public UserOperationException(string message, Exception innerException) : base(message, innerException)
        {
        }
    }
}
