using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace Project_File_Server
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usernameLoggedIn = string.Empty;
            string userAccess = string.Empty;

            HttpCookie reqCookies = Request.Cookies["nefscookie"];
            if (reqCookies != null)
            {
                usernameLoggedIn = reqCookies["UserName"].ToString();
                userAccess = reqCookies["UserAccess"].ToString();
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string enteredUsername = txtUsername.Text;
            string enteredPassword = txtPassword.Text;

            enteredUsername = txtUsername.Text.ToString();


            int userRowIndex = 0;
            int dirRowIndex = 0;

            string userPath = "";
            string readLine;

            string foundUsername = "";
            string foundPass = "";
            string foundAccess = "";

            string[] settingsPath = Directory.GetFiles(Server.MapPath("~/FilesAndFolders/Settings/"));

            foreach (string filePath in settingsPath)
            {
                if(Path.GetFileName(filePath) == "Users.csv")
                {
                    userPath = filePath;
                }
            }

            StreamReader sr = new StreamReader(userPath);
            //Read the first line of text
            readLine = sr.ReadLine();
            //Continue to read until you reach end of file
            List<string> userID = new List<string>();
            List<string> username = new List<string>();
            List<string> userPass = new List<string>();
            List<string> userAccess = new List<string>();


            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine();
                var values = line.Split(',');

                userID.Add(values[0]);
                username.Add(values[1]);
                userPass.Add(values[2]);
                userAccess.Add(values[3]);
            }

           

            foreach(string value in username)
            {

                if (enteredUsername == value)
                {
                    foundUsername = value;

                    if(userPass[userRowIndex] == enteredPassword)
                    {
                        foundPass = userPass[userRowIndex];
                        foundAccess = userAccess[userRowIndex];
                    }
                   
                }

                userRowIndex++;

                if (foundAccess == "1")
                {
                    string foldersPath = Server.MapPath("~/FilesAndFolders/User/" + value);

                    if (!Directory.Exists(foldersPath))
                    {
                        Directory.CreateDirectory(foldersPath);
                    }
                }

                dirRowIndex++;
            }

            sr.Close();



            if (foundUsername != "" && foundPass!="")
            {
                if (Request.Cookies["nefscookie"] != null)
                {
                    Response.Cookies["nefscookie"].Expires = DateTime.Now.AddMilliseconds(1); // add expiry time
                }

                HttpCookie userInfo = new HttpCookie("nefscookie");
                userInfo["UserName"] = foundUsername;
                userInfo["UserAccess"] = foundAccess;
                userInfo.Expires.Add(new TimeSpan(7000, 1, 0));
                Response.Cookies.Add(userInfo);

                //Successfull login
                Response.Redirect("FilesPage.aspx");
            }
            else
            {
                //Failed Login
               
            }
           
        }
    }
}