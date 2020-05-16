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
    public class AcupointRepository : RepositoryBase<AcupointEntity, int>, IAcupointRepository
    {
        public AcupointRepository(IOptionsSnapshot<DbOption> options)
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
        public async Task<BaseResult<AcupointEntity>> Detail(int Id)
        {
            string detailSql = @"SELECT * FROM dbo.tbAcupoint WHERE id=@id";
            var result = new BaseResult<AcupointEntity>();
            try
            {
                var entity = await Detail(Id, detailSql);
                if (null != entity)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<AcupointEntity> { list = new List<AcupointEntity>() { entity }, total = 1 };
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
        public async Task<BaseResult<AcupointEntity>> GetCount()
        {
            string countSql = @"SELECT count(id) FROM dbo.tbAcupoint where IsDelete=0";
            var result = new BaseResult<AcupointEntity>();
            try
            {
                var entity = await GetCount(countSql);
                if (entity > -1)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<AcupointEntity> { list = { }, total = 1 };
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
        public async Task<BaseResult<AcupointEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule = 1)
        {
            string tableName = "tbAcupoint";
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
            var result = new BaseResult<AcupointEntity>();
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

        public async Task<BaseResult<AcupointEntity>> GetList(QueryDTO models)
        {
            string tableName = "tbAcupoint";
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
            if (models.name != null)
            {
                where = where + "AND name LIKE '%" + models.name + "%'";
            }
            int skip = (models.pageIndex - 1) * models.pageSize + 1;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT COUNT(1) FROM {0} WHERE {1};", tableName, where);
            sb.AppendFormat(@"SELECT  *
                                FROM(SELECT ROW_NUMBER() OVER(ORDER BY {2}) AS RowNum,*
                                          FROM  {0}
                                          WHERE {1}
                                        ) AS result
                                WHERE  RowNum >= {3}   AND RowNum <= {4}
                                ORDER BY {2}", tableName, where, orderby, skip, models.pageIndex * models.pageSize);
            var result = new BaseResult<AcupointEntity>();
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
        public async Task<BaseResult<AcupointEntity>> Add(AcupointEntity entity)
        {
            
            string insertSql = @"INSERT INTO dbo.tbAcupoint(name, findout,overview,info,handle,image) VALUES(@name, @findout,@overview,@info,@handle,@image) select @@identity";
            var result = new BaseResult<AcupointEntity>();
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
        public async Task<BaseResult<AcupointEntity>> Update(AcupointEntity entity)
        {

            StringBuilder sb = new StringBuilder();
            string detailSql = @"SELECT * FROM dbo.tbAcupoint WHERE id=@id";
            var i = await Detail(entity.id, detailSql);
            if (i == null)
            {
                throw new Exception("数据不存在");
            }
            sb.AppendFormat(@"UPDATE dbo.tbAcupoint SET name = '{0}', findout ='{1}', overview = '{2}', info ='{3}',handle='{4}',image='{5}' WHERE id={6} ", entity.name, entity.findout, entity.overview, entity.info, entity.handle, entity.image, entity.id);
            var result = new BaseResult<AcupointEntity>();
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
        public async Task<BaseResult<AcupointEntity>> Delete(AcupointEntity entity)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"UPDATE dbo.tbAcupoint SET IsDelete = 1 WHERE id = {0}", entity.id);
            //sb.AppendFormat(@"DELETE FROM dbo.tbAcupoint WHERE id = {0}", entity.id);
            var result = new BaseResult<AcupointEntity>();
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
