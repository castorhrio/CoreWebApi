﻿namespace YunXun.Jwt
{
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.Http;
    using Microsoft.Extensions.Configuration;
    using System.Collections.Generic;
    using System.Threading.Tasks;

    /// <summary>
    /// Defines the <see cref="UseJwtMiddleware" />.
    /// </summary>
    public class UseJwtMiddleware
    {
        /// <summary>
        /// Defines the _next.
        /// </summary>
        private readonly RequestDelegate _next;

        /// <summary>
        /// Defines the _jwtEntity.
        /// </summary>
        private JwtEntity _jwtEntity = new JwtEntity();

        /// <summary>
        /// Defines the _jwt.
        /// </summary>
        private IJwt _jwt;

        /// <summary>
        /// Initializes a new instance of the <see cref="UseJwtMiddleware"/> class.
        /// </summary>
        /// <param name="next">The next<see cref="RequestDelegate"/>.</param>
        /// <param name="configration">The configration<see cref="IConfiguration"/>.</param>
        /// <param name="jwt">The jwt<see cref="IJwt"/>.</param>
        public UseJwtMiddleware(RequestDelegate next, IConfiguration configration, IJwt jwt)
        {
            _next = next;
            this._jwt = jwt;
            configration.GetSection("Jwt").Bind(_jwtEntity);
        }

        /// <summary>
        /// 异步调用.
        /// </summary>
        /// <param name="context">.</param>
        /// <returns>.</returns>
        public Task InvokeAsync(HttpContext context)
        {
            if (_jwtEntity.IgnoreUrls.Contains(context.Request.Path))
            {
                return this._next(context);
            }
            else
            {
                if (context.Request.Headers.TryGetValue(this._jwtEntity.HeadField, out Microsoft.Extensions.Primitives.StringValues authValue))
                {
                    var authstr = authValue.ToString().Substring(this._jwtEntity.Prefix.Length, authValue.ToString().Length - this._jwtEntity.Prefix.Length);
                    if (this._jwt.ValidateToken(authstr, out Dictionary<string, string> Clims))
                    {
                        foreach (var item in Clims)
                        {
                            context.Items.Add(item.Key, item.Value);
                        }
                        return this._next(context);
                    }
                    else
                    {
                        context.Response.StatusCode = 401;
                        context.Response.ContentType = "application/json";
                        return context.Response.WriteAsync("{\"status\":401,\"statusMsg\":\"auth vaild fail\"}");
                    }
                }
                else
                {
                    context.Response.StatusCode = 401;
                    context.Response.ContentType = "application/json";
                    return context.Response.WriteAsync("{\"status\":401,\"statusMsg\":\"auth vaild fail\"}");
                }
            }
        }
    }

    /// <summary>
    /// 扩展方法，将中间件暴露出去.
    /// </summary>
    public static class UseUseJwtMiddlewareExtensions
    {
        /// <summary>
        /// 权限检查.
        /// </summary>
        /// <param name="builder">.</param>
        /// <returns>.</returns>
        public static IApplicationBuilder UseJwt(this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<UseJwtMiddleware>();
        }
    }
}
