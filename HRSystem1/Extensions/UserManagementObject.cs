using System;
using System.Collections.Generic;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Web;
using System.DirectoryServices;

namespace HRSystem1.Extensions
{
    public class UserManagementObject
    {
        public UserManagementObject()
        {

        }
        private string userName;
        private string title;
        private string dept;
        private string displayName;
        private string firstName;
        private string lastname;

        public string UserName { get => userName; set => userName = value; }
        public string Title { get => title; set => title = value; }
        public string Dept { get => dept; set => dept = value; }
        public string DisplayName { get => displayName; set => displayName = value; }
        public string FirstName { get => firstName; set => firstName = value; }
        public string Lastname { get => lastname; set => lastname = value; }

        public static string ExtractUserName(string path)
        {
            string[] userPath = path.Split(new char[] { '\\' });
            return userPath[userPath.Length - 1];
        }
        public static string getUserFullName(string loggedInUser)
        {
            string name = "";
            //using (var context = new PrincipalContext(ContextType.Domain))
            //{
            //    var usr = UserPrincipal.FindByIdentity(context, loggedInUser);
            //    if (usr != null)
            //    {
            //        name = usr.DisplayName;
            //    }

            //}

            return name;
        }

        public static string findUser(string username)
        {
            //this works
            string retVal = "";
            string path = "LDAP://DC=social,DC=local";
            string strAccountId = "sarika.ramsaroop";
            //string strPassword = "Ej1m0f0r12345";
            string adServer = "ldap://192.168.3.3";
            //  using (var domainContext = new PrincipalContext(ContextType.Domain, "social.gov.tt", "DC=social,DC=com"))
            using (var domainContext = new PrincipalContext(ContextType.Domain, "social.gov.tt"))
            {
                using (var foundUser = UserPrincipal.FindByIdentity(domainContext, System.DirectoryServices.AccountManagement.IdentityType.SamAccountName, username))
                {
                    if (foundUser != null)
                    {
                        try
                        {
                            DirectoryEntry directoryEntry = foundUser.GetUnderlyingObject() as DirectoryEntry;
                            PropertyCollection props = directoryEntry.Properties;
                            //string strdepartment = directoryEntry.Properties["distinguishedName"].Value.ToString();
                            //string strcompany = directoryEntry.Properties["Email"].Value.ToString();
                            //many details
                            //Console.WriteLine(strcompany);
                            foreach (string propName in props.PropertyNames)
                            {
                                if (directoryEntry.Properties[propName].Value != null)
                                {
                                    if (propName == "distinguishedName")
                                    {
                                        string porpName = directoryEntry.Properties[propName].Value.ToString();
                                        string distinugishedName = string.Empty;
                                        if (!string.IsNullOrEmpty(porpName))
                                        {
                                            string[] arr = porpName.Split(',');
                                            foreach (var word in arr)
                                            {
                                                if (word.Substring(0, 2) == "OU")
                                                {
                                                    string[] arr2 = word.Split('=');
                                                    distinugishedName = arr2[arr2.Length - 1];
                                                    retVal = distinugishedName;
                                                }
                                            }
                                        }
                                        else
                                        {
                                            //throw excception could not find the user dept from ad
                                            throw new Exception("The User " + username + ", does not have a dept associated with them in AD.Please conact the I.T dept");
                                        }
                                        break;
                                    }
                                    // Console.WriteLine(propName + " = " + directoryEntry.Properties[propName].Value.ToString());
                                }
                                else
                                {
                                    //  Console.WriteLine(propName + " = NULL");
                                }
                            }

                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.InnerException.Message);
                            // Console.WriteLine(ex.Message);
                        }
                    }
                }
            }

            return retVal;

        }
        public static List<string> getListOfGroupsThatuserBelongsTo(string username)
        {
            List<string> userGroupsList = new List<string>();
            UserPrincipal user = UserPrincipal.FindByIdentity(new PrincipalContext(ContextType.Domain, "social.gov.tt"), IdentityType.SamAccountName, username);

            if (user.GetGroups() != null)
            {
                foreach (GroupPrincipal group in user.GetGroups())
                {
                    userGroupsList.Add(group.ToString().ToUpper());
                }
            }
            else
            {

            }

            return userGroupsList;

        }
    }
}