using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using YunXun.Common;
using YunXun.Common.DTO;

namespace YunXun.WebApi.Unit
{
    public class GlobalExceptions : IExceptionFilter
    {
        private readonly IHostingEnvironment _env;
        public GlobalExceptions(IHostingEnvironment env)
        {
            _env = env;
        }
        public void OnException(ExceptionContext context)
        {
            //var json = new JsonErrorResponse();
            var errorRespone = new ErrorRespone();
            //这里面是自定义的操作记录日志
            if (context.Exception.GetType() == typeof(UserOperationException))
            {
                errorRespone.code = "-1";
                errorRespone.desc = context.Exception.Message;
                //json.Message = "发生了未知内部错误";
                if (_env.IsDevelopment())
                {
                    errorRespone.DevelopmentMessage = context.Exception.StackTrace;//堆栈信息
                }
                //json.Message = context.Exception.Message;
                //if (_env.IsDevelopment())
                //{
                //    json.DevelopmentMessage = context.Exception.StackTrace;//堆栈信息
                //}
                context.Result = new BadRequestObjectResult(errorRespone);//返回异常数据
            }
            else
            {
                errorRespone.code ="-1";
                errorRespone.desc = context.Exception.Message;
                //json.Message = "发生了未知内部错误";
                if (_env.IsDevelopment())
                {
                    errorRespone.DevelopmentMessage = context.Exception.StackTrace;//堆栈信息
                }
                context.Result = new InternalServerErrorObjectResult(errorRespone);
            }

            //采用NLog 进行错误日志记录
            NlogHelper.ErrorLog(errorRespone.desc, context.Exception);
        }
    }
    public class InternalServerErrorObjectResult : ObjectResult
    {
        public InternalServerErrorObjectResult(object value) : base(value)
        {
            StatusCode = StatusCodes.Status500InternalServerError;
        }
    }
}