namespace YunXun.Dapper.IRepository
{
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="IUserCollectRepository" />.
    /// </summary>
    public interface IUserCollectRepository : IRepositoryBase<UserCollectEntity, int>
    {
        /// <summary>
        /// 收藏.
        /// </summary>
        /// <param name="entity">.</param>
        /// <returns>.</returns>
        Task<BaseResult<UserCollectEntity>> Add(UserCollectEntity entity);

        /// <summary>
        /// 取消收藏.
        /// </summary>
        /// <param name="entity">.</param>
        /// <returns>.</returns>
        Task<BaseResult<UserCollectEntity>> Delete(UserCollectEntity entity);

        /// <summary>
        /// 获取收藏列表.
        /// </summary>
        /// <param name="modal">The modal<see cref="UserCollectQueryDTO"/>.</param>
        /// <returns>.</returns>
        Task<BaseResult<UserCollectEntity>> GetCollectList(UserCollectQueryDTO modal);

        /// <summary>
        /// 判断是否收藏对象.
        /// </summary>
        /// <param name="query">.</param>
        /// <returns>.</returns>
        Task<BaseResult<IsCollectDTO>> IsCollect(IsCollectDTO query);
    }
}
