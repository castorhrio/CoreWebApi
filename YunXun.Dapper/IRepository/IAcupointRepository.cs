namespace YunXun.Dapper.IRepository
{
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="IAcupointRepository" />.
    /// </summary>
    public interface IAcupointRepository : IRepositoryBase<AcupointEntity, int>
    {
        /// <summary>
        /// The Detail.
        /// </summary>
        /// <param name="Id">The Id<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{AcupointEntity}}"/>.</returns>
        Task<BaseResult<AcupointEntity>> Detail(int Id);

        /// <summary>
        /// The GetListByPage.
        /// </summary>
        /// <param name="pageIndex">The pageIndex<see cref="int"/>.</param>
        /// <param name="pageSize">The pageSize<see cref="int"/>.</param>
        /// <param name="SortRule">The SortRule<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{AcupointEntity}}"/>.</returns>
        Task<BaseResult<AcupointEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);

        /// <summary>
        /// The Add.
        /// </summary>
        /// <param name="entity">The entity<see cref="AcupointEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{AcupointEntity}}"/>.</returns>
        Task<BaseResult<AcupointEntity>> Add(AcupointEntity entity);

        /// <summary>
        /// The Update.
        /// </summary>
        /// <param name="entity">The entity<see cref="AcupointEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{AcupointEntity}}"/>.</returns>
        Task<BaseResult<AcupointEntity>> Update(AcupointEntity entity);

        /// <summary>
        /// The Delete.
        /// </summary>
        /// <param name="entity">The entity<see cref="AcupointEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{AcupointEntity}}"/>.</returns>
        Task<BaseResult<AcupointEntity>> Delete(AcupointEntity entity);

        /// <summary>
        /// The GetList.
        /// </summary>
        /// <param name="models">The models<see cref="QueryDTO"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{AcupointEntity}}"/>.</returns>
        Task<BaseResult<AcupointEntity>> GetList(QueryDTO models);
    }
}
