namespace YunXun.Dapper.IRepository
{
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="IFoodRepository" />.
    /// </summary>
    public interface IFoodRepository : IRepositoryBase<FoodEntity, int>
    {
        /// <summary>
        /// The Detail.
        /// </summary>
        /// <param name="Id">The Id<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{FoodEntity}}"/>.</returns>
        Task<BaseResult<FoodEntity>> Detail(int Id);

        /// <summary>
        /// The GetListByPage.
        /// </summary>
        /// <param name="pageIndex">The pageIndex<see cref="int"/>.</param>
        /// <param name="pageSize">The pageSize<see cref="int"/>.</param>
        /// <param name="SortRule">The SortRule<see cref="int"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{FoodEntity}}"/>.</returns>
        Task<BaseResult<FoodEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);

        /// <summary>
        /// The Add.
        /// </summary>
        /// <param name="entity">The entity<see cref="FoodEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{FoodEntity}}"/>.</returns>
        Task<BaseResult<FoodEntity>> Add(FoodEntity entity);

        /// <summary>
        /// The Update.
        /// </summary>
        /// <param name="entity">The entity<see cref="FoodEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{FoodEntity}}"/>.</returns>
        Task<BaseResult<FoodEntity>> Update(FoodEntity entity);

        /// <summary>
        /// The Delete.
        /// </summary>
        /// <param name="entity">The entity<see cref="FoodEntity"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{FoodEntity}}"/>.</returns>
        Task<BaseResult<FoodEntity>> Delete(FoodEntity entity);

        /// <summary>
        /// The GetList.
        /// </summary>
        /// <param name="models">The models<see cref="QueryDTO"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{FoodEntity}}"/>.</returns>
        Task<BaseResult<FoodEntity>> GetList(QueryDTO models);
    }
}
