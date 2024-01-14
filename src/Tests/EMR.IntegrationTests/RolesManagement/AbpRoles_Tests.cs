using Abp.Runtime.Session;
using EMR.AbpRoleService;
using EMR.DAL;
using EMR.DataAccess.Infrastructure.Database;
using EMR.DataAccess.Infrastructure.Database.Implementation;
using EMR.DTO.Common;
using EMR.Entities;
using EMR.Manager.Service;
using EMR.Roles.Dto;
using NUnit.Framework;
using Rhino.Mocks;
using Shouldly;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq;
using System;
using Abp.UI;
using Emr.TestsCommon;
using EMR.Users.Dto;

namespace EMR.IntegrationTests
{
    [TestFixture]
    public class AbpRoles_Tests : EMRIntegrationTestBase
    {
        private IProcExecutor _procExecutor;
        private IAbpRolesRepositoryExtended _abpRolesRepo;
        private IAbpPermissionsRepositoryExtended _abpPermissionsRepo;
        private IAbpUserRolesRepositoryExtended _abpUserRolesRepo;
        private IAbpRolesManager _abpRolesManager;
        private IRolesAppService _abpRolesService;
        private IAppConfigSqlConnection _connection;

        [SetUp]
        public void SetUp()
        {
            base.EMRIntegrationTestBaseSetup();
            SetupConnection();
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpRoles.sql");
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpPermissions.sql");
            LocalDBController.CreateData(LocalDBController.DbName, @"RolesManagement\\SeedData\\AbpUserRole.sql");

        }

        public void SetupConnection()
        {
            _connection = MockRepository.GenerateMock<IAppConfigSqlConnection>();
            _connection.Stub(x => x.GetConnection()).Return(LocalDBController.GetLocalDbConnection(LocalDBController.DbName));
            _procExecutor = MockRepository.GeneratePartialMock<ProcExecutor>(_connection);
            _abpRolesRepo = MockRepository.GeneratePartialMock<AbpRolesRepositoryExtended>(_procExecutor);
            _abpPermissionsRepo = MockRepository.GeneratePartialMock<AbpPermissionsRepositoryExtended>(_procExecutor);
            _abpUserRolesRepo = MockRepository.GeneratePartialMock<AbpUserRolesRepositoryExtended>(_procExecutor);
            _abpRolesManager = MockRepository.GeneratePartialMock<AbpRolesManager>(_abpRolesRepo, _abpPermissionsRepo, _abpUserRolesRepo);
            _abpRolesService = MockRepository.GeneratePartialMock<RolesAppService>(_abpRolesManager);
        }
        [TearDown]
        public void ClassEndCleanup()
        {

        }

        [Test]
        public async Task Should_Return_ALL_Roles_When_Permission_Empty()
        {
            //Arrange
            _abpRolesService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId()).Repeat.Once();
            _abpRolesService.Stub(x => x.GetLoggedUserId()).Return(AbpSession.GetUserId()).Repeat.Once();

            PermissionFilterInputDto searchInput = new PermissionFilterInputDto
            {
                FilteredPermissionName = string.Empty
            };
            //Act
            var roles = await _abpRolesService.GetRolesByPermission(searchInput);

            //Assert
            roles.Count.ShouldBe(2);
        }

        [Test]
        public async Task Should_Return_Roles_FilteredBy_Permission()
        {
            //Arrange
            _abpRolesService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId()).Repeat.Once();
            _abpRolesService.Stub(x => x.GetLoggedUserId()).Return(AbpSession.GetUserId()).Repeat.Once();

            PermissionFilterInputDto searchInput = new PermissionFilterInputDto
            {
                FilteredPermissionName = "Permission0"
            };
            //Act
            var roles = await _abpRolesService.GetRolesByPermission(searchInput);
            //Assert
            roles.Count.ShouldBe(1);
        }

        [Test]
        public async Task Should_Return_ALL_Permissions_When_Role_Is_Empty()
        {
            //Arrange
            _abpRolesService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId()).Repeat.Once();
            _abpRolesService.Stub(x => x.GetLoggedUserId()).Return(AbpSession.GetUserId()).Repeat.Once();

            RoleFilterInputDto searchInput = new RoleFilterInputDto
            {
                FilteredRoleId = 0
            };
            //Act
            var roles = await _abpRolesService.GetPermissionByRole(searchInput);

            //Assert
            roles.Count.ShouldBe(2);
        }

        [Test]
        [TestCase(1, 1)]
        [TestCase(2, 1)]
        [TestCase(3, 0)]
        public async Task Should_Return_Permissions_FilteredBy_Role(int roleId, int expectedCount)
        {
            //Arrange
            _abpRolesService.Stub(x => x.GetTenantId()).Return(AbpSession.GetTenantId()).Repeat.Once();
            _abpRolesService.Stub(x => x.GetLoggedUserId()).Return(AbpSession.GetUserId()).Repeat.Once();

            RoleFilterInputDto searchInput = new RoleFilterInputDto
            {
                FilteredRoleId = roleId
            };
            //Act
            var roles = await _abpRolesService.GetPermissionByRole(searchInput);

            //Assert
            roles.Count.ShouldBe(expectedCount);
        }

        [Test]
        public async Task Should_Update_Roles_Correctly_When_Permission_Removed()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                SessionInfo = new SessionDto()
                {
                    TenantId = 1,
                    LoggedUserId = 1,
                }

            };
            SessionDto session = new SessionDto()
            {
                TenantId = 1

            };

            await _abpRolesManager.CreatePermissionForRoleAsync(
                    new PermissionsResultDto()
                    {
                        IsGranted = true,
                        Name = "NewPermission4"
                    }, roleInput
                    );

            await _abpRolesManager.CreatePermissionForRoleAsync(
                new PermissionsResultDto()
                {
                    IsGranted = true,
                    Name = "NewPermission5"
                }, roleInput
                );



            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 1,
                IsGranted = false,
                Name = "Permission0"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = true,
                Name = "NewPermission4"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 6,
                IsGranted = true,
                Name = "NewPermission5"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(3);
            permissions.Count(x => x.IsGranted == false && x.Name == "Permission0").ShouldBe(1);
            permissions.Count(x => x.IsGranted == true).ShouldBe(2);

        }

        [Test]
        public async Task Should_Update_Roles_Correctly_When_Multiple_Permission_Removed()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1
                }

            };


            await _abpRolesManager.CreatePermissionForRoleAsync(
                            new PermissionsResultDto()
                            {
                                IsGranted = true,
                                Name = "NewPermission4"
                            }, roleInput
                            );

            await _abpRolesManager.CreatePermissionForRoleAsync(
                new PermissionsResultDto()
                {
                    IsGranted = true,
                    Name = "NewPermission5"
                }, roleInput
                );



            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 1,
                IsGranted = false,
                Name = "Permission0"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = false,
                Name = "NewPermission4"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 6,
                IsGranted = true,
                Name = "NewPermission5"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(3);
            permissions.Count(x => x.IsGranted == false && x.Name == "Permission0").ShouldBe(1);
            permissions.Count(x => x.IsGranted == true).ShouldBe(1);
            permissions.Count(x => x.IsGranted == false).ShouldBe(2);

        }


        [Test]
        public async Task Should_Insert_Roles_Correctly_When_Permission_Added()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };



            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 1,
                IsGranted = true,
                Name = "Permission0"
            });

            input.Add(new PermissionsResultDto()
            {
                IsGranted = true,
                Name = "NewPermission4"
            });

            input.Add(new PermissionsResultDto()
            {
                IsGranted = true,
                Name = "NewPermission5"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(3);
            permissions.Count(x => x.IsGranted == true && x.Name == "Permission0").ShouldBe(1);
            permissions.Count(x => x.IsGranted == true).ShouldBe(3);

        }

        [Test]
        public async Task Should_Update_Roles_Correctly_When_Permission_Added()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            _abpPermissionsRepo = Resolve<IAbpPermissionsRepositoryExtended>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };
            var currentpermissions = AbpPermissions.Create("Permission0", false, DateTime.UtcNow, string.Empty, null, 1, null, 1);
            currentpermissions.Id = 1;
            await _abpPermissionsRepo.UpdateAsync(currentpermissions);


            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 1,
                IsGranted = true,
                Name = "Permission0"
            });

            input.Add(new PermissionsResultDto()
            {
                IsGranted = true,
                Name = "NewPermission4"
            });

            input.Add(new PermissionsResultDto()
            {
                IsGranted = true,
                Name = "NewPermission5"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(3);
            permissions.Count(x => x.IsGranted == true && x.Name == "Permission0").ShouldBe(1);
            permissions.Count(x => x.IsGranted == true).ShouldBe(3);

        }

        [Test]
        public async Task Should_Ignore_New_Permissions_Sent_Granted_True()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };

            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 1,
                IsGranted = true,
                Name = "Permission0"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = false,
                Name = "NewPermission4"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 5,
                IsGranted = true,
                Name = "NewPermission5"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(2);
            permissions.Count(x => x.IsGranted == true && x.Name == "Permission0").ShouldBe(1);
            permissions.Count(x => x.IsGranted == true).ShouldBe(2);

        }


        [Test]
        public async Task Should_Update_And_Add_permission_To_Roles_Correctly()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            _abpPermissionsRepo = Resolve<IAbpPermissionsRepositoryExtended>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };


            var currentpermissions = AbpPermissions.Create("Permission4", false, DateTime.UtcNow, string.Empty, null, 1, null, 1);
            await _abpPermissionsRepo.InsertAsync(currentpermissions);
            currentpermissions.Name = "Permission5";
            await _abpPermissionsRepo.InsertAsync(currentpermissions);

            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = false,
                Name = "Permission4"
            });

            input.Add(new PermissionsResultDto()
            {
                Id = 5,
                IsGranted = true,
                Name = "Permission5"
            });

            input.Add(new PermissionsResultDto()
            {
                IsGranted = false,
                Name = "NewPermission6"
            });

            input.Add(new PermissionsResultDto()
            {
                IsGranted = true,
                Name = "NewPermission7"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(4);
            permissions.Count(x => x.IsGranted == true && x.Name == "Permission0").ShouldBe(1);
            permissions.Count(x => x.IsGranted == true && x.Name == "NewPermission7").ShouldBe(1);
            permissions.Count(x => x.Name == "NewPermission6").ShouldBe(0);
            permissions.Count(x => x.IsGranted == false).ShouldBe(1);
            permissions.Count(x => x.IsGranted == true).ShouldBe(3);
        }

        [Test]
        public async Task Should_Update_RoleName_And_Add_permission_To_Roles_Correctly()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            _abpPermissionsRepo = Resolve<IAbpPermissionsRepositoryExtended>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "NewRoleName",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };


            var currentpermissions = AbpPermissions.Create("Permission4", false, DateTime.UtcNow, string.Empty, null, 1, null, 1);
            await _abpPermissionsRepo.InsertAsync(currentpermissions);
            currentpermissions.Name = "Permission5";
            await _abpPermissionsRepo.InsertAsync(currentpermissions);

            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = false,
                Name = "Permission4"
            });

            //Act
            await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  );

            //Assert
            var role = await _abpRolesManager.GetRoleByIdAsync(roleInput);
            role.Name.ShouldBe("NewRoleName");
        }

        [Test]
        public async Task Should_NOT_Update_RoleName_As_DuplciateNAme_Exists_And_Add_permission_To_Roles_Correctly()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            _abpPermissionsRepo = Resolve<IAbpPermissionsRepositoryExtended>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName1",
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };


            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = false,
                Name = "Permission4"
            });

            //Act

            Assert.ThrowsAsync<UserFriendlyException>(
                async () =>
                await _abpRolesService.UpsertPermissionForRole(
                  new DTO.RoleUser.UpsertPermissonsDto()
                  {
                      PermissionInput = input,
                      RoleFilterInput = roleInput
                  }
                  )
                );
            ;
            //Assert
            var role =
                await _abpRolesManager.GetRoleByIdAsync(roleInput);
            var permissions = await _abpRolesManager.GetPermissionByRoleAsync(roleInput);
            permissions.Count.ShouldBe(1);
            permissions.Count(x => x.IsGranted == true && x.Name == "Permission0").ShouldBe(1);


            role.Name.ShouldBe("RoleName0");
        }

        [Test]
        public async Task Should_NotUPdate_RoleTable_As_Data_Not_Dirty()
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpRolesService = Resolve<IRolesAppService>();
            _abpPermissionsRepo = Resolve<IAbpPermissionsRepositoryExtended>();
            _abpRolesRepo = Resolve<IAbpRolesRepositoryExtended>();
            RoleFilterInputDto roleInput = new RoleFilterInputDto
            {
                FilteredRoleId = 1,
                RoleName = "RoleName0",
                IsDefault = false,
                SessionInfo = new SessionDto()
                {
                    LoggedUserId = 1,
                    TenantId = 1

                }
            };


            List<PermissionsResultDto> input = new List<PermissionsResultDto>();
            input.Add(new PermissionsResultDto()
            {
                Id = 4,
                IsGranted = false,
                Name = "Permission4"
            });
            var oldrole =
              await _abpRolesRepo
              .GetByIdAsync(roleInput.FilteredRoleId, roleInput.SessionInfo.TenantId);
            //Act


            await _abpRolesService.UpsertPermissionForRole(
              new DTO.RoleUser.UpsertPermissonsDto()
              {
                  PermissionInput = input,
                  RoleFilterInput = roleInput
              }
              );
            //Assert
            var newrole =
               await _abpRolesRepo
              .GetByIdAsync(roleInput.FilteredRoleId, roleInput.SessionInfo.TenantId);

            oldrole.IsDefault.ShouldBe(newrole.IsDefault);
            oldrole.Name.ShouldBe(newrole.Name);
            oldrole.LastModificationTime.ShouldBe(newrole.LastModificationTime);
            oldrole.LastModifierUserId.ShouldBe(newrole.LastModifierUserId);
            newrole.Name.ShouldBe("RoleName0");
        }

        [Test]
        [TestCase(1, 2)]
        [TestCase(2, 1)]
        [TestCase(3, 0)]
        public async Task Should_Return_ALL_Role_Filtered_By_TenantId(int tenantId, int expectedCount)
        {
            //Arrange
            _abpRolesService.Stub(x => x.GetTenantId()).Return(tenantId);

            //Act
            var roles = await _abpRolesService.GetAllRoles();

            //Assert
            roles.Count.ShouldBe(expectedCount);
        }


        [Test]
        [TestCase(5)]
        public async Task Should_Remove_Roles_Correctly_When_Role_Removed(int targetUserId)
        {
            //Arrange
            _abpRolesManager = Resolve<IAbpRolesManager>();
            _abpUserRolesRepo = Resolve<IAbpUserRolesRepositoryExtended>();
            SessionDto session = new SessionDto()
            {
                LoggedUserId = 1,
                TenantId = 1
            };

            await _abpRolesManager.CreateRoleAddedAsync(
                new AddRoleInputDto()
                {
                    IsGranted = true,
                    RoleId = 3
                }, 5, session);

            await _abpRolesManager.CreateRoleAddedAsync(
                new AddRoleInputDto()
                {
                    IsGranted = true,
                    RoleId = 4
                }, 5, session);

            var input = new EditUserInput()
            {
                SessionInfo = session,
                UserId = targetUserId,
                Roles = new List<int>() { 1, 2, 3, 6 }
            };


            //Act
            await _abpRolesManager.AddRemoveRolesForUserAsync(
        input
                  );

            //Assert
            var roles = await _abpUserRolesRepo.GetByUserIdAsync
                (targetUserId, session.TenantId);

            roles.Count.ShouldBe(4);
            roles.Count(x => x.RoleId == 1 && x.UserId == targetUserId).ShouldBe(1);
            roles.Count(x => x.RoleId == 2 && x.UserId == targetUserId).ShouldBe(1);
            roles.Count(x => x.RoleId == 3 && x.UserId == targetUserId).ShouldBe(1);
            roles.Count(x => x.RoleId == 6 && x.UserId == targetUserId).ShouldBe(1);
        }



    }
}
