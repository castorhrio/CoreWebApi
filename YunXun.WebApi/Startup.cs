namespace YunXunWebApi
{
    using Autofac;
    using Autofac.Extensions.DependencyInjection;
    using Microsoft.AspNetCore.Builder;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.Extensions.Configuration;
    using Microsoft.Extensions.DependencyInjection;
    using Microsoft.Extensions.PlatformAbstractions;
    using Swashbuckle.AspNetCore.Swagger;
    using System;
    using System.IO;
    using System.Linq;
    using System.Reflection;
    using YunXun.Dapper.DataFactory;
    using YunXun.WebApi;
    using YunXun.WebApi.Unit;

    /// <summary>
    /// Defines the <see cref="Startup" />.
    /// </summary>
    public class Startup
    {
        /// <summary>
        /// Gets or sets the CurrentEnvironment.
        /// </summary>
        private IHostingEnvironment CurrentEnvironment { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="Startup"/> class.
        /// </summary>
        /// <param name="configuration">The configuration<see cref="IConfiguration"/>.</param>
        /// <param name="env">The env<see cref="IHostingEnvironment"/>.</param>
        public Startup(IConfiguration configuration, IHostingEnvironment env)
        {
            CurrentEnvironment = env;
            Configuration = configuration;
        }

        /// <summary>
        /// Gets the Configuration.
        /// </summary>
        public IConfiguration Configuration { get; }

        /// <summary>
        /// Gets the ApplicationContainer.
        /// </summary>
        public IContainer ApplicationContainer { get; private set; }

        // This method gets called by the runtime. Use this method to add services to the container.
        /// <summary>
        /// The ConfigureServices.
        /// </summary>
        /// <param name="services">The services<see cref="IServiceCollection"/>.</param>
        /// <returns>The <see cref="IServiceProvider"/>.</returns>
        public IServiceProvider ConfigureServices(IServiceCollection services)
        {
            services.Configure<DbOption>("DBConnect", Configuration.GetSection("DbOpion"));

            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v1", new Info
                {
                    Title = "API接口文档",
                    Version = "v1",
                });
                options.IgnoreObsoleteActions();
                options.DocInclusionPredicate((docName, description) => true);
                options.IncludeXmlComments(Path.Combine(PlatformServices.Default.Application.ApplicationBasePath, "YunXun.WebApi.xml"));
                options.DescribeAllEnumsAsStrings();
                options.OperationFilter<HttpHeaderOperation>(); // 添加httpHeader参数
            });

            // services.AddTransient<IJwt, Jwt>();//Jwt注入
            // 解决跨域问题
            services.AddCors(options =>
              {

                  options.AddPolicy("cors", p =>
                  {

                      p.AllowAnyOrigin();
                      p.AllowAnyHeader();
                      p.AllowAnyMethod();
                      p.AllowCredentials();
                  });
              });
            //注入全局异常捕获
            services.AddMvc(o =>
            {
                o.Filters.Add(typeof(GlobalExceptions));
            }).SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            var builder = new ContainerBuilder();//实例化容器
                                                 //注册所有模块module
            builder.RegisterAssemblyModules(Assembly.GetExecutingAssembly());
            //获取所有的程序集
            var assemblys = reflectHelper.GetAllAssemblies().ToArray();
            //注册仓储，所有IRepository接口到Repository的映射
            builder.RegisterAssemblyTypes(assemblys).Where(t => t.Name.EndsWith("Repository") && !t.Name.StartsWith("I")).AsImplementedInterfaces();
            builder.Populate(services);

            return new AutofacServiceProvider(builder.Build()); //第三方IOC接管 core内置DI容器 
        }

        /// <summary>
        /// The Configure.
        /// </summary>
        /// <param name="app">The app<see cref="IApplicationBuilder"/>.</param>
        /// <param name="env">The env<see cref="IHostingEnvironment"/>.</param>
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseCors("cors");
            //app.UseJwt();

            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "API V1");
            });

            app.UseMvc();

            app.UseMvc(routes =>
            {
                routes.MapRoute(name: "default", template: "{controller}/{action}/{id?}");
            });
            // 跨域问题
            app.UseCors(cfg =>
            {
                cfg.AllowAnyOrigin(); //对应跨域请求的地址
                cfg.AllowAnyMethod(); //对应请求方法的Method
                cfg.AllowAnyHeader(); //对应请求方法的Headers
                cfg.AllowCredentials(); //对应请求的withCredentials 值
            });
        }
    }
}
