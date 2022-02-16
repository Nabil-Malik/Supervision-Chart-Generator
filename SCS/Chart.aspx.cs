using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chart : System.Web.UI.Page
{
    protected string Chartmanual;
    protected void Page_Load(object sender, EventArgs e)
    {

        Chartmanual = "<table><tr><td>Nabil</td><td>Malik</td></tr><tr><td>Anas</td><td>Ansari</td></tr></table>";
        this.DataBind();


        List<String> abc;
        if (Convert.ToString(Session["page"]).Equals("Welcome.aspx"))
        {
            Dictionary<DateTime, List<String>> chart = (Dictionary<DateTime, List<String>>)Session["chart"];
            List<String> semesters = (List<String>)Session["semester"];
            List<String> classes = (List<String>)Session["class"];
            String timings = (String)Session["t"];
            Label2.Text = "Semesters: ";
            foreach (String a in semesters)
            {
                Label2.Text += " " + a;
            }
            DataTable workTable = new DataTable();
            workTable.Clear();
            workTable.Columns.Add("*");
            foreach (String a in classes)
            {
                workTable.Columns.Add(a);
            }
            foreach (KeyValuePair<DateTime, List<String>> pair in chart)
            {
                DataRow workRow = workTable.NewRow();
                workRow["*"] = pair.Key.ToShortDateString()+" (" +pair.Key.ToString("dddd")+") "+timings;
                int i = 0;
                foreach (String value in pair.Value)
                {
                    workRow[classes.ElementAt(i)]= value.ToString();
                    i++;
                }
                workTable.Rows.Add(workRow);
            }
           // DataRow wR = workTable.NewRow();
           // wR[0] = Label2.Text.ToString();
           // workTable.Rows.Add(wR);
            GridView1.DataSource = workTable;
            GridView1.DataBind();
            DetailsView1.DataSource = workTable;
            DetailsView1.DataBind();
            FormView1.DataSource = workTable;
            FormView1.DataBind();
            //ListView1.DataSource = workTable;
            //ListView1.DataBind();

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        List<String> classes = (List<String>)Session["class"];
       
        GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
        TableHeaderCell cell = new TableHeaderCell();
        cell.Text = "Supervision chart";
        cell.ColumnSpan = classes.Count+1;
        row.Controls.Add(cell);
        
        row.BackColor = ColorTranslator.FromHtml("#3AC0F2");
        GridView1.HeaderRow.Parent.Controls.AddAt(0, row);
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("Excel.aspx");
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
       
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Response.Redirect("Login.aspx");
    }
}