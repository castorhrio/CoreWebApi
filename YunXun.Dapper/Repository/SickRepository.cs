namespace YunXun.Dapper.Repository
{
    using Microsoft.Extensions.Options;
    using System;
    using System.Collections.Generic;
    using System.Text;
    using System.Threading.Tasks;
    using YunXun.Common;
    using YunXun.Common.DTO;
    using YunXun.Dapper.DataFactory;
    using YunXun.Dapper.IRepository;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="SickRepository" />.
    /// </summary>
    public class SickRepository : RepositoryBase<SickEntity, int>, ISickRepository
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="SickRepository"/> class.
        /// </summary>
        /// <param name="options">The options<see cref="IOptionsSnapshot{DbOption}"/>.</param>
        public SickRepository(IOptionsSnapshot<DbOption> options)
        {
            dbOption = options.Get("DBConnect");
            if (dbOption == null)
            {
                throw new ArgumentNullException(nameof(DbOption));
            }
            dbConnection = ConnectionFactory.CreateConnection(dbOption.DbType, dbOption.ConnectionString);
        }

        /// <summary>
        /// 获取详细信息.
        /// </summary>
        /// <param name="Id">.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<SickEntity>> Detail(int Id)
        {
            string detailSql = @"SELECT * FROM dbo.tbSick WHERE id=@id";
            var result = new BaseResult<SickEntity>();
            try
            {
                var entity = await Detail(Id, detailSql);
                if (null != entity)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<SickEntity> { list = new List<SickEntity>() { entity }, total = 1 };
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
        /// 获取总记录数.
        /// </summary>
        /// <returns>返回记录总数.</returns>
        public async Task<BaseResult<SickEntity>> GetCount()
        {
            string countSql = @"SELECT count(id) FROM dbo.tbSick where IsDelete=0";
            var result = new BaseResult<SickEntity>();
            try
            {
                var entity = await GetCount(countSql);
                if (entity > -1)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<SickEntity> { list = { }, total = 1 };
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
        /// 获取分页数据  旧版.
        /// </summary>
        /// <param name="pageIndex">页码.</param>
        /// <param name="pageSize">页数.</param>
        /// <param name="SortRule">The SortRule<see cref="int"/>.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<SickEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule = 1)
        {
            string tableName = "tbSick";
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
            var result = new BaseResult<SickEntity>();
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
            catch (System.Exception)
            {
                result.code = ResultKey.RETURN_EXCEPTION_CODE;
                result.desc = ResultKey.RETURN_EXCEPTION_DESC;
            }

            return result;
        }

        /// <summary>
        /// The GetList.
        /// </summary>
        /// <param name="models">The models<see cref="SickQueryDTO"/>.</param>
        /// <returns>The <see cref="Task{BaseResult{SickEntity}}"/>.</returns>
        public async Task<BaseResult<SickEntity>> GetList(SickQueryDTO models)
        {
            string tableName = "tbSick";
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
            if (models.title != null)
            {
                where = where + "AND title LIKE '%" + models.title + "%'";
            }
            int skip = (models.pageIndex - 1) * models.pageSize + 1;
            StringBuilder sb = new StringBuilder();
            //sb.AppendFormat(@"SELECT  * FROM(SELECT ROW_NUMBER() OVER(ORDER BY {0}) AS RowNum,*FROM  {1} WHERE IsDelete=0) AS result WHERE  RowNum >= {2}   AND RowNum <= {3} ORDER BY id desc", orderby, tableName, skip, models.pageIndex * models.pageSize);
            sb.AppendFormat("SELECT COUNT(1) FROM {0} WHERE {1};", tableName, where);
            sb.AppendFormat(@"SELECT  *
                                FROM(SELECT ROW_NUMBER() OVER(ORDER BY {2}) AS RowNum,*
                                          FROM  {0}
                                          WHERE {1}
                                        ) AS result
                                WHERE  RowNum >= {3}   AND RowNum <= {4}
                                ORDER BY {2}", tableName, where, orderby, skip, models.pageIndex * models.pageSize);
            var result = new BaseResult<SickEntity>();
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
        /// 新增.
        /// </summary>
        /// <param name="entity">数据实体.</param>
        /// <returns>返回主键值.</returns>
        public async Task<BaseResult<SickEntity>> Add(SickEntity entity)
        {
            string insertSql = @"INSERT INTO dbo.tbSick(title, overview,acupoint,pathogeny,analysis,food) VALUES(@title, @overview,@acupoint,@pathogeny,@analysis,@food) select @@identity";
            var result = new BaseResult<SickEntity>();
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
        /// 修改.
        /// </summary>
        /// <param name="entity">数据实体.</param>
        /// <returns>返回主键值.</returns>
        public async Task<BaseResult<SickEntity>> Updata(SickEntity entity)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"UPDATE dbo.tbSick SET title = '{0}', overview ='{1}', acupoint = '{2}', food ='{3}', pathogeny ='{4}', analysis = '{5}' WHERE id={6} ", entity.title, entity.overview, entity.acupoint, entity.food, entity.pathogeny, entity.analysis, entity.id);
            var result = new BaseResult<SickEntity>();
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
        /// 删除 逻辑删除.
        /// </summary>
        /// <param name="entity">数据实体.</param>
        /// <returns>返回主键值.</returns>
        public async Task<BaseResult<SickEntity>> Delete(SickEntity entity)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"UPDATE dbo.tbSick SET IsDelete = 1 WHERE id = {0}", entity.id);
            var result = new BaseResult<SickEntity>();
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
