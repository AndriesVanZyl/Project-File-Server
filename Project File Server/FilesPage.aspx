<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FilesPage.aspx.cs" Inherits="Project_File_Server.FilesPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Namaqua Engineering File Share</title>
     <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="bootstrap/css/style.css" type="text/css">

    <%-- Nosey little fucker arent you :) --%>
    
    <script src="bootstrap/js/jquery.min.js"></script>
    <script src="bootstrap/js/owl.carousel.min.js"></script>
    <script src="bootstrap/js/jquery.slicknav.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/main.js"></script>

    <script type="text/javascript">
        function showModal() {$('#myModal').modal('show');}
        function showFileModal() { $('#myFileModal').modal('show'); }

        function showFileDeleteModal() { $('#myFileDeleteModal').modal('show'); }
        function showFolderDeleteModal() { $('#myFolderDeleteModal').modal('show'); }
    </script> 

</head>
<body>
    <form id="form1" runat="server">
        <header class="header-section">
            <%-- Nosey little fucker arent you :) --%>
        <div class="header__info" style="background-color:#252163">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__info-left">
                            <ul>
                                <li><span class="icon_phone"></span> 027 213 1622</li>
                                <li><span class="fa fa-envelope"></span> dries@namaqua-eng.co.za</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__info-right" >
                            <ul>
                                <li><a href="#"><asp:Button runat="server" ID="btnLogin" OnClick="btnLogin_Click" CssClass="site-btn sign-up" Text="LOGOUT" Font-Size="10px"/></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </header>
            <section id="learnmore" class="services-section spad" style="background-color:white">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h3>Files and Folders</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="container">
            <table class="table">
                <tr>
                    <td>
                        <asp:Button ID="btnAddFolder" class="mb-2 btn btn-block  btn-outline-info" runat="server" Text="Add New Folder" CausesValidation="false" OnClick="btnAddFolder_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnAddFile" class="mb-2 btn btn-block  btn-outline-info" runat="server" Text="Add New File" CausesValidation="false" OnClick="bthAddFile_Click" />
                    </td>
                </tr>
            </table>
			
                    <div><asp:Button runat="server" ID="btnBack" OnClick="btnBack_Click" CssClass="site-btn sign-up" Text="Back" Font-Size="10px"/></div>
		</div>
        <div class="container">
            <div class="section-title" style="margin-bottom:5px">
                        <h4>Folders</h4>
                    </div>
            <asp:GridView ID="dgvFilesAndFolders" class="table" style="width:100%" role="grid" aria-describedby="expendable-data-table_info" runat="server" OnRowCommand="dgvFilesAndFolders_RowCommand" Width="100%">
				<Columns>
					<asp:TemplateField>
						<ItemTemplate>
                            <div>
					            <div class="dropdown d-inline-block widget-dropdown">
						            <asp:LinkButton ID="btnOpen" class="mb-1 btn btn-block  btn-outline-info" runat="server" Text="Open" CausesValidation="false" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="open" />

                                    <asp:LinkButton ID="btnFolderDelete" class="mb-1 btn btn-block  btn-outline-danger" runat="server"  
											            Text="Delete" CausesValidation="false"
											            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="deleteFolder" />

					            </div>
				            </div>
						</ItemTemplate> 
					</asp:TemplateField>

				</Columns>
			</asp:GridView>

          <div class="section-title" style="margin-bottom:5px">
                        <h4>Custom Table</h4>
                    </div>

            <<asp:GridView ID="dgvCuston" class="table" style="width:100%" role="grid" aria-describedby="expendable-data-table_info" runat="server" OnRowCommand="dgvCuston_RowCommand" Width="100%">
				<Columns>
					<asp:TemplateField>
						<ItemTemplate>
                            <div>
					            <div class="dropdown d-inline-block ">
						            <asp:LinkButton ID="btnCustomOpen" class="mb-1 btn btn-block  btn-outline-info" runat="server" Text="Open" CausesValidation="false" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="open" />
					            </div>
				            </div>
						</ItemTemplate> 
					</asp:TemplateField>
                     <asp:TemplateField>
						<ItemTemplate >
                            <div >
					            
					            <div class="dropdown d-inline-block ">
                                    <asp:LinkButton ID="btnCustomDelete" class="mb-1 btn btn-block  btn-outline-danger" runat="server"  
											            Text="Delete" CausesValidation="false"
											            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="deleteFolder" />
					            </div>
				            </div>
						</ItemTemplate> 
					</asp:TemplateField>
                    <asp:TemplateField>
						<ItemTemplate>
                            <div>

                                <div class="d-inline-block ">
                                    <asp:LinkButton ID="btnCustomDownload" class="mb-1 btn btn-block  btn-outline-success" runat="server"  
											            Text="Get" CausesValidation="false"
											            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="downloadFolder" />

					            </div>
				            </div>
						</ItemTemplate> 
					</asp:TemplateField>
				</Columns>
			</asp:GridView>


            <div class="section-title" style="margin-bottom:5px">
                        <h4 id="lblFiles" runat="server">Files</h4>
                    </div>
            <asp:GridView ID="dgvFiles" class="table display nowrap dataTable no-footer" style="width:100%" role="grid" aria-describedby="expendable-data-table_info" runat="server" OnRowCommand="dgvFiles_RowCommand" Width="100%">
				<Columns>
					<asp:TemplateField>
						<ItemTemplate>
                            <div>
					            <div class="dropdown d-inline-block widget-dropdown">
                                     
                                         <asp:LinkButton ID="btnView" class="mb-1 btn btn-block  btn-outline-info" runat="server"  
											            Text="View" CausesValidation="false"
											            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="view" />

                                    <asp:LinkButton ID="btnDownload" class="mb-1 btn btn-block  btn-outline-info" runat="server"  
											            Text="Download" CausesValidation="false"
											            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="download" />


                                    <asp:LinkButton ID="btnDelete" class="mb-1 btn btn-block  btn-outline-danger" runat="server"  
											            Text="Delete" CausesValidation="false"
											            CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" CommandName="deleteFile" />
						            
					            </div>
				            </div>
						</ItemTemplate> 
					</asp:TemplateField>
				</Columns>
			</asp:GridView>
        </div>
            </div>
        </div>
    </section>
		

        <%-- Folder Modal --%>
		<div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Sure let's add a new folder.</h4>
            </div>
            <div class="modal-body">
                <p>Before we can add the folder please give it a name.</p>
                <asp:TextBox runat="server" ID="txtFolderName" placeholder="Folder Name" ></asp:TextBox>
                
            </div>
            <div class="modal-footer">
                <asp:LinkButton ID="btnModal" class="btn btn-success" runat="server" CommandArgument="" OnClick="LinkButtonConfirm_Click" Text="ADD"  />
                <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>
            </div>
        </div>
        </div>
    </div>

        <%-- File Modal --%>
        <div id="myFileModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Sure, lets add a new file.</h4>
            </div>
            <div class="modal-body">
                <p>Before we can add the file, please show me its location.</p>
                <asp:FileUpload ID="fileUpload" runat="server"/>
                
            </div>
            <div class="modal-footer">
                <asp:LinkButton ID="LinkButtonAddFile" class="btn btn-success" runat="server" CommandArgument="" OnClick="LinkButtonAddFile_Click" Text="ADD"  />
                <button type="button" class="btn btn-danger" data-dismiss="modal">CANCEL</button>
            </div>
        </div>
        </div>
    </div>

         <%-- FileDelete Modal --%>
        <div id="myFileDeleteModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Deleting a file?</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this file?</p>
                <p>Deleting it is permanent and CAN NOT be undone.</p>
                
            </div>
            <div class="modal-footer">
                <asp:LinkButton ID="btnFileDeleteConfirm" class="btn btn-success" runat="server" CommandArgument="" OnClick="btnFileDeleteConfirm_Click" Text="Delete"  />
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
        </div>
    </div>

        <%-- Folder Delete Modal --%>
         <div id="myFolderDeleteModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title">Deleting a ... FOLDER?</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete this folder?</p>
                <p>Deleting it is permanent and CAN NOT be undone.</p>
                <p>All of its folders and files will also be deleted.</p>
                
            </div>
            <div class="modal-footer">
                <asp:LinkButton ID="btnFolderDeleteConfirm" class="btn btn-success" runat="server" CommandArgument="" OnClick="btnFolderDeleteConfirm_Click" Text="Delete"  />
                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
            </div>
        </div>
        </div>
    </div>

    </form>
    
</body>
</html>
