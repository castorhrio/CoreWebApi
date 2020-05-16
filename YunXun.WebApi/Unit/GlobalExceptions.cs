namespace YunXun.WebApi.Unit
{
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Filters;
    using YunXun.Common;
    using YunXun.Common.DTO;

    /// <summary>
    /// Defines the <see cref="GlobalExceptions" />.
    /// </summary>
    public class GlobalExceptions : IExceptionFilter
    {
        /// <summary>
        /// Defines the _env.
        /// </summary>
        private readonly IHostingEnvironment _env;

        /// <summary>
        /// Initializes a new instance of the <see cref="GlobalExceptions"/> class.
        /// </summary>
        /// <param name="env">The env<see cref="IHostingEnvironment"/>.</param>
        public GlobalExceptions(IHostingEnvironment env)
        {
            _env = env;
        }

        /// <summary>
        /// The OnException.
        /// </summary>
        /// <param name="context">The context<see cref="ExceptionContext"/>.</param>
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
                errorRespone.code = "-1";
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

    /// <summary>
    /// Defines the <see cref="InternalServerErrorObjectResult" />.
    /// </summary>
    public class InternalServerErrorObjectResult : ObjectResult
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="InternalServerErrorObjectResult"/> class.
        /// </summary>
        /// <param name="value">The value<see cref="object"/>.</param>
        public InternalServerErrorObjectResult(object value) : base(value)
        {
            StatusCode = StatusCodes.Status500InternalServerError;
        }
    }
}
