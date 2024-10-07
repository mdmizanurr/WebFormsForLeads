using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{

    private readonly string apiUrl = "https://localhost:7039/";
    private HttpResponseMessage response;
    private readonly HttpClient client = new HttpClient();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAllEmployee();
        }

    }


    protected void LoadAllEmployee()
    {
        List<EmpDTO> empList = new List<EmpDTO>();
        var url = apiUrl + ApiAddress.AllEmployees;
        response = client.GetAsync(url).Result;

        if (response.IsSuccessStatusCode)
        {
            empList = JsonConvert.DeserializeObject<List<EmpDTO>>(response.Content.ReadAsStringAsync().Result);
            empListView.DataSource = empList;
            empListView.DataBind();
        }

    }


    // Insert 
    protected async void btnSave_Click(object sender, EventArgs e)
    {
        EmpCreate model = new EmpCreate();

        model.Title = txtBxTitle.Text.Trim();
        model.FirstName = txtbxFirstname.Text.Trim();
        model.LastName = txtbxLastname.Text.Trim();
        model.Division = txtbxDivision.Text.Trim();
        model.Building = txtbxBuilding.Text.Trim();
        model.Room = txtbxRoom.Text.Trim();
        model.IsActive = "Yes";

        if (model == null)
        {
            ScriptManager.RegisterStartupScript(Page, typeof(Page), "ClientScript", "alert('');", true);
        }

        response = await client.PostAsJsonAsync(apiUrl + ApiAddress.AddEmployees, model);
        LoadAllEmployee();

    }


    // Clear Field 
    protected void btnClear_Click(object sender, EventArgs e)
    {

    }


    protected void gridAll_RowDataBound(object sender, GridViewRowEventArgs e)
    { }

    // Page Index Change
    protected void gridAll_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        empListView.PageIndex = e.NewPageIndex;
        LoadAllEmployee();
    }


    // Update 
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

    }

    // Delete 

    protected void btnDelete_OnClick(object sender, EventArgs e)
    {

    }

    // Confirmation
    protected void confirmationMessage()
    {

    }


    // Modal
    protected async void btnViewModal_OnClick(object sender, EventArgs e)
    {
        EmpDTO model = new EmpDTO();
        int id = Convert.ToInt32(((ImageButton)sender).CommandArgument);

        response = await client.GetAsync(apiUrl + ApiAddress.EmployeeEdit + id);

        if (response.IsSuccessStatusCode)
        {
            model = response.Content.ReadAsAsync<EmpDTO>().Result;
        }

        var title = model.Title;
        var firstName = model.FirstName;
        var lastName = model.LastName;

        txtbxUpdtTitle.Text = title;
        txtbxUpdtFirstname.Text = firstName;
        txtbxUpdtLastname.Text = lastName;

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);


        upanel.Update();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}