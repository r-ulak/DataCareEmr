using System.Data.Entity;
using System.Threading.Tasks;
using EMR.Users;
using EMR.Users.Dto;
using Shouldly;
using Xunit;

namespace EMR.Tests.Users
{
    public class UserAppService_Tests : EMRTestBase
    {
        private readonly IUserAppService _userAppService;

        public UserAppService_Tests()
        {
            _userAppService = Resolve<IUserAppService>();
        }

        [Fact]
        public async Task GetUsers_Test()
        {
            //Act
            var output = await _userAppService.GetUsers();

            //Assert
            output.Items.Count.ShouldBeGreaterThan(0);
        }
    }
}
