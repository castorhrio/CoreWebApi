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
    /// Defines the <see cref="UserRepository" />.
    /// </summary>
    public class UserRepository : RepositoryBase<UserEntity, int>, IUserRepository
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="UserRepository"/> class.
        /// </summary>
        /// <param name="options">The options<see cref="IOptionsSnapshot{DbOption}"/>.</param>
        public UserRepository(IOptionsSnapshot<DbOption> options)
        {
            dbOption = options.Get("DBConnect");
            if (dbOption == null)
            {
                throw new ArgumentNullException(nameof(DbOption));
            }
            dbConnection = ConnectionFactory.CreateConnection(dbOption.DbType, dbOption.ConnectionString);
        }

        /// <summary>
        /// 新增.
        /// </summary>
        /// <param name="entity">数据实体.</param>
        /// <returns>返回主键值.</returns>
        public async Task<BaseResult<UserEntity>> Add(UserEntity entity)
        {
            var result = new BaseResult<UserEntity>();
            string countSql = string.Format(@"SELECT count(userId) FROM dbo.tbUser where IsDelete=0 and userName='{0}'", entity.userName);
            int? n = await GetCount(countSql);
            if (n > 0)
            {
                result.code = ResultKey.RETURN_FAIL_CODE;
                result.desc = "用户名已存在！";
                return result;
            }
            string insertSql = @"INSERT INTO dbo.tbUser (userName, passWord,age) VALUES(@userName, @passWord,@age) select @@identity";
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
        /// 登录.
        /// </summary>
        /// <param name="entity">The entity<see cref="UserEntity"/>.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<UserEntity>> Login(UserEntity entity)
        {
            var result = new BaseResult<UserEntity>();

            string selectSql = string.Format(@"SELECT * FROM dbo.tbUser where IsDelete=0 and userName='{0}' and passWord='{1}'", entity.userName, entity.passWord);
            try
            {
                var qList = await Select(selectSql);
                if (qList.Count > 0)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<UserEntity> { list = qList, total = qList.Count };
                    result.desc = ResultKey.RETURN_SUCCESS_DESC;
                }
                else
                {
                    result.code = ResultKey.RETURN_FAIL_CODE;
                    result.desc = "帐号或密码错误！";
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
        /// 删除.
        /// </summary>
        /// <param name="Id">标识.</param>
        /// <returns>影响的行数.</returns>
        public async Task<BaseResult<UserEntity>> Delete(int Id)
        {
            string deleteSql = "update dbo.tbUser SET isDelete=1  WHERE userId=@userId";
            var result = new BaseResult<UserEntity>();
            try
            {
                var i = await Delete(Id, deleteSql);
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
        /// 批量删除.
        /// </summary>
        /// <param name="Ids">The Ids<see cref="int[]"/>.</param>
        /// <returns>影响的行数.</returns>
        public async Task<BaseResult<UserEntity>> DeleteList(int[] Ids)
        {
            string deleteSql = "update dbo.tbUser SET isDelete=1  WHERE userId in @userIds";
            var result = new BaseResult<UserEntity>();
            try
            {
                var i = await Delete(Ids, deleteSql);
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
        /// 按条件删除.
        /// </summary>
        /// <param name="conditionStr">The conditionStr<see cref="string"/>.</param>
        /// <returns>受影响都行数.</returns>
        public async Task<BaseResult<UserEntity>> DeleteBy(string conditionStr)
        {
            string deleteSql = "UPDATE dbo.tbUser SET IsDelete=1 WHERE 1=1 and  " + conditionStr;
            var result = new BaseResult<UserEntity>();
            try
            {
                var i = await DeleteBy(deleteSql);
                if (null != i)
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
        /// 更新.
        /// </summary>
        /// <param name="modal">The modal<see cref="UserDTO"/>.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<UserEntity>> Update(UserDTO modal)
        {
            string updateSql = string.Format(@"UPDATE dbo.tbUser SET passWord='{0}',isManager={1} where userId={2}", modal.newPassword, modal.isManager, modal.userId);
            var result = new BaseResult<UserEntity>();
            UserEntity entity = new UserEntity()
            {
                userId = modal.userId,
                passWord = modal.newPassword,
                isManager = modal.isManager,
            };
            try
            {
                await Update(entity, updateSql.ToString());
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
        /// 查询列表.
        /// </summary>
        /// <param name="modal">The modal<see cref="UserQueryDTO"/>.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<UserEntity>> GetList(UserQueryDTO modal)
        {
            string tableName = "tbUser";
            string where = " IsDelete=0";
            string orderby = "userId ";
            if (modal.sortRule == 1)
            {
                orderby += " desc";
            }
            else
            {
                orderby += " asc";
            }
            if (modal.userName != null)
            {
                where = where + "AND userName LIKE '%" + modal.userName + "%'";
            }
            int skip = (modal.pageIndex - 1) * modal.pageSize + 1;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"SELECT COUNT(1) FROM {0} WHERE 1=1;", tableName, where);
            sb.AppendFormat(@"SELECT  *
                                FROM(SELECT ROW_NUMBER() OVER(ORDER BY {1}) AS RowNum,*
                                          FROM  {0}
                                          WHERE 1=1 AND {4}
                                        ) AS result
                                WHERE  RowNum >= {2}   AND RowNum <= {3}
                                ORDER BY {1}", tableName, orderby, skip, modal.pageIndex * modal.pageSize, where);
            var result = new BaseResult<UserEntity>();
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
        /// 获取用户详细信息.
        /// </summary>
        /// <param name="Id">.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<UserEntity>> Detail(int Id)
        {
            string detailSql = string.Format(@"SELECT *  FROM dbo.tbUser WHERE userId={0}", Id);
            var result = new BaseResult<UserEntity>();
            try
            {
                var entity = await DetailBy(detailSql);
                if (null != entity)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<UserEntity> { list = new List<UserEntity>() { entity }, total = 1 };
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
        public async Task<BaseResult<UserEntity>> GetCount()
        {
            string countSql = @"SELECT count(userId) FROM dbo.tbUser where IsDelete=0";
            var result = new BaseResult<UserEntity>();
            try
            {
                var entity = await GetCount(countSql);
                if (null != entity)
                {
                    result.code = ResultKey.RETURN_SUCCESS_CODE;
                    result.data = new PageData<UserEntity> { list = { }, total = 1 };
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
        /// 获取分页数据.
        /// </summary>
        /// <param name="pageIndex">页码.</param>
        /// <param name="pageSize">页数.</param>
        /// <param name="SortRule">The SortRule<see cref="int"/>.</param>
        /// <returns>.</returns>
        public async Task<BaseResult<UserEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule = 1)
        {
            string tableName = "tbUser";
            string where = " IsDelete=0";
            string orderby = "userId ";
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
            var result = new BaseResult<UserEntity>();
            try
            {
                var pageData = await GetPageList(sb.ToString());
                if (null != pageData)
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
    }
}
