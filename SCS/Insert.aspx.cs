using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Insert : System.Web.UI.Page
{
    String query = "";
    public static String connectionstring = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=F:\SCS\SCS\App_Data\Supervision.mdf;Integrated Security=True";
    SqlConnection con = new SqlConnection(connectionstring);
    SqlCommand cmd;
    SqlDataReader rd;
    protected void Page_Load(object sender, EventArgs e)
    {
        


            /*con.Open();
            query = "select Fname from Faculty;";
            cmd = new SqlCommand(query, con);
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Faculty.Items.Add(new ListItem(rd.GetString(0), rd.GetString(0)));
            }
            rd.Close();
            query = "select Day from Weekdays;";
            cmd = new SqlCommand(query, con);
            rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                Day.Items.Add(new ListItem(rd.GetString(0), rd.GetString(0)));
            }
            rd.Close();
            con.Close();
            List<String> sem = new List<String>(new String[] { "f", "1", "3", "5", "7", "9" });
            foreach (String a in sem)
            {
                DropDownList1.Items.Add(new ListItem(a, a));
                DropDownList2.Items.Add(new ListItem(a, a));
                DropDownList3.Items.Add(new ListItem(a, a));
                DropDownList4.Items.Add(new ListItem(a, a));
                DropDownList5.Items.Add(new ListItem(a, a));
                DropDownList6.Items.Add(new ListItem(a, a));
                DropDownList7.Items.Add(new ListItem(a, a));
            }*/
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        con.Open();
        List<String> slot1 = new List<String>(new String[] { DropDownList1.SelectedItem.ToString(), DropDownList2.SelectedItem.ToString(), DropDownList3.SelectedItem.ToString() });
        List<String> slot2 = new List<String>(new String[] { DropDownList4.SelectedItem.ToString(), DropDownList5.SelectedItem.ToString(), "f" });
        List<String> slot3 = new List<String>(new String[] { DropDownList6.SelectedItem.ToString(), DropDownList7.SelectedItem.ToString(), "f" });
        slot1.Sort();
        slot2.Sort();
        slot3.Sort();
        String s1 = "", s2 = "", s3 = "";
        foreach (String s in slot1) s1 += s;
        foreach (String s in slot2) s2 += s;
        foreach (String s in slot3) s3 += s;
        String keyy = s1 + s2 + s3;
        Response.Write(keyy);
        String faculty = Faculty.SelectedItem.ToString();
        String weekday = Day.SelectedItem.ToString();
        if (faculty.Length == 0 || weekday.Length == 0)
        {
            Response.Write(@"<script language='javascript'>alert('Enter all details')</script>");
        }
        else
        {
            try
            {
                query = "select Fid from Faculty where Fname='" + faculty + "'";
                cmd = new SqlCommand(query, con);
                rd = cmd.ExecuteReader();
                rd.Read();
                int fid = rd.GetInt32(0);
                rd.Close();
                Response.Write(fid);
                query = "select Did from WeekDays where Day='" + weekday + "'";
                cmd = new SqlCommand(query, con);
                rd = cmd.ExecuteReader();
                rd.Read();
                int did = rd.GetInt32(0);
                rd.Close();
                Response.Write(did);
                query = "select * from FacultyAllocation where Fid=" + fid + " and Did=" + did + "";
                cmd = new SqlCommand(query, con);
                rd = cmd.ExecuteReader();
                bool flag = true;
                if(rd.HasRows)
                {
                    Response.Write(@"<script language='javascript'>alert('Sorry ! Cant Insert, Record Already Exists')</script>");
                    flag = false;
                }
                rd.Close();
                if(flag==true)
                {
                    query = "insert into FacultyAllocation values(" + fid + "," + did + ",'" + keyy + "')";
                    Response.Write(query);
                    cmd = new SqlCommand(query, con);
                    int i = cmd.ExecuteNonQuery();
                    if (i != 0)
                    {
                        String display = "Record Inserted\\nDetails:-\\nFaculty: " + faculty + "\\nDay: " + weekday + "\\nSemesterKey: " + keyy + "";
                        Response.Write(@"<script language='javascript'>alert('" + display + "')</script>");
                    }

                }
            }

            catch (Exception ex)
            {
                Response.Write(@"<script language='javascript'>alert(" + e + ")</script>");
            }

            Response.Write(keyy);
            con.Close();
        }
    }
}