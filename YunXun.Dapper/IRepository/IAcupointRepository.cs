using System.Threading.Tasks;
using YunXun.Entity.Models;
using YunXun.Entity.ViewModels;
using YunXun.Common.DTO;

namespace YunXun.Dapper.IRepository
{
    public interface IAcupointRepository : IRepositoryBase<AcupointEntity, int>
    {
        Task<BaseResult<AcupointEntity>> Detail(int Id);
        Task<BaseResult<AcupointEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);
        Task<BaseResult<AcupointEntity>> Add(AcupointEntity entity);
        Task<BaseResult<AcupointEntity>> Update(AcupointEntity entity);
        Task<BaseResult<AcupointEntity>> Delete(AcupointEntity entity);
        Task<BaseResult<AcupointEntity>> GetList(QueryDTO models);
    }
}
