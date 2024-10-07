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

    // LOAD Emp
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

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "ClearField();", true);


    }


    // Clear Field 
    protected void btnClear_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
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
    protected async void btnUpdate_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(txtbxUpdtId.Text);
        EmpDTO model = new EmpDTO();
        response = await client.GetAsync(apiUrl + ApiAddress.EmployeeEdit + id);

        if (response.IsSuccessStatusCode)
        {
            model = response.Content.ReadAsAsync<EmpDTO>().Result;
        }

        model.Title = txtbxUpdtTitle.Text;
        model.FirstName = txtbxUpdtFirstname.Text;
        model.LastName = txtbxUpdtLastname.Text;
        model.Division = txtbxUpdtDivison.Text;
        model.Building = txtbxUpdtBuilding.Text;
        model.Room = txtbxUpdtRoom.Text;
        response = await client.PutAsJsonAsync(apiUrl + ApiAddress.EmployeeEdit + id, model);

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
        LoadAllEmployee();
        upanel.Update();
        upGrid.Update();
    }

    // Delete 

    protected async void btnDelete_OnClick(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(((ImageButton)sender).CommandArgument);

        EmpDTO model = new EmpDTO();
        response = await client.GetAsync(apiUrl + ApiAddress.EmployeeEdit + id);

        if (response.IsSuccessStatusCode)
        {
            model = response.Content.ReadAsAsync<EmpDTO>().Result;
        }

        model.IsActive = "No";
        response = await client.PutAsJsonAsync(apiUrl + ApiAddress.EmployeeEdit + id, model);
        LoadAllEmployee();
        upanel.Update();
        upGrid.Update();



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

        response = await client.GetAsync(apiUrl + ApiAddress.EmployeeGetById + id);

        if (response.IsSuccessStatusCode)
        {
            model = response.Content.ReadAsAsync<EmpDTO>().Result;
        }

        var title = model.Title;
        var firstName = model.FirstName;
        var lastName = model.LastName;
        var division = model.Division;
        var building = model.Building;
        var room = model.Room;

        txtbxUpdtTitle.Text = title;
        txtbxUpdtFirstname.Text = firstName;
        txtbxUpdtLastname.Text = lastName;
        txtbxUpdtDivison.Text = division;
        txtbxUpdtBuilding.Text = building;
        txtbxUpdtRoom.Text = room;
        txtbxUpdtId.Text = id.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
        upanel.Update();
    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}