using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using YunXun.Entity.Models;
using YunXun.Entity.ViewModels;
using YunXun.Common.DTO;
namespace YunXun.Dapper.IRepository
{
   public interface ISickRepository : IRepositoryBase<SickEntity, int>
    {
        #region 仓储
      
        Task<BaseResult<SickEntity>> Detail(int Id);
        Task<BaseResult<SickEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule);
        Task<BaseResult<SickEntity>> GetList(SickQueryDTO models);
        Task<BaseResult<SickEntity>> Add(SickEntity entity);
        Task<BaseResult<SickEntity>> Updata(SickEntity entity);
        Task<BaseResult<SickEntity>> Delete(SickEntity entity);
        #endregion
    }
}
