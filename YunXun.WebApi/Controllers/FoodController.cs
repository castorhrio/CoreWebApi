namespace YunXun.WebApi.Controllers
{
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.Http;
    using Microsoft.AspNetCore.Mvc;
    using System;
    using System.IO;
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Dapper.IRepository;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="FoodController" />.
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class FoodController : ControllerBase
    {
        /// <summary>
        /// Defines the foodRepository.
        /// </summary>
        private readonly IFoodRepository foodRepository;

        /// <summary>
        /// Defines the _hostingEnvironment.
        /// </summary>
        private readonly IHostingEnvironment _hostingEnvironment;

        /// <summary>
        /// Initializes a new instance of the <see cref="FoodController"/> class.
        /// </summary>
        /// <param name="_FoodRepository">The _FoodRepository<see cref="IFoodRepository"/>.</param>
        /// <param name="hostingEnvironment">The hostingEnvironment<see cref="IHostingEnvironment"/>.</param>
        public FoodController(IFoodRepository _FoodRepository, IHostingEnvironment hostingEnvironment)
        {
            foodRepository = _FoodRepository;
            _hostingEnvironment = hostingEnvironment;
        }

        /// <summary>
        /// 获取食物列表 旧版.
        /// </summary>
        /// <param name="pageIndex">下标.</param>
        /// <param name="pageSize">每页大小.</param>
        /// <param name="SortRule">排序方式 1 desc 0 asc.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule)
        {
            return await foodRepository.GetListByPage(pageIndex, pageSize, SortRule);
        }

        /// <summary>
        /// 获取食物列表 新版.
        /// </summary>
        /// <param name="models">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> GetList(QueryDTO models)
        {
            var list = await foodRepository.GetList(models);
            return list;
        }

        /// <summary>
        /// 获取食物详细信息.
        /// </summary>
        /// <param name="id">The id<see cref="int"/>.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> GetDetail(int id)
        {
            return await foodRepository.Detail(id);
        }

        /// <summary>
        /// 增加.
        /// </summary>
        /// <param name="entity">The entity<see cref="FoodEntity"/>.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> Add([FromForm]FoodEntity entity)
        {
            if (entity.image == null)
            {
                IFormFileCollection file = Request.Form.Files;
                if (file != null && file.Count == 1)
                {
                    //文件存放路径
                    string path = "";
                    //path = $"{_hostingEnvironment.WebRootPath}/Upload/Food";
                    //path = "E:/Upload/Food";
                    path = "C:/backTh/wwwroot/Food";// 绝对路劲
                    if (!Directory.Exists(path))
                    {
                        //路径不存在则新建路径
                        if (!string.IsNullOrEmpty(path))
                        {
                            Directory.CreateDirectory(path);
                        }
                    }
                    string fileName = file[0].FileName;
                    string fileExt = Path.GetExtension(fileName);//获取文件扩展名
                    string newFileName = Guid.NewGuid() + fileExt;//随机生成新文件名
                    string savePath = "";//完整路径
                    savePath = path + "/" + newFileName;
                    using (var stream = new FileStream(savePath, FileMode.Create))
                    {
                        //写入本地
                        file[0].CopyTo(stream);
                        stream.Flush();
                    }
                    //保存到数据库
                    string filePath = "/wwwroot/Food/" + newFileName;
                    entity.image = filePath;
                }
                else
                {
                    //throw new Exception("请上传一张图片且只能上传一张");
                    var result = new BaseResult<FoodEntity>();
                    result.code = "-1";
                    result.desc = "请上传一张图片且只能上传一张";
                    return result;
                }
            }

            return await foodRepository.Add(entity);
        }

        /// <summary>
        /// 修改.
        /// </summary>
        /// <param name="entity">The entity<see cref="FoodEntity"/>.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> Update([FromForm]FoodEntity entity)
        {
            if (entity.image == null)
            {
                IFormFileCollection file = Request.Form.Files;
                if (file != null && file.Count == 1)
                {
                    //文件存放路径
                    string path = "";
                    //path = $"{_hostingEnvironment.WebRootPath}/Upload/Food";
                    //path = "E:/Upload/Food";
                    path = "C:/backTh/wwwroot/Food";// 绝对路劲
                    if (!Directory.Exists(path))
                    {
                        //路径不存在则新建路径
                        if (!string.IsNullOrEmpty(path))
                        {
                            Directory.CreateDirectory(path);
                        }
                    }
                    string fileName = file[0].FileName;
                    string fileExt = Path.GetExtension(fileName);//获取文件扩展名
                    string newFileName = Guid.NewGuid() + fileExt;//随机生成新文件名
                    string savePath = "";//完整路径
                    savePath = path + "/" + newFileName;
                    using (var stream = new FileStream(savePath, FileMode.Create))
                    {
                        //写入本地
                        file[0].CopyTo(stream);
                        stream.Flush();
                    }
                    //保存到数据库
                    string filePath = "/wwwroot/Food/" + newFileName;
                    entity.image = filePath;
                }
                else
                {
                    var result = new BaseResult<FoodEntity>();
                    result.code = "-1";
                    result.desc = "请上传一张图片且只能上传一张";
                    return result;
                }
            }

            return await foodRepository.Update(entity);
        }

        /// <summary>
        /// 删除.
        /// </summary>
        /// <param name="entity">The entity<see cref="FoodEntity"/>.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> Delete(FoodEntity entity)
        {
            var number = await foodRepository.Detail(entity.id);
            var result = new BaseResult<FoodEntity>();
            if (number.code != "0")
            {
                throw new Exception("数据不存在");
            }
            return await foodRepository.Delete(entity);
        }

        /// <summary>
        /// 批量删除.
        /// </summary>
        /// <param name="model">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<FoodEntity>> DeleteList([FromBody]DeleteDTO model)
        {
            if (model.ids.Count == 0)
            {
                throw new Exception("参数接受失败");
            }
            var idList = model.ids;
            foreach (int item in idList)
            {
                var number = await foodRepository.Detail(item);
                if (number.code != "0")
                {
                    throw new Exception("数据不存在");
                }
                FoodEntity entity = new FoodEntity()
                {
                    id = item
                };
                try
                {
                    await foodRepository.Delete(entity);
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
            var result = new BaseResult<FoodEntity>()
            {
                code = "0",
                data = null,
                desc = "删除成功",
            };
            return result;
        }
    }
}
