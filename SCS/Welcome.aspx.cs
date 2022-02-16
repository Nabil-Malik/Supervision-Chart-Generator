using System;
using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

public partial class Welcome : System.Web.UI.Page
{
    protected string Enter;
    private static String connection_string = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\SCS\SCS\App_Data\Supervision.mdf;Integrated Security=True";
    SqlConnection con;
    List<DateTime> date = new List<DateTime>();
    public static List<DateTime> list = new List<DateTime>();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        Enter = "Enter all Details";
        this.DataBind();
            
    }

    
    
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        if (list.Contains(Calendar1.SelectedDate))
        {
            list.Remove(Calendar1.SelectedDate);
        }
        else
        {
            list.Add(Calendar1.SelectedDate);
        }
        Session["dates"] = list;
        foreach(DateTime a in list)
        {
            displaydates.Text += a.ToShortDateString()+ "<br>&nbsp;&nbsp;&nbsp;&nbsp;";
        }
        
    }

    
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date <= DateTime.Now)
        {
            e.Cell.BackColor = ColorTranslator.FromHtml("#a9a9a9");
            e.Day.IsSelectable = false;
        }
        
    }
    public List<String> printSubsets(char []set)
    {
        int n = set.Length;
        List<String> subsets = new List<String>();
        for (int i = 0; i < (1 << n); i++)
        {
            String current = "";
            for (int j = 0; j < n; j++)
                if ((i & (1 << j)) > 0)
                {
                    current += set[j];
                }
            if (current.Length <= 3)
            {
                subsets.Add(current.PadRight(3,'f'));
            }
        }
        return subsets;
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        List<String> days = new List<string>();
        List<String> classes = new List<string>();
        List<String> semesters = new List<string>();
       
        bool flag = true;
        String time="";
        if (Session["dates"] == null)
        {
            Response.Write(@"<script language='javascript'>alert('Please Select Date')</script>");
            Session["dates"] = null;
            list.Clear();
            flag = false;
        }
        else
        {
            date= (List<DateTime>)Session["dates"];
            Session["dates"] = null;
            //list.Clear();
        }
        if (duration.SelectedItem.Value != null)
        {
            time = duration.SelectedItem.Value.ToString();
        }       
        foreach (ListItem item in CheckBoxList1.Items)
        {
            if (item.Selected)
            {
                classes.Add(item.Value.ToString());
            }
        }
        foreach (ListItem item in CheckBoxList2.Items)
        {
            if (item.Selected)
            {
                classes.Add(item.Value.ToString());
            }
        }
        foreach (ListItem item in CheckBoxList3.Items)
        {
            if (item.Selected)
            {
                classes.Add(item.Value.ToString());
            }
        }
        foreach (ListItem item in semester.Items)
        {
            if (item.Selected)
            {
                semesters.Add(item.Value.ToString());
            }
        }
        if (semesters.Any() != true)
        {
            Response.Write(@"<script language='javascript'>alert('Please Select Semesters')</script>");
            flag = false;
        }
        if (classes.Any() != true)
        {
            Response.Write(@"<script language='javascript'>alert('Please Select Classes')</script>");
            flag = false;
        }
        if(flag==true)
        {
            List<String> freefaculties = new List<string>();
            List<String> leastcountfaculties = new List<string>();
            List<String> selectedfaculties = new List<string>();
            Dictionary<DateTime,List<String>> chart = new Dictionary<DateTime, List<String>>();
            String substr = "";
            if (time=="1")
            {
                Session["t"] = "9:00 to 10:30";
                substr = "SUBSTRING(sem,1,3)";
                Response.Write(substr);
            }
            else if (time == "2")
            {
                Session["t"] = "1:30 to 3:30";
                substr = "SUBSTRING(sem,4,3)";
                Response.Write(substr);
            }
            else if (time == "3")
            {
                Session["t"] = "9:00 to 12:00";
                substr = "SUBSTRING(sem,7,3)";
                Response.Write(substr);
            }
            String seme = "";
            foreach(String s in semesters)
            {
                seme += s;
            }
            Response.Write(seme);
            date.Sort();
            foreach (DateTime a in date)
            {
                days.Add(a.ToString("dddd"));
            }
            foreach (String s in classes)
            {
                Response.Write(s);
            }
            String query = "";
            String connectionstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\SCS\SCS\App_Data\Supervision.mdf;Integrated Security=True";
            SqlConnection con = new SqlConnection(connectionstring);
            SqlCommand cmd;
            con.Open();
            int temp = 0;
            foreach (String d in days)
            {
               
                int did = 0;
                query = "select Did from WeekDays where Day='"+d+"'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    did = dr.GetInt32(0);
                    Response.Write("Fetched");
                }
                dr.Close();
                query = "select Fname from Faculty where Fid in (select Fid from FacultyAllocation where Did=" + did + " and (";
                int flage = 0;
                foreach (String sem in printSubsets(seme.ToCharArray()))
                {
                    if (flage == 0)
                    {
                        query += substr + "='" + sem + "' ";
                        flage = 1;
                    }
                    else
                        query += "or " + substr + "='" + sem + "' ";
                }
                query += ")) order by Priority";
                Response.Write(query);
                cmd = new SqlCommand(query, con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    freefaculties.Add(dr.GetString(0));
                    
                }
                dr.Close();
                foreach (String a in freefaculties)
                {
                    Response.Write(a+"<br>");
                }
                query = " select Fname from countmanagement,Faculty where countmanagement.Fid=Faculty.Fid order by Count;";
                cmd = new SqlCommand(query, con);
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    leastcountfaculties.Add(dr.GetString(0));

                }
                dr.Close();
                foreach (String a in leastcountfaculties)
                {
                    Response.Write(a+"<br>");
                }

                int nocount = classes.Count;
                foreach(String a in leastcountfaculties)
                {
                    if (freefaculties.Contains(a) && nocount != 0)
                    {
                                   Response.Write("Free Faculty: " + a + "<br>");
                                   selectedfaculties.Add(a);
                        query = "update countmanagement set Count=Count+1,TotalCount=TotalCount+1 where Fid =(select Fid from Faculty where Fname='" + a + "')";
                        cmd = new SqlCommand(query, con);
                        int rese = cmd.ExecuteNonQuery();
                                   Response.Write(query + "<br>");
                        nocount--;
                    }
                }
                for (int i = selectedfaculties.Count; i < classes.Count; i++)
                {
                    selectedfaculties.Add("NA");
                }
                foreach (String a in selectedfaculties)
                {
                    Response.Write("This is selected:" + a + "<br>");
                }
                    
                chart.Add(date.ElementAt(temp), new List<String>(selectedfaculties));
                selectedfaculties.Clear();
                leastcountfaculties.Clear();
                freefaculties.Clear();
                temp++;
               
            }

            
            query = "update countmanagement set Count=0;";
            cmd = new SqlCommand(query, con);
            int res = cmd.ExecuteNonQuery();
            Session["chart"] = chart;
            Session["semester"] = semesters;
            Session["class"] = classes;
            Response.Write(Session["t"].ToString());
            //Session["timings"] = duration;
            Session["page"] = "Welcome.aspx";
           Response.Redirect("Chart.aspx");
            con.Close();
        }




        //  String[] classes = CheckBoxList1.
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
}