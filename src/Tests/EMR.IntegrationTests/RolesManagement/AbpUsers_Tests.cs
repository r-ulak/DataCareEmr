using NUnit.Framework;
using Shouldly;
using System.Threading.Tasks;
using EMR.Users;
using EMR.DTO.Common;
using EMR.Roles.Dto;
using EMR.DTO.RoleUser;
using EMR.Users.Dto;
using EMR.DAL;
using Abp.UI;
using System.Collections.Generic;
using Microsoft.AspNet.Identity;
using System;
using Emr.TestsCommon;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class AbpUsers_Tests : EMRIntegrationTestBase
    {
        private IUserAccountAppService _abpUsersService;
        private IAbpUsersRepositoryExtended _abpUserRepo;
        private IAbpUserRolesRepositoryExtended _abpUserRoleRepo;

        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            SetupConnection();
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpUsers.sql");
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpRoles.sql");
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpPermissions.sql");
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpUserRole.sql");

        }

        public void SetupConnection()
        {

        }
        [TearDown]
        public void ClassEndCleanup()
        {

        }

        [Test]
        public async Task Should_Return_AllUser_ByRoleId()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                SessionInfo = new SessionDto()
                {
                    TenantId = 1,
                    LoggedUserId = 1,
                }

            };
            //Act
            var users = await _abpUsersService.GetUsersByRoleId
                (roleInput);

            //Assert
            users.Count.ShouldBe(2);
        }

        [Test]
        public async Task Should_Return_AllUser_ForTenant()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            AbpSession.TenantId = 1;

            //Act
            var users = await _abpUsersService.GetAllUsers();

            //Assert
            users.Count.ShouldBe(3);
        }

        [Test]
        public async Task Should_Return_AllRole_By_UserId()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            UserRoleInputDto roleInput = new UserRoleInputDto
            {
                UserId = 1,
                SessionInfo = new SessionDto()
                {
                    TenantId = 1,
                    LoggedUserId = 1,
                }

            };
            //Act
            var roles = await _abpUsersService.GetRoleByUserId
                (roleInput);

            //Assert
            roles.Count.ShouldBe(1);
        }

        [Test]
        public void Should_Avoid_Creating_Account_Duplicate_Email()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            CreateUserInput user = new CreateUserInput
            {
                EmailAddress = "email0@email.com",
                IsActive = true,
                Name = "John",
                Surname = "Nash",
                Password = "123qwe",
                UserName = "john.nash"
            };
            //Act

            UserFriendlyException ex = Assert.ThrowsAsync<UserFriendlyException>(async () =>
            await _abpUsersService.CreateUser(user), "Email already registered");
            //Assert
            ex.Message.ShouldBe("Email already registered");

        }

        [Test]
        public void Should_Avoid_Creating_Account_Duplicate_Username()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            CreateUserInput user = new CreateUserInput
            {
                EmailAddress = "johndoes@email.com",
                IsActive = true,
                Name = "John",
                Surname = "Nash",
                Password = "123qwe",
                UserName = "UserName0"
            };
            //Act

            UserFriendlyException ex = Assert.ThrowsAsync<UserFriendlyException>(async () =>
            await _abpUsersService.CreateUser(user));

            ex.Message.ShouldBe("Username already registered");
            //Assert
        }

        [Test]
        public async Task Should_Create_New_User()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            _abpUserRoleRepo = Resolve<IAbpUserRolesRepositoryExtended>();
            CreateUserInput user = new CreateUserInput
            {
                EmailAddress = "johndoes@email.com",
                IsActive = true,
                Name = "John",
                Surname = "Nash",
                Password = "123qwe",
                UserName = "User1",
                Roles = new List<int>() { 1 }
            };
            //Act

            await _abpUsersService.CreateUser(user);
            //Assert
            var result = await _abpUserRepo.GetByUserNameAsync("User1", 1);
            result[0].Name.ShouldBe("John");
            result[0].EmailAddress.ShouldBe("johndoes@email.com");

            var roles = await _abpUserRoleRepo.GetByUserIdAsync(result[0].Id, 1);
            roles[0].RoleId.ShouldBe(1);
        }

        [Test]
        public async Task Should_Update_UserProperites_Correctly()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            _abpUserRoleRepo = Resolve<IAbpUserRolesRepositoryExtended>();
            var tenantId = 1;
            EditUserInput user = new EditUserInput
            {
                IsActive = true,
                Name = "John",
                Surname = "Nash",
                Password = "WhatIsMyPassword",
                Roles = new List<int>() { 2 },
                UserId = 1,
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = tenantId
                }
            };
            //Act

            await _abpUsersService.UpdateUser(user);
            //Assert
            var result = await _abpUserRepo.GetByUserNameAsync("UserName0", tenantId);
            result[0].Name.ShouldBe("John");
            result[0].Surname.ShouldBe("Nash");
            result[0].EmailAddress.ShouldBe("email0@email.com");
            var passwordHasher = new PasswordHasher();
            passwordHasher.VerifyHashedPassword(
                 result[0].Password, "WhatIsMyPassword"
                ).ShouldBe(PasswordVerificationResult.Success);

            var roles = await _abpUserRoleRepo.GetByUserIdAsync(result[0].Id, tenantId);
            roles[0].RoleId.ShouldBe(2);
        }

        [Test]
        public async Task Should_Not_Update_Password()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            _abpUserRoleRepo = Resolve<IAbpUserRolesRepositoryExtended>();
            var tenantId = 1;
            EditUserInput user = new EditUserInput
            {
                IsActive = true,
                Name = "John",
                Surname = "Nash",
                Roles = new List<int>() { 2 },
                UserId = 1,
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = tenantId
                }
            };
            //Act

            await _abpUsersService.UpdateUser(user);
            //Assert
            var result = await _abpUserRepo.GetByUserNameAsync("UserName0", tenantId);
            result[0].Name.ShouldBe("John");
            result[0].Surname.ShouldBe("Nash");
            result[0].EmailAddress.ShouldBe("email0@email.com");
            result[0].Password.ShouldBe("Password0");

            var roles = await _abpUserRoleRepo.GetByUserIdAsync(result[0].Id, tenantId);
            roles[0].RoleId.ShouldBe(2);
        }

        [Test]
        public async Task Should_Not_Allow_Update_Of_Non_TenatId()
        {
            //Arrange
            _abpUsersService = Resolve<IUserAccountAppService>();
            _abpUserRepo = Resolve<IAbpUsersRepositoryExtended>();
            _abpUserRoleRepo = Resolve<IAbpUserRolesRepositoryExtended>();
            var tenantId = 1;
            EditUserInput user = new EditUserInput
            {
                IsActive = true,
                Name = "John",
                Surname = "Nash",
                Password = "WhatIsMyPassword",
                Roles = new List<int>() { 2 },
                UserId = 5,
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = tenantId
                }
            };
            //Act
            NullReferenceException ex = Assert.ThrowsAsync<NullReferenceException>(async () =>
             await _abpUsersService.UpdateUser(user));
            //Assert
            ex.Message.ShouldBe("Object reference not set to an instance of an object.");
            var result = await _abpUserRepo.GetByIdAsync(5, 3);
            result.Name.ShouldBe("Name0");
            result.Surname.ShouldBe("SurName0");
            result.EmailAddress.ShouldBe("email1@email1.com");
            result.Password.ShouldBe("Password0");
            var roles = await _abpUserRoleRepo.GetByUserIdAsync(result.Id, 3);
            roles.Count.ShouldBe(0);
        }
    }
}
