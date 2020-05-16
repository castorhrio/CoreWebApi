namespace YunXun.Dapper.IRepository
{
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="ISickRepository" />.
    /// </summary>
    public interface ISickRepository : IRepositoryBase<SickEntity, int>
    {
        /// <summary>
        /// The Detail.
        /// </summary>
        /// <param name="Id">The Id<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        Task<BaseResult<SickEntity>> Detail(int Id);

        /// <summary>
        /// The GetListByPage.
        /// </summary>
        /// <param name="pageIndex">The pageIndex<see cref="int"/>.</param>
        /// <param name="pageSize">The pageSize<see cref="int"/>.</param>
        /// <param name="SortRule">The SortRule<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        Task<BaseResult<SickEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);

        /// <summary>
        /// The GetList.
        /// </summary>
        /// <param name="models">The models<see cref="SickQueryDTO"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        Task<BaseResult<SickEntity>> GetList(SickQueryDTO models);

        /// <summary>
        /// The Add.
        /// </summary>
        /// <param name="entity">The entity<see cref="SickEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        Task<BaseResult<SickEntity>> Add(SickEntity entity);

        /// <summary>
        /// The Updata.
        /// </summary>
        /// <param name="entity">The entity<see cref="SickEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        Task<BaseResult<SickEntity>> Updata(SickEntity entity);

        /// <summary>
        /// The Delete.
        /// </summary>
        /// <param name="entity">The entity<see cref="SickEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        Task<BaseResult<SickEntity>> Delete(SickEntity entity);
    }
}
