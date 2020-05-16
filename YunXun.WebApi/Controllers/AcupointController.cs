using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using YunXun.Dapper.IRepository;
using YunXun.Entity.Models;
using YunXun.Entity.ViewModels;
using System.IO;
using YunXun.Common.DTO;
using YunXun.Common;

namespace YunXun.WebApi.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class AcupointController : ControllerBase
    {
        private readonly IAcupointRepository acupointRepository;
        public AcupointController(IAcupointRepository _AcupointRepository)
        {
            acupointRepository = _AcupointRepository;
        }

        /// <summary>
        /// 获取穴位列表 旧版
        /// </summary>
        /// <param name="pageIndex">下标</param>
        /// <param name="pageSize">每页大小</param>
        /// <param name="SortRule">排序方式 1 desc 0 asc</param>
        /// <returns></returns>
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> GetListByPage(int pageIndex, int pageSize, int SortRule)
        {
            return await acupointRepository.GetListByPage(pageIndex, pageSize, SortRule);
        }
        /// <summary>
        /// 获取疾病列表 新版
        /// </summary>
        /// <param name="models"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> GetList(QueryDTO models)
        {
            return await acupointRepository.GetList(models);
        }

        /// <summary>
        /// 获取穴位详细信息
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> GetDetail(int id)
        {
            return await acupointRepository.Detail(id);
        }
        /// <summary>
        /// 增加
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> Add([FromForm]AcupointEntity entity)
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
                    path = "C:/backTh/wwwroot/Acupoint";// 绝对路劲
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
                    //string filePath = savePath.Replace(savePath, "");
                    //string filePath = savePath.Substring(2, savePath.Length - 2);
                    string filePath = "/wwwroot/Acupoint/" + newFileName;
                    entity.image = filePath;
                }
                else
                {
                    var result = new BaseResult<AcupointEntity>();
                    result.code = "-1";
                    result.desc = "请上传一张图片且只能上传一张";
                    return result;
                }
            }
            return await acupointRepository.Add(entity);
        }
        /// <summary>
        /// 修改
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> Update([FromForm]AcupointEntity entity)
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
                    path = "C:/backTh/wwwroot/Acupoint";// 绝对路劲
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
                    //string filePath = savePath.Replace(savePath, "");
                    //string filePath = savePath.Substring(17, savePath.Length - 17);
                    string filePath =  "/wwwroot/Acupoint/" + newFileName;
                    entity.image = filePath;
                }
                else
                {
                    var result = new BaseResult<AcupointEntity>();
                    result.code = "-1";
                    result.desc = "请上传一张图片且只能上传一张";
                    return result;
                }
            }

            return await acupointRepository.Update(entity);
        }
        /// <summary>
        /// 删除
        /// </summary>
        /// <returns></returns>
        /// 
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> Delete(AcupointEntity entity)
        {
            var number = await acupointRepository.Detail(entity.id);
            var result = new BaseResult<AcupointEntity>();
            if (number.code != "0")
            {
                throw new Exception("数据不存在");
            }
            return await acupointRepository.Delete(entity);
        }

        /// <summary>
        /// 批量删除 逻辑删除
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public async Task<BaseResult<AcupointEntity>> DeleteList([FromBody]DeleteDTO model)
        {
            if (model.ids.Count == 0)
            {
                throw new Exception("参数接受失败");
            }
            var idList = model.ids;
            foreach (int item in idList)
            {
                var number = await acupointRepository.Detail(item);
                if (number.code != "0")
                {
                    throw new Exception("数据不存在");
                }
                AcupointEntity entity = new AcupointEntity()
                {
                    id = item
                };
                try
                {
                    await acupointRepository.Delete(entity);
                }
                catch (Exception e)
                {
                    throw new Exception(e.Message);
                }
            }
            var result = new BaseResult<AcupointEntity>()
            {
                code = "0",
                data = null,
                desc = "删除成功",
            };
            return result;
        }
    }
}