using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using YunXun.Dapper.IRepository;
using YunXun.Entity.Models;
using YunXun.Entity.ViewModels;
using YunXun.Common.DTO;

namespace YunXun.WebApi.Controllers
{
    /// <summary>
    /// 产后疾病
    /// </summary>
    //[]
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class SickController : ControllerBase
    {
        private readonly ISickRepository sickRepository;
        public SickController(ISickRepository _sickRepository)
        {
            sickRepository = _sickRepository;
        }

        /// <summary>
        /// 获取产后疾病列表 旧版
        /// </summary>
        /// <param name="pageIndex">下标</param>
        /// <param name="pageSize">每页大小</param>
        /// <param name="SortRule">排序方式 1 desc 0 asc</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<BaseResult<SickEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule)
        {
            var list = await sickRepository.GetListByPage(pageIndex, pageSize, SortRule);
            return list;
        }
        /// <summary>
        /// 获取产后疾病列表  新版
        /// </summary>
        /// <param name="models"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<BaseResult<SickEntity>> GetList(SickQueryDTO models)
        {
            var list = await sickRepository.GetList(models);
            return list;
        }

        /// <summary>
        /// 获取疾病详细信息
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<SickEntity>> GetDetail(int id)
        {
            return await sickRepository.Detail(id);
        }
        /// <summary>
        /// 增加
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<SickEntity>> Add(SickEntity entity)
        {
            return await sickRepository.Add(entity);
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<SickEntity>> Updata(SickEntity entity)
        {
            var number = await sickRepository.Detail(entity.id);
            var result = new BaseResult<SickEntity>();
            if (number.code != "0")
            {
                throw new Exception("数据不存在");
            }
            return await sickRepository.Updata(entity);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<SickEntity>> Delete(SickEntity entity)
        {
            var number = await sickRepository.Detail(entity.id);
            var result = new BaseResult<SickEntity>();
            if (number.code != "0")
            {
                throw new Exception("数据不存在");
            }
            return await sickRepository.Delete(entity);
        }

        /// <summary>
        /// 批量删除
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<BaseResult<SickEntity>> DeleteList([FromBody]DeleteDTO model)
        {
            if (model.ids.Count == 0)
            {
                throw new Exception("参数接受失败");
            }
            var idList = model.ids;
            foreach (int item in idList)
            {
                var number = await sickRepository.Detail(item);
                if (number.code != "0")
                {
                    throw new Exception("数据不存在");
                }
                SickEntity entity = new SickEntity()
                {
                    id = item
                };
                try
                {
                    await sickRepository.Delete(entity);
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
            var result = new BaseResult<SickEntity>()
            {
                code = "0",
                data = null,
                desc = "删除成功",
            };
            return result;
        }
    }
}