using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Excel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        Dictionary<DateTime, List<String>> chart = (Dictionary<DateTime, List<String>>)Session["chart"];
        List<String> semesters = (List<String>)Session["semester"];
        List<String> classes = (List<String>)Session["class"];
        String timings = (String)Session["t"];
        String sem = "Semesters: ";
        foreach (String a in semesters)
        {
            sem+= " " + a;
        }
        DataTable workTable = new DataTable();
        workTable.Clear();
        workTable.Columns.Add("Supervision Chart");
        foreach (String a in classes)
        {
            workTable.Columns.Add(a);
        }
        foreach (KeyValuePair<DateTime, List<String>> pair in chart)
        {
            DataRow workRow = workTable.NewRow();
            workRow["Supervision Chart"] = pair.Key.ToShortDateString() + " (" + pair.Key.ToString("dddd") + ") "+timings;
            int i = 0;
            foreach (String value in pair.Value)
            {
                workRow[classes.ElementAt(i)] = value.ToString();
                i++;
            }
            workTable.Rows.Add(workRow);
        }
        DataRow wR = workTable.NewRow();
        wR[0] = sem;
        workTable.Rows.Add(wR);
        GridView1.DataSource = workTable;
        GridView1.DataBind();
    }
}