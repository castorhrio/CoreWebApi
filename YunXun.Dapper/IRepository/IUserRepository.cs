namespace YunXun.Dapper.IRepository
{
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="IUserRepository" />.
    /// </summary>
    public interface IUserRepository : IRepositoryBase<UserEntity, int>
    {
        /// <summary>
        /// The Add.
        /// </summary>
        /// <param name="entity">The entity<see cref="UserEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> Add(UserEntity entity);

        /// <summary>
        /// The Login.
        /// </summary>
        /// <param name="entity">The entity<see cref="UserEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> Login(UserEntity entity);

        /// <summary>
        /// The Delete.
        /// </summary>
        /// <param name="Id">The Id<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> Delete(int Id);

        /// <summary>
        /// The Update.
        /// </summary>
        /// <param name="modal">The modal<see cref="UserDTO"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> Update(UserDTO modal);

        /// <summary>
        /// The Detail.
        /// </summary>
        /// <param name="Id">The Id<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> Detail(int Id);

        /// <summary>
        /// The GetList.
        /// </summary>
        /// <param name="modal">The modal<see cref="UserQueryDTO"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> GetList(UserQueryDTO modal);

        /// <summary>
        /// The GetListByPage.
        /// </summary>
        /// <param name="pageIndex">The pageIndex<see cref="int"/>.</param>
        /// <param name="pageSize">The pageSize<see cref="int"/>.</param>
        /// <param name="SortRule">The SortRule<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{UserEntity}}"/>.</returns>
        Task<BaseResult<UserEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);
    }
}
