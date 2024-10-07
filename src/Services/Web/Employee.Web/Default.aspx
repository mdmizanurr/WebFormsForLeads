<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Async="true" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=20.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .gv-pagination {
            height: 25px;
            width: 25px;
            font-weight: bold;
            margin-left: 5px;
            color: palevioletred;
            font-size: 20px;
        }
    </style>

    <script type="text/javascript">      


        function openModal() {
            $('#basicModal').modal('show');
            document.getElementById("basicModal").style = "background:rgba(30,33,27,75%);opacity:1;";
            document.getElementById("modaldialog").style = "transition:all linear 0.2s;margin-top: 100px;";
        }

        function closeModal() {
            $('#basicModal').modal('hide');
        }

        function confirmationMessage() {
            if (confirm('Are you sure to delete ?')) {
                return true;
            } else {
                return false;
            }
        }

    </script>

    <%--Start--%>
    <br />
    <div class="panel panel-default clearfix">
        <div class="panel-body clearfix">
            <%--INSERT--%>
            <div class="row">
                <div class="col-sm-10 col-md-9 col-sm-offset-1 col-md-offset-1">
                    <fieldset class="new-fieldset">
                        <legend>Employee Add</legend>
                        <div class="row">

                            <%--Col - 1--%>
                            <div class="form-group clearfix">
                                <div class="col-sm-1 col-md-1">
                                    <label>Title:</label>
                                </div>
                                <div class="col-sm-1 col-md-1">
                                    <asp:TextBox runat="server" ID="txtBxTitle" CssClass="form-control" type="text" MaxLength="25"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required"
                                        Display="Dynamic" ControlToValidate="txtBxTitle" ValidationGroup="vgSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-sm-2 col-md-2">
                                    <label>First Name:<span style="color: Red">*</span></label>
                                </div>
                                <div class="col-sm-3 col-md-3">
                                    <asp:TextBox runat="server" ID="txtbxFirstname" CssClass="form-control" type="text" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required"
                                        Display="Dynamic" ControlToValidate="txtbxFirstname" ValidationGroup="vgSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-sm-2 col-md-2">
                                    <label>Last Name:</label>
                                </div>
                                <div class="col-sm-3 col-md-3">
                                    <asp:TextBox runat="server" ID="txtbxLastname" CssClass="form-control" MaxLength="45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required"
                                        Display="Dynamic" ControlToValidate="txtbxLastname" ValidationGroup="vgSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>


                            </div>

                            <%--Col - 2--%>

                            <div class="form-group clearfix">
                                <div class="col-sm-1 col-md-1">
                                    <label>Division:</label>
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <asp:TextBox runat="server" ID="txtbxDivision" CssClass="form-control" MaxLength="25"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required"
                                        Display="Dynamic" ControlToValidate="txtbxDivision" ValidationGroup="vgSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-sm-1 col-md-1">
                                    <label>Building:</label>
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <asp:TextBox runat="server" ID="txtbxBuilding" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required"
                                        Display="Dynamic" ControlToValidate="txtbxBuilding" ValidationGroup="vgSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                                <div class="col-sm-1 col-md-1">
                                    <label>Room:</label>
                                </div>
                                <div class="col-sm-2 col-md-2">
                                    <asp:TextBox runat="server" ID="txtbxRoom" CssClass="form-control" MaxLength="45"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required"
                                        Display="Dynamic" ControlToValidate="txtbxRoom" ValidationGroup="vgSubmit" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>

                            </div>

                            <%--Col - 3--%>
                            <div class="form-group clearfix">
                                <%--SAVE Button--%>

                                <div class="col-sm-3 col-md-3 col-sm-offset-2 col-md-offset-2 ">
                                    <div class="clearfix mrgntp5px">
                                        <asp:Button runat="server" ID="btnSave" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" OnClientClick="SubmitMessage();" ValidationGroup="vgSubmit" />&nbsp;&nbsp;
                                        <asp:Button runat="server" type="reset" ID="btnCancel" Text="Cancel" CssClass="btn btn-danger" OnClick="btnClear_Click" OnClientClick="return ClearField();" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
            <hr />
            <%--GRID VIEW--%>
            <asp:UpdatePanel UpdateMode="Conditional" runat="server" ID="upGrid">
                <ContentTemplate>
                    <div class="table-responsive gv-container clearfix mrgntp-btm5px">
                        <asp:GridView runat="server" ID="empListView" AutoGenerateColumns="False"
                            CssClass="gv-table" AllowPaging="True" PageSize="9" OnPageIndexChanging="gridAll_PageIndexChanging"
                            OnRowDataBound="gridAll_RowDataBound">

                            <Columns>
                                <asp:TemplateField HeaderText="S/N" ItemStyle-Width="30" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex +1 %>
                                        <asp:HiddenField ID="hiddenId" runat="server" Value='<%# Eval("Id") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="First Name" ItemStyle-Width="100" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBinNumber" runat="server" HeaderStyle-CssClass="text-center" Text='<%# Eval("FirstName")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Last Name" ItemStyle-Width="100" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="lastName" runat="server" HeaderStyle-CssClass="text-center" Text='<%# Eval("LastName")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Division" ItemStyle-Width="100" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="divisionId" runat="server" HeaderStyle-CssClass="text-center" Text='<%# Eval("Division")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Building" ItemStyle-Width="100" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="buildingName" runat="server" HeaderStyle-CssClass="text-center" Text='<%# Eval("Building")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Room" ItemStyle-Width="100" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:Label ID="roomName" runat="server" HeaderStyle-CssClass="text-center" Text='<%# Eval("Room")%>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit" HeaderStyle-CssClass="text-center" ItemStyle-Width="30">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnViewModal" CssClass="text-center" runat="server" ImageUrl="~/images/edit.png" AlternateText="View" OnClick="btnViewModal_OnClick" ToolTip="Edit"
                                            CausesValidation="False" CommandName="View" CommandArgument='<%# Eval("Id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete" ItemStyle-Width="40" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/images/delete.png" CommandName="Delete" CssClass="text-center" OnClientClick="return confirmationMessage();"
                                            OnClick="btnDelete_OnClick" AlternateText="Delete" ToolTip="Delete Record" CausesValidation="False"
                                            CommandArgument='<%# Eval("Id")%>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>

                            <PagerStyle HorizontalAlign="Center" />
                            <PagerStyle CssClass="gv-pagination" />

                            <EmptyDataTemplate>
                                <div class="clearfix text-center required">
                                    No Data Found!
                                </div>
                            </EmptyDataTemplate>

                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

    <%--Modal view starts--%>
    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog" id="modaldialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Update Bin Setup</h4>
                </div>
                <%--Modal Body view --%>

                <div class="modal-body">
                    <asp:UpdatePanel UpdateMode="Conditional" runat="server" ID="upanel">
                        <ContentTemplate>

                            <div class="form-horizontal">

                                <%--Ttitle--%>
                                <div class="form-group clearfix">
                                    <div class="col-sm-4 col-md-4 label-bold">
                                        Title:<span style="color: Red">*</span>
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <asp:TextBox runat="server" ID="txtbxUpdtTitle" CssClass="form-control" MaxLength="25"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required" ValidationGroup="modalSubmit"
                                            Display="Dynamic" ControlToValidate="txtbxUpdtTitle" CssClass="required">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <%--First Name--%>
                                <div class="form-group clearfix">
                                    <div class="col-sm-4 col-md-4 label-bold">
                                        First Name:<span style="color: Red">*</span>
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <asp:TextBox runat="server" ID="txtbxUpdtFirstname" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ValidationGroup="modalSubmit"
                                            Display="Dynamic" ControlToValidate="txtbxUpdtFirstname" CssClass="required">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <%--Last Name--%>

                                <div class="form-group clearfix">
                                    <div class="col-sm-4 col-md-4 label-bold">
                                        Last Name:<span style="color: Red">*</span>
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <asp:TextBox runat="server" ID="txtbxUpdtLastname" CssClass="form-control" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ValidationGroup="modalSubmit"
                                            Display="Dynamic" ControlToValidate="txtbxUpdtLastname" CssClass="required">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>

                                <div class="form-group clearfix">
                                    <div class="col-sm-4 col-md-4 label-bold">
                                        <label>Display:</label>
                                    </div>
                                    <div class="col-sm-8 col-md-8">
                                        <%--<asp:TextBox runat="server" ID="txtbxUpdtDisplay" CssClass="form-control"></asp:TextBox>--%>

                                        <div class="clearfix mrgntp5px">
                                            <asp:Button ID="btnUpdate" runat="server" class="btnApprove" CssClass="btn btn-success" ValidationGroup="modalSubmit" OnClick="btnUpdate_Click" Text="Update" UseSubmitBehavior="false" />&nbsp;&nbsp;
                                            <asp:Button ID="btnCancelNew" runat="server" Text="Close" CssClass="btn btn-danger" data-dismiss="modal" />
                                        </div>
                                    </div>
                                </div>


                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>


            </div>
        </div>
    </div>

    <%-- Script --%>
    <script type="text/javascript">

        function SubmitMessage() {

            var titleCheck = document.getElementById('MainContent_txtBxTitle').value;
            var firstNameCheck = document.getElementById('MainContent_txtbxFirstname').value;
            var lastNameCheck = document.getElementById('MainContent_txtbxLastname').value;
            var divisionCheck = document.getElementById('MainContent_txtbxDivision').value;
            var buildingCheck = document.getElementById('MainContent_txtbxBuilding').value;
            var roomCheck = document.getElementById('MainContent_txtbxRoom').value;

            if (titleCheck == '' || firstNameCheck == '' || lastNameCheck == '' || divisionCheck == '' || buildingCheck == '' || roomCheck == '') {
                alert(' Please enter value to required field. ');
                return false;
            }

            return true;
        };

        function ClearField() {

            var titleCheck = document.getElementById('MainContent_txtBxTitle');
            var firstNameCheck = document.getElementById('MainContent_txtbxFirstname');
            var lastNameCheck = document.getElementById('MainContent_txtbxLastname');
            var divisionCheck = document.getElementById('MainContent_txtbxDivision');
            var buildingCheck = document.getElementById('MainContent_txtbxBuilding');
            var roomCheck = document.getElementById('MainContent_txtbxRoom');

            if (titleCheck != '' || firstNameCheck != '' || lastNameCheck != '' || divisionCheck != '' || buildingCheck != '' || roomCheck != '') {
                titleCheck.value = "";
                firstNameCheck.value = "";
                lastNameCheck.value = "";
                divisionCheck.value = "";
                buildingCheck.value = "";
                roomCheck.value = "";

                return false;
            }

        };


    </script>



</asp:Content>

