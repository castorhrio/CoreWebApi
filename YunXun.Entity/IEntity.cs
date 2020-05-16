namespace YunXun.Entity
{
    /// <summary>
    /// Defines the <see cref="IEntity{Tkey}" />.
    /// </summary>
    /// <typeparam name="Tkey">.</typeparam>
    public interface IEntity<Tkey>
    {
        /// <summary>
        /// Gets or sets the id.
        /// </summary>
        Tkey id { get; set; }
    }
}
