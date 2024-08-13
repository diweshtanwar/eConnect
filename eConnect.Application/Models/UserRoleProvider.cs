using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using eConnect.Logic;
using eConnect.DataAccess;
using System.Collections;

namespace eConnect.Application.Models
{
    public class UserRoleProvider : RoleProvider
    {

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }

            set
            {
                throw new NotImplementedException();
            }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }


        string[] UserRole;
        public override string[] GetRolesForUser(string username)
        {

            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                ArrayList teamList = new ArrayList();
                var tblUser = unitOfWork.Userss.Find(d => d.UserName == username).ToArray();
                if (tblUser != null)
                {
                    for (int i = 1; i <= tblUser.Length; i++)
                    {
                        int v = teamList.Add(i);
                        dynamic v1 = v.ToString();
                        UserRole = v1;
                    }
                }
                return UserRole;
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}