using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using YunXun.Common;
using YunXun.Dapper.DataFactory;
using YunXun.Dapper.IRepository;
using YunXun.Entity.Models;
using YunXun.Entity.ViewModels;
using YunXun.Common.DTO;
namespace YunXun.Dapper.Repository
{
    public class UserCollectRepository : RepositoryBase<UserCollectEntity, int>, IUserCollectRepository
    {
        public UserCollectRepository(IOptionsSnapshot<DbOption> options)
        {
            dbOption = options.Get("DBConnect");
            if (dbOption == null)
            {
                throw new ArgumentNullException(nameof(DbOption));
            }
            dbConnection = ConnectionFactory.CreateConnection(dbOption.DbType, dbOption.ConnectionString);
        }
        /// <summary>
        /// 新增收藏记录
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<BaseResult<UserCollectEntity>> Add(UserCollectEntity entity)
        {
            string insertSql = @"INSERT INTO dbo.tbUserCollect(userId, objId,type,name,createDate) VALUES(@userId, @objId,@type,@name,getdate()) select @@identity";
            var result = new BaseResult<UserCollectEntity>();
            try
            {
                var i = await Add(entity, insertSql);
                if (null != i && i > 0)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.desc = ResultKey.RETURN_SUCCESS_DESC;
                }
                else
                {
                    result.code = ResultKey.RETURN_FAIL_CODE;
                    result.desc = ResultKey.RETURN_FAIL_DESC;
                }
            }
            catch (Exception ex)
            {
                NlogHelper.InfoLog(ex.Message);
                throw new Exception(ex.Message);
            }
            return result;
        }
        /// <summary>
        /// 删除收藏记录
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public async Task<BaseResult<UserCollectEntity>> Delete(UserCollectEntity entity)
        {
            
            string deleteSql = string.Format("delete tbUserCollect where userId={0} and objId={1} and type={2}", entity.userId, entity.objId, entity.type);
            var result = new BaseResult<UserCollectEntity>();
            try
            {
                int? i = await DeleteReal(deleteSql);
                result.code = ResultKey.RETURN_SUCCESS_CODE;
                result.desc = ResultKey.RETURN_SUCCESS_DESC;

            }
            catch (Exception ex)
            {
                NlogHelper.InfoLog(ex.Message);
                throw new Exception(ex.Message);
            }
            return result;
        }

        /// <summary>
        ///   获取分页数据
        /// </summary>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">页数</param>
        /// <returns></returns>
        public async Task<BaseResult<UserCollectEntity>> GetCollectList(UserCollectQueryDTO modal)
        {
            string tableName = "tbUserCollect";
            //string where = " IsDelete=0";
            string orderby = "id ";
            if (modal.sortRule == 1)
            {
                orderby += " desc";
            }
            else
            {
                orderby += " asc";
            }
            int skip = (modal.pageIndex - 1) * modal.pageSize + 1;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"SELECT COUNT(1) FROM {0} where 1=1 AND type={1} AND userId={2};", tableName, modal.type, modal.userId);
            sb.AppendFormat(@"SELECT  *
                                FROM(SELECT ROW_NUMBER() OVER(ORDER BY {1}) AS RowNum,*
                                          FROM  {0}
                                          WHERE 1=1
                                        ) AS result
                                WHERE  RowNum >= {2}   AND RowNum <= {3} AND  type={4} AND userId={5}
                                ORDER BY {1}", tableName, orderby, skip, modal.pageIndex * modal.pageSize, modal.type, modal.userId);
            var result = new BaseResult<UserCollectEntity>();
            try
            {
                var pageData = await GetPageList(sb.ToString());
                if (pageData.total > -1)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = pageData;
                    result.desc = ResultKey.RETURN_SUCCESS_DESC;
                }
                else
                {
                    result.code = ResultKey.RETURN_FAIL_CODE;
                    result.desc = ResultKey.RETURN_FAIL_DESC;
                }
            }
            catch (Exception ex)
            {
                NlogHelper.InfoLog(ex.Message);
                throw new Exception(ex.Message);
            }

            return result;
        }

        /// <summary>
        /// 判断用户是否收藏
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public async Task<BaseResult<IsCollectDTO>> IsCollect(IsCollectDTO query)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"SELECT * FROM dbo.tbUserCollect WHERE userId = {0} AND objId = {1} AND type={2}", query.userId, query.objId, query.type);
            var result = new BaseResult<IsCollectDTO>();
            try
            {
                var i = await DetailBy(sb.ToString());
                if (i != null)
                {
                    query.isCollect = true;
                }
                else
                {
                    query.isCollect = false;
                }
                result.code = ResultKey.RETURN_SUCCESS_CODE;
                result.data = new PageData<IsCollectDTO> { list = new List<IsCollectDTO>() { query }, total = 1 };
                result.desc = ResultKey.RETURN_SUCCESS_DESC;
            }
            catch (Exception ex)
            {
                NlogHelper.InfoLog(ex.Message);
                throw new Exception(ex.Message);
            }
            return result;
        }
    }
}
