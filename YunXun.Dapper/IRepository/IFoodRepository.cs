using System.Threading.Tasks;
using YunXun.Entity.Models;
using YunXun.Entity.ViewModels;
using YunXun.Common.DTO;

namespace YunXun.Dapper.IRepository
{
    public interface IFoodRepository : IRepositoryBase<FoodEntity, int>
    {
        Task<BaseResult<FoodEntity>> Detail(int Id);
        Task<BaseResult<FoodEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);
        Task<BaseResult<FoodEntity>> Add(FoodEntity entity);
        Task<BaseResult<FoodEntity>> Update(FoodEntity entity);
        Task<BaseResult<FoodEntity>> Delete(FoodEntity entity);
        Task<BaseResult<FoodEntity>> GetList(QueryDTO models);
    }
}
