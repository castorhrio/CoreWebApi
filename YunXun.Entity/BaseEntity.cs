namespace YunXun.Entity
{
    /// <summary>
    /// Defines the <see cref="BaseEntity{Tkey}" />.
    /// </summary>
    /// <typeparam name="Tkey">.</typeparam>
    public class BaseEntity<Tkey> : IEntity<Tkey>
    {
        /// <summary>
        /// Gets or sets the id.
        /// </summary>
        public Tkey id { get; set; }
    }
}
