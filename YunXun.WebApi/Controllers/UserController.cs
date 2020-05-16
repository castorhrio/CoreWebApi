namespace YunXun.WebApi.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using System;
    using System.Threading.Tasks;
    using YunXun.Common.DTO;
    using YunXun.Dapper.IRepository;
    using YunXun.Entity.Models;
    using YunXun.Entity.ViewModels;

    /// <summary>
    /// Defines the <see cref="UserController" />.
    /// </summary>
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        /// <summary>
        /// Defines the userRepository.
        /// </summary>
        private readonly IUserRepository userRepository;

        /// <summary>
        /// Defines the userCollectRepository.
        /// </summary>
        private readonly IUserCollectRepository userCollectRepository;

        /// <summary>
        /// Initializes a new instance of the <see cref="UserController"/> class.
        /// </summary>
        /// <param name="_userRepository">The _userRepository<see cref="IUserRepository"/>.</param>
        /// <param name="_userCollectRepository">The _userCollectRepository<see cref="IUserCollectRepository"/>.</param>
        public UserController(IUserRepository _userRepository, IUserCollectRepository _userCollectRepository)
        {
            userRepository = _userRepository;
            userCollectRepository = _userCollectRepository;
        }

        /// <summary>
        /// 注册.
        /// </summary>
        /// <param name="entity">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserEntity>> Add(UserEntity entity)
        {
            return await userRepository.Add(entity);
        }

        /// <summary>
        /// 登录.
        /// </summary>
        /// <param name="entity">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserEntity>> Login(UserEntity entity)
        {
            return await userRepository.Login(entity);
        }

        /// <summary>
        /// 获取用户详细信息.
        /// </summary>
        /// <param name="id">The id<see cref="int"/>.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserEntity>> GetDetail(int id)
        {
            return await userRepository.Detail(id);
        }

        /// <summary>
        /// 获取用户分页列表.
        /// </summary>
        /// <param name="modal">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserEntity>> GetList(UserQueryDTO modal)
        {
            return await userRepository.GetList(modal);
        }

        /// <summary>
        /// 修改密码.
        /// </summary>
        /// <param name="modal">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserEntity>> Updata(UserDTO modal)
        {
            BaseResult<UserEntity> userinfo = await userRepository.Detail(modal.userId);
            int isManager = modal.isManager;
            if (userinfo.code != "0" || userinfo.data.total <= 0)
            {
                throw new Exception("用户不存在");
            }
            if (!string.IsNullOrEmpty(modal.oldPassWord))
            {
                if (modal.comfirPassword != modal.newPassword)
                {
                    throw new Exception("两次密码输入不一致");
                }
                if (userinfo.data.list[0].passWord != modal.oldPassWord)
                {
                    throw new Exception("原密码输入错误");
                }
            }
            else
            {
                modal.newPassword = userinfo.data.list[0].passWord;
                modal.isManager = userinfo.data.list[0].isManager;
            }
            if (userinfo.data.list[0].isManager == 1)
            {
                modal.isManager = 1;
            }
            if (!string.IsNullOrEmpty(modal.editManager))
            {
                modal.isManager = isManager;
            }
            return await userRepository.Update(modal);
        }

        /// <summary>
        /// 用户收藏.
        /// </summary>
        /// <param name="entity">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserCollectEntity>> Collect(UserCollectEntity entity)
        {
            IsCollectDTO query = new IsCollectDTO()
            {
                objId = entity.objId,
                userId = entity.userId,
                type = entity.type,
            };
            var isCollect = await userCollectRepository.IsCollect(query);
            if (isCollect.code == "0")
            {
                if (isCollect.data.list[0].isCollect == true)
                {
                    throw new Exception("该对象已经被收藏");
                }
            }
            return await userCollectRepository.Add(entity);
        }

        /// <summary>
        /// 用户取消收藏.
        /// </summary>
        /// <param name="entity">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserCollectEntity>> UnCollect(UserCollectEntity entity)
        {
            return await userCollectRepository.Delete(entity);
        }

        /// <summary>
        /// 用户获取收藏列表.
        /// </summary>
        /// <param name="modal">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<UserCollectEntity>> GetCollectList(UserCollectQueryDTO modal)
        {
            return await userCollectRepository.GetCollectList(modal);
        }

        /// <summary>
        /// 判断对象是否被收藏.
        /// </summary>
        /// <param name="query">.</param>
        /// <returns>.</returns>
        [HttpPost]
        public async Task<BaseResult<IsCollectDTO>> IsCollect(IsCollectDTO query)
        {
            if (query.userId == 0 || query.objId == 0 || query.type == 3)
            {
                throw new Exception("参数接受错误");
            }
            return await userCollectRepository.IsCollect(query);
        }
    }
}
