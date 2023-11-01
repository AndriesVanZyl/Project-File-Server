using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project_File_Server
{
    public partial class FilesPage : System.Web.UI.Page
    {
        private DataSet dtaSet;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            string pathToFollow = PathToFollow();

            string queryStringpath = Request.QueryString["path"];

            if(queryStringpath != null)
            {
                pathToFollow = pathToFollow + "/" + queryStringpath;
            }
            else
            {
                btnAddFile.Attributes.Add("Disabled","true");
                btnAddFile.CssClass = "mb-2 btn btn-block  btn-outline-info";
                dgvFiles.Visible = false;
                lblFiles.Visible = false;
            }

            dgvFilesAndFolders.DataSource = PopulateDGV(pathToFollow,true);
            dgvFilesAndFolders.DataBind();

            dgvFiles.DataSource = PopulateDGV(pathToFollow,false);
            dgvFiles.DataBind();

           
            //folders dgv
            var datagrid = dgvFilesAndFolders;
            StyleDGV(datagrid);
           

            //files dgv
            var fileDatagrid = dgvFiles;
            StyleDGV(fileDatagrid);


            //CreatePurchasersTable(pathToFollow);
            //var customDatagrid = dgvCuston;
            //StyleDGV(customDatagrid);
        }

        private string PathToFollow()
        {
            string username = string.Empty;
            string userAccess = string.Empty;
            string pathToFollow = "";

            HttpCookie reqCookies = Request.Cookies["nefscookie"];
            if (reqCookies != null)
            {
                username = reqCookies["UserName"].ToString();
                userAccess = reqCookies["UserAccess"].ToString();
            }


            if (userAccess == "1")
            {
                pathToFollow = "~/FilesAndFolders/User";
            }
            else
            {
                pathToFollow = "~/FilesAndFolders/User/" + username;
            }

            return pathToFollow;
        }
        private List<ListItem> PopulateDGV(string pathToFollow, bool isFolder)
        {
            if(isFolder==true)
            {

                string[] subdirectoryEntries = Directory.GetDirectories(Server.MapPath(pathToFollow));

                List<ListItem> folders = new List<ListItem>();
                foreach (string filePath in subdirectoryEntries)
                {
                    folders.Add(new ListItem(Path.GetFileName(filePath)));
                }

                return folders;
            }
            else
            {
                string[] paths = Directory.GetFiles(Server.MapPath(pathToFollow));

                List<ListItem> files = new List<ListItem>();
                foreach (string filePath in paths)
                {
                    files.Add(new ListItem(Path.GetFileName(filePath)));
                }

                return files;
            }
            
        }

        protected void dgvFilesAndFolders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int clickedCell = int.Parse(e.CommandArgument.ToString());

            string cellText = dgvFilesAndFolders.Rows[clickedCell].Cells[3].Text;

            btnFolderDeleteConfirm.CommandArgument = cellText;

            if (e.CommandName == "open")
            {
                string url = HttpContext.Current.Request.Url.AbsoluteUri;

                int index = url.LastIndexOf("/");
                if (index >= 0)
                {
                    url = url.Substring(1, index); // or index + 1 to keep slash
                }

                string queryStringpath = Request.QueryString["path"];


                url = "h" + url + "FilesPage.aspx";
                var uriBuilder = new UriBuilder(url);
                var query = HttpUtility.ParseQueryString(uriBuilder.Query);

                if (queryStringpath != null)
                {
                    query["path"] = queryStringpath + "/" + cellText;
                }
                else
                {
                    query["path"] = cellText;
                }


                uriBuilder.Query = query.ToString();
                url = uriBuilder.ToString();

                Response.Redirect(url);
            }

            if(e.CommandName == "deleteFolder")
            {

                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showFolderDeleteModal()", true);
            }
                
        }

        private void DeleteFolder(string foldersPath)
        {
            // Delete all files from the Directory  
            foreach (string filename in Directory.GetFiles(foldersPath))
            {
                File.Delete(filename);
            }
            // Check all child Directories and delete files  
            foreach (string subfolder in Directory.GetDirectories(foldersPath))
            {
                DeleteFolder(subfolder);
            }
            Directory.Delete(foldersPath);
        }



        private void StyleDGV(GridView datagrid)
        {
            try
            {
                datagrid.HeaderRow.TableSection = TableRowSection.TableHeader;
                datagrid.HeaderRow.Attributes.Add("role", "row");

                for (int i = 0; i < datagrid.HeaderRow.Cells.Count; i++)
                {
                    datagrid.HeaderRow.Cells[i].CssClass = "sorting";
                    datagrid.HeaderRow.Cells[i].Attributes.Add("tabindex", "0");
                    datagrid.HeaderRow.Cells[i].Attributes.Add("aria-controls", "expendable-data-table");
                    datagrid.HeaderRow.Cells[i].Attributes.Add("rowspan", "1");
                    datagrid.HeaderRow.Cells[i].Attributes.Add("colspan", "1");
                    datagrid.HeaderRow.Cells[i].Attributes.Add("id", "hr" + i);


                    if (datagrid.HeaderRow.Cells[i].Text.Contains("Description"))
                    {
                        datagrid.HeaderRow.Cells[i].Width = Unit.Percentage(40);
                    }
                    else
                    {
                        datagrid.HeaderRow.Cells[i].Width = Unit.Percentage(10);
                    }
                }

                datagrid.Attributes.Remove("rules");
                datagrid.GridLines = GridLines.None;
                datagrid.Attributes.Add("border", "0");

                //format the table size to be the right size per row
                int fileRows = datagrid.Rows.Count;

                for (int a = 0; a < fileRows; a++)
                {
                    int cols = datagrid.Rows[a].Cells.Count;

                    for (int o = 0; o < cols; o++)
                    {
                        int textLength = datagrid.Rows[a].Cells[o].Text.Length;

                        if (textLength > 20)
                        {
                            datagrid.Rows[a].Cells[o].Text = "<div style=\"overflow:Auto;height:50px \">" + datagrid.Rows[a].Cells[o].Text + "</div>";
                            datagrid.Rows[a].Cells[o].Style.Add("white-space", "normal");
                            datagrid.Rows[a].Cells[o].Style.Add("word-break", "break-all");
                        }
                    }
                }

            }
            catch { }
        }

        protected void btnAddFolder_Click(object sender, EventArgs e)
        {

            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showModal()", true);
        }

        protected void LinkButtonConfirm_Click(object sender, EventArgs e)
        {

            string pathToFollow = PathToFollow();

            string queryStringpath = Request.QueryString["path"];

            if (queryStringpath != null)
            {
                pathToFollow = pathToFollow + "/" + queryStringpath;
            }

            string foldersPath = Server.MapPath(pathToFollow + "/" + txtFolderName.Text);

            if (!Directory.Exists(foldersPath))
            {
                Directory.CreateDirectory(foldersPath);
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["nefscookie"] != null)
            {
                Response.Cookies["nefscookie"].Expires = DateTime.Now.AddMilliseconds(1); // add expiry time
            }

            Response.Redirect("Login.aspx");
        }

        protected void bthAddFile_Click(object sender, EventArgs e)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showFileModal()", true);
        }

        protected void LinkButtonAddFile_Click(object sender, EventArgs e)
        {

            string pathToFollow = PathToFollow();

            string queryStringpath = Request.QueryString["path"];

            if (queryStringpath != null)
            {
                pathToFollow = pathToFollow + "/" + queryStringpath+ "/";
            }

            string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
            fileUpload.PostedFile.SaveAs(Server.MapPath(pathToFollow) + fileName);

            Response.Redirect(Request.RawUrl);
  
        }

        protected void dgvFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int clickedCell = int.Parse(e.CommandArgument.ToString());

            string fileName = dgvFiles.Rows[clickedCell].Cells[3].Text;

            string pathToFollow = PathToFollow();

            string queryStringpath = Request.QueryString["path"];

            if (queryStringpath != null)
            {
                pathToFollow = pathToFollow + "/" + queryStringpath + "/";
            }

            if (e.CommandName == "view")
            {

            }

            if (e.CommandName == "download")
            {
                DownLoadFile(fileName, pathToFollow);
            }

            if (e.CommandName == "deleteFile")
            {
                btnFileDeleteConfirm.CommandArgument = fileName;
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "showFileDeleteModal()", true);
            }

           
        }

        private void DownLoadFile(string fileName, string pathToFollow)
        {
            //.htm, .html: Response.ContentType = "text/HTML"
            //.txt: Response.ContentType = "text/plain"
            //.doc, .rtf, .docx: Response.ContentType = "Application/msword"
            //.xls, .xlsx: Response.ContentType = "Application/x-ms excel"
            //.jpg, .jpeg: Response.ContentType = "image/jpeg"
            //.gif: Response.ContentType = "image/GIF"
            //.pdf: Response.ContentType = "application/pdf"

            var contentType = Response.ContentType;

            string fileType = "";

            if (fileName.Contains(".txt"))
            {
                contentType = "text/plain";
                fileType = ".txt";
            }
            else if(fileName.Contains(".doc") || fileName.Contains(".rtf") || fileName.Contains(".docx"))
            {
                contentType = "Application/msword";

            }
            else if(fileName.Contains(".xls") || fileName.Contains(".xlsx"))
            {
                contentType = "Application/x-ms excel";
            }
            else if (fileName.Contains(".jpg") || fileName.Contains(".jpeg"))
            {
                contentType = "image/jpeg";
            }
            else if (fileName.Contains(".pdf"))
            {
                contentType = "application/pdf";
                fileType = ".pdf";
            }
            else
            {
                Response.Redirect(Request.RawUrl);
            }

            int fileNameLength = fileName.IndexOf("</div>")-fileName.IndexOf(">");

            fileName = fileName.Substring(fileName.IndexOf(">") + 1, fileNameLength-1);

            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.TransmitFile(Server.MapPath(pathToFollow + fileName));
            Response.End();
        }

        protected void btnFolderDeleteConfirm_Click(object sender, EventArgs e)
        {
            string pathToFollow = PathToFollow();

            string queryStringpath = Request.QueryString["path"];

            if (queryStringpath != null)
            {
                pathToFollow = pathToFollow + "/" + queryStringpath;
            }

            string foldersPath = Server.MapPath(pathToFollow + "/" + btnFolderDeleteConfirm.CommandArgument.ToString()); ;

            if (Directory.Exists(foldersPath))
            {
                DeleteFolder(foldersPath);
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btnFileDeleteConfirm_Click(object sender, EventArgs e)
        {
            string pathToFollow = PathToFollow();

            string queryStringpath = Request.QueryString["path"];

            if (queryStringpath != null)
            {
                pathToFollow = pathToFollow + "/" + queryStringpath;
            }

            int fileNameLength = btnFileDeleteConfirm.CommandArgument.IndexOf("</div>") - btnFileDeleteConfirm.CommandArgument.IndexOf(">");

            string fileName = btnFileDeleteConfirm.CommandArgument.Substring(btnFileDeleteConfirm.CommandArgument.IndexOf(">") + 1, fileNameLength - 1);

            string path = Server.MapPath((pathToFollow) + "/" + fileName);
            FileInfo file = new FileInfo(path);
            if (file.Exists)//check file exsit or not  
            {
                file.Delete();
            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string queryStringpath = Request.QueryString["path"];

            string url = HttpContext.Current.Request.Url.AbsoluteUri;

            int urlIndex = url.LastIndexOf("/");
            if (urlIndex >= 0)
            {
                url = url.Substring(1, urlIndex); // or index + 1 to keep slash
            }

            url = "h" + url + "FilesPage.aspx";
            var uriBuilder = new UriBuilder(url);
            var query = HttpUtility.ParseQueryString(uriBuilder.Query);

            try
            {
                int index = queryStringpath.LastIndexOf("/");
                if (index >= 0)
                {
                    queryStringpath = queryStringpath.Substring(0, index);
                    query["path"] = queryStringpath;
                    uriBuilder.Query = query.ToString();
                }
            }
            catch { }
            
           
            url = uriBuilder.ToString();

            Response.Redirect(url);

        }

        private void CreatePurchasersTable(string pathToFollow)

        {

            // Creating a new DataTable.

            DataTable custTable = new DataTable("folders");

            DataColumn dtaColumn;

            DataRow myDataRow;

            // Create id column

            dtaColumn = new DataColumn();
            dtaColumn.DataType = typeof(string);
            dtaColumn.ColumnName = "Type";
            dtaColumn.Caption = "Type";

            custTable.Columns.Add(dtaColumn);


            dtaColumn = new DataColumn();

            dtaColumn.DataType = typeof(String);
            dtaColumn.ColumnName = "Description";
            dtaColumn.Caption = "Description";
            dtaColumn.ReadOnly = false;
            dtaColumn.Unique = false;

            custTable.Columns.Add(dtaColumn);

            dtaSet = new DataSet();

            dtaSet.Tables.Add(custTable);

            string[] subdirectoryEntries = Directory.GetDirectories(Server.MapPath(pathToFollow));

            foreach (string filePath in subdirectoryEntries)
            {
               
                myDataRow = custTable.NewRow();

                myDataRow["Type"] = "Folder";
                myDataRow["Description"] = Path.GetFileName(filePath);

                custTable.Rows.Add(myDataRow);
            }

            dgvCuston.DataSource = dtaSet;
            dgvCuston.DataBind();

        }

        protected void dgvCuston_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}