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
using AutoMapper;

namespace YunXun.Dapper.Repository
{
    public class FoodRepository : RepositoryBase<FoodEntity, int>, IFoodRepository
    {
        public FoodRepository(IOptionsSnapshot<DbOption> options)
        {
            dbOption = options.Get("DBConnect");
            if (dbOption == null)
            {
                throw new ArgumentNullException(nameof(DbOption));
            }
            dbConnection = ConnectionFactory.CreateConnection(dbOption.DbType, dbOption.ConnectionString);
        }
        /// <summary>
        /// 获取详细信息
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        public async Task<BaseResult<FoodEntity>> Detail(int Id)
        {
            string detailSql = @"SELECT * FROM dbo.tbFood WHERE id=@id";
            var result = new BaseResult<FoodEntity>();
            try
            {
                var entity = await Detail(Id, detailSql);
                if (null != entity)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<FoodEntity> { list = new List<FoodEntity>() { entity }, total = 1 };
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
        /// 获取总记录数
        /// </summary>
        /// <param name="sqlStr">查询语句</param>
        /// <returns>返回记录总数</returns>
        public async Task<BaseResult<FoodEntity>> GetCount()
        {
            string countSql = @"SELECT count(id) FROM dbo.tbFood where IsDelete=0";
            var result = new BaseResult<FoodEntity>();
            try
            {
                var entity = await GetCount(countSql);
                if (entity > -1)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<FoodEntity> { list = { }, total = 1 };
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
        ///   获取分页数据
        /// </summary>
        /// <param name="pageIndex">页码</param>
        /// <param name="pageSize">页数</param>
        /// <returns></returns>
        public async Task<BaseResult<FoodEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule = 1)
        {
            string tableName = "tbFood";
            string where = " IsDelete=0";
            string orderby = "id ";
            if (SortRule == 1)
            {
                orderby += " desc";
            }
            else
            {
                orderby += " asc";
            }
            pageSize = pageSize < 1 ? 10 : pageSize;
            int skip = 1;
            if (pageIndex > 0)
            {
                skip = (pageIndex - 1) * pageSize + 1;
            }
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT COUNT(1) FROM {0} where {1};", tableName, where);
            sb.AppendFormat(@"SELECT  *
                                FROM(SELECT ROW_NUMBER() OVER(ORDER BY {2}) AS RowNum,*
                                          FROM  {0}
                                          WHERE {1}
                                        ) AS result
                                WHERE  RowNum >= {3}   AND RowNum <= {4}
                                ORDER BY {2}", tableName, where, orderby, skip, pageIndex * pageSize);
            var result = new BaseResult<FoodEntity>();
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
        /// 分页  新版
        /// </summary>
        /// <param name="models"></param>
        /// <returns></returns>
        public async Task<BaseResult<FoodEntity>> GetList(QueryDTO models)
        {
            string tableName = "tbFood";
            string where = " IsDelete=0";
            string orderby = "id ";
            if (models.sortRule == 1)
            {
                orderby += " DESC";
            }
            else
            {
                orderby += " ASC";
            }
            int skip = (models.pageIndex - 1) * models.pageSize + 1;
            if (models.name != null)
            {
                where = where + "AND name LIKE '%" + models.name + "%'";
            }
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT COUNT(1) FROM {0} WHERE {1};", tableName, where);
            sb.AppendFormat(@"SELECT  *
                                FROM(SELECT ROW_NUMBER() OVER(ORDER BY {2}) AS RowNum,*
                                          FROM  {0}
                                          WHERE {1}
                                        ) AS result
                                WHERE  RowNum >= {3}   AND RowNum <= {4}
                                ORDER BY {2}", tableName, where, orderby, skip, models.pageIndex * models.pageSize);
            var result = new BaseResult<FoodEntity>();
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
        /// 新增
        /// </summary>
        /// <param name="entity">数据实体</param>
        /// <returns>返回主键值</returns>
        public async Task<BaseResult<FoodEntity>> Add(FoodEntity entity)
        {
            string insertSql = @"INSERT INTO dbo.tbFood(name, image,material,method,act) VALUES(@name, @image,@material,@method,@act) select @@identity";
            var result = new BaseResult<FoodEntity>();
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
        /// 修改
        /// </summary>
        /// <param name="entity"></param>
        /// <returns></returns>
        public async Task<BaseResult<FoodEntity>> Update(FoodEntity entity)
        {
            StringBuilder sb = new StringBuilder();
            string detailSql = @"SELECT * FROM dbo.tbFood WHERE id=@id";
            var i = await Detail(entity.id, detailSql);
            if (i == null)
            {
                throw new Exception("数据不存在");
            }
            sb.AppendFormat(@"UPDATE dbo.tbFood SET name = '{0}', material ='{1}', method = '{2}', act ='{3}',image='{4}' WHERE id={5} ", entity.name, entity.material, entity.method, entity.act, entity.image, entity.id);
            var result = new BaseResult<FoodEntity>();
            try
            {
                await Update(entity, sb.ToString());
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
        /// 删除
        /// </summary>
        /// <param name="entity">数据实体</param>
        /// <returns>返回主键值</returns>
        public async Task<BaseResult<FoodEntity>> Delete(FoodEntity entity)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"UPDATE dbo.tbFood SET IsDelete = 1 WHERE id = {0}", entity.id);
            //sb.AppendFormat(@"DELETE FROM dbo.tbFood WHERE id = {0}", entity.id);
            var result = new BaseResult<FoodEntity>();
            try
            {
                var i = await Delete(entity.id, sb.ToString());
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
    }
}
