namespace YunXun.Dapper.DataFactory
{
    /// <summary>
    /// Defines the <see cref="DbOption" />.
    /// </summary>
    public class DbOption
    {
        /// <summary>
        /// Gets or sets the ConnectionString
        /// 数据库连接字符串.
        /// </summary>
        public string ConnectionString { get; set; }

        /// <summary>
        /// Gets or sets the DbType
        /// 数据库类型.
        /// </summary>
        public string DbType { get; set; }
    }
}
