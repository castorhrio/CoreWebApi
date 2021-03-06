﻿namespace YunXun.Dapper
{
    using global::Dapper;
    using System.Collections.Generic;
    using System.Data;
    using System.Linq;
    using System.Threading.Tasks;
    using YunXun.Dapper.DataFactory;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// 仓储接口实现类.
    /// </summary>
    /// <typeparam name="T">.</typeparam>
    /// <typeparam name="TKey">.</typeparam>
    public class RepositoryBase<T, TKey> : IRepositoryBase<T, TKey> where T : class
    {
        /// <summary>
        /// Defines the dbOption.
        /// </summary>
        protected DbOption dbOption;

        /// <summary>
        /// Defines the dbConnection.
        /// </summary>
        protected IDbConnection dbConnection;

        /// <summary>
        /// 新增.
        /// </summary>
        /// <param name="entity">实体.</param>
        /// <param name="addStr">新增sql语句.</param>
        /// <returns>返回主键值.</returns>
        public async Task<int?> Add(T entity, string addStr)
        {
            return await dbConnection.ExecuteScalarAsync<int?>(addStr, entity);
        }

        /// <summary>
        /// 删除（批量删除）.
        /// </summary>
        /// <param name="id">唯一标识.</param>
        /// <param name="deleteStr">删除sql语句.</param>
        /// <returns>返回受影响行数.</returns>
        public async Task<int?> Delete(object id, string deleteStr)
        {
            return await dbConnection.ExecuteScalarAsync<int?>(deleteStr, new { id = id });
        }

        /// <summary>
        /// 按条件删除.
        /// </summary>
        /// <param name="conditionStr">条件.</param>
        /// <returns>受影响的行数.</returns>
        public async Task<int?> DeleteBy(object conditionStr)
        {
            return await dbConnection.ExecuteScalarAsync<int?>(conditionStr.ToString());
        }

        /// <summary>
        /// 真实删除.
        /// </summary>
        /// <param name="conditionStr">.</param>
        /// <returns>.</returns>
        public async Task<int?> DeleteReal(object conditionStr)
        {
            return await dbConnection.QueryFirstOrDefaultAsync<int?>(conditionStr.ToString());
        }

        /// <summary>
        /// 批量删除.
        /// </summary>
        /// <param name="conditionStr">条件.</param>
        /// <param name="transaction">事物.</param>
        /// <returns>.</returns>
        public async Task<int?> DeleteList(object conditionStr, IDbTransaction transaction = null)
        {
            return await dbConnection.ExecuteScalarAsync<int?>(conditionStr.ToString());
        }

        /// <summary>
        /// 获取详情.
        /// </summary>
        /// <param name="id">唯一标识.</param>
        /// <param name="detailStr">The detailStr<see cref="string"/>.</param>
        /// <returns>对象实体.</returns>
        public async Task<T> Detail(TKey id, string detailStr)
        {
            return await dbConnection.QueryFirstOrDefaultAsync<T>(detailStr, new { id = id });
        }

        /// <summary>
        /// 按条件获取详情.
        /// </summary>
        /// <param name="conditionStr">条件.</param>
        /// <returns>对象实体.</returns>
        public async Task<T> DetailBy(object conditionStr)
        {
            var i = await dbConnection.QueryFirstOrDefaultAsync<T>(conditionStr.ToString());
            return i;
        }

        /// <summary>
        /// 获取总记录数.
        /// </summary>
        /// <param name="sqlStr">查询总数.</param>
        /// <returns>返回总记录数.</returns>
        public async Task<int?> GetCount(string sqlStr)
        {
            return await dbConnection.QuerySingleAsync<int?>(sqlStr);
        }

        /// <summary>
        /// 分页获取.
        /// </summary>
        /// <param name="sqlStr">分页查询语句.</param>
        /// <returns>由于异步方法不能有out，ref  所以用了一个实体返回.</returns>
        public async Task<PageData<T>> GetPageList(string sqlStr)
        {
            var reader = await dbConnection.QueryMultipleAsync(sqlStr.ToString());
            int retNum = await reader.ReadFirstAsync<int>();
            IEnumerable<T> tList = await reader.ReadAsync<T>();
            return new PageData<T>() { list = tList.ToList(), total = retNum };
        }

        /// <summary>
        /// 获取列表.
        /// </summary>
        /// <param name="selectStr">查询sql语句.</param>
        /// <returns>.</returns>
        public async Task<IList<T>> Select(string selectStr)
        {
            IEnumerable<T> tList = await Task.Run(() => dbConnection.QueryAsync<T>(selectStr));
            return tList.ToList();
        }

        /// <summary>
        /// 更新.
        /// </summary>
        /// <param name="entity">实体.</param>
        /// <param name="updateStr">更新sql语句.</param>
        /// <returns>.</returns>
        public async Task<int?> Update(T entity, string updateStr)
        {
            var i = await dbConnection.ExecuteScalarAsync<int?>(updateStr, entity);
            return i;
        }

        /// <summary>
        /// Defines the disposedValue.
        /// </summary>
        private bool disposedValue = false;// 要检测冗余调用

        /// <summary>
        /// The Dispose.
        /// </summary>
        /// <param name="disposing">The disposing<see cref="bool"/>.</param>
        protected virtual void Dispose(bool disposing)
        {
            if (!disposedValue)
            {
                if (disposing)
                {
                    // TODO: 释放托管状态(托管对象)。
                }

                // TODO: 释放未托管的资源(未托管的对象)并在以下内容中替代终结器。
                // TODO: 将大型字段设置为 null。

                disposedValue = true;
            }
        }

        // TODO: 仅当以上 Dispose(bool disposing) 拥有用于释放未托管资源的代码时才替代终结器。
        // ~RepositoryBase()
        // {
        //   // 请勿更改此代码。将清理代码放入以上 Dispose(bool disposing) 中。
        //   Dispose(false);
        // }

        // 添加此代码以正确实现可处置模式。
        /// <summary>
        /// The Dispose.
        /// </summary>
        public void Dispose()
        {
            // 请勿更改此代码。将清理代码放入以上 Dispose(bool disposing) 中。
            Dispose(true);
        }
    }
}
