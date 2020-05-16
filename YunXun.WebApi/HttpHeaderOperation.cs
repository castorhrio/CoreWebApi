namespace YunXun.WebApi
{
    using Microsoft.AspNetCore.Authorization;
    using Swashbuckle.AspNetCore.Swagger;
    using Swashbuckle.AspNetCore.SwaggerGen;
    using System.Collections.Generic;
    using System.Linq;
    using System.Reflection;

    /// <summary>
    /// Defines the <see cref="HttpHeaderOperation" />.
    /// </summary>
    public class HttpHeaderOperation : IOperationFilter
    {
        /// <summary>
        /// The Apply.
        /// </summary>
        /// <param name="operation">The operation<see cref="Operation"/>.</param>
        /// <param name="context">The context<see cref="OperationFilterContext"/>.</param>
        public void Apply(Operation operation, OperationFilterContext context)
        {
            if (operation.Parameters == null)
            {
                operation.Parameters = new List<IParameter>();
            }

            if (context.ApiDescription.TryGetMethodInfo(out MethodInfo methodInfo))
            {
                if (!methodInfo.CustomAttributes.Any(t => t.AttributeType == typeof(AllowAnonymousAttribute))
                        && !(methodInfo.ReflectedType.CustomAttributes.Any(t => t.AttributeType == typeof(AuthorizeAttribute))))
                {
                    operation.Parameters.Add(new NonBodyParameter
                    {
                        Name = "Authorization",
                        In = "header",
                        Type = "string",
                        Required = false,
                        //Description = "请输入Token，格式为bearer XXX"
                    });
                }
            }
        }
    }
}
