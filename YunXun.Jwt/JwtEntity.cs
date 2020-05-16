namespace YunXun.Jwt
{
    using System.Collections.Generic;

    /// <summary>
    /// Defines the <see cref="JwtEntity" />.
    /// </summary>
    public class JwtEntity
    {
        /// <summary>
        /// Gets or sets the Issuer
        /// 发布者.
        /// </summary>
        public string Issuer { get; set; }

        /// <summary>
        /// Gets or sets the Audience
        /// 使用者.
        /// </summary>
        public string Audience { get; set; }

        /// <summary>
        /// Gets or sets the SecretKey
        /// 加密key.
        /// </summary>
        public string SecretKey { get; set; }

        /// <summary>
        /// Gets or sets the Lifetime
        /// 生命周期.
        /// </summary>
        public int Lifetime { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether ValidateLifetime
        /// 是否验证生命周期.
        /// </summary>
        public bool ValidateLifetime { get; set; }

        /// <summary>
        /// Gets or sets the HeadField
        /// 验证头字段.
        /// </summary>
        public string HeadField { get; set; }

        /// <summary>
        /// Gets or sets the Prefix
        /// jwt验证前缀.
        /// </summary>
        public string Prefix { get; set; }

        /// <summary>
        /// Gets or sets the IgnoreUrls
        /// 忽略验证的url.
        /// </summary>
        public List<string> IgnoreUrls { get; set; }
    }
}
