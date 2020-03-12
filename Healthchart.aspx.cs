﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class Healthchart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Bind Gridview  
        BindGvData();

        // Bind Charts  
        BindChart();
    }



    private void BindGvData()
    {
        grdview.DataSource = GetChartData();
        grdview.DataBind();
    }

    private void BindChart()
    {
        string dt = DateTime.Now.ToString("dd-MMM-yyyy");
        DataTable dsChartData = new DataTable();
        StringBuilder strScript = new StringBuilder();

        try
        {
            dsChartData = GetChartData();

            if (dsChartData != null && dsChartData.Rows.Count > 0)
            {
                strScript.Append(@"<script type='text/javascript'>  
                    google.load('visualization', '1', {packages: ['corechart']});</script>  
  
                    <script type='text/javascript'>  
                    function drawVisualization() {         
                    var data = google.visualization.arrayToDataTable([  
                    ['Health Watch', 'Male', 'Female'],");

                foreach (DataRow row in dsChartData.Rows)
                {
                    strScript.Append("['" + row["Health Watch"] + "'," + row["M"] + "," +
                        row["F"] + "],");
                }
                strScript.Remove(strScript.Length - 1, 1);
                strScript.Append("]);");

                strScript.Append("var options = { title : 'Health Watch Chart as of " + dt + " ', vAxis: {title: 'Count'},   hAxis: {title: 'Health Watch'}, seriesType: 'bars', series: {3: {type: 'area'}} };");
                strScript.Append(" var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));  chart.draw(data, options); } google.setOnLoadCallback(drawVisualization);");
                strScript.Append(" </script>");

                ltrscr.Text = strScript.ToString();
            }
            else { ltrscr.Text = "No such data Exists!..."; }
            
        }
        catch
        {
        }
        finally
        {
            dsChartData.Dispose();
            strScript.Clear();
        }
    }

    private DataTable GetChartData()
    {
        DataSet dsData = new DataSet();
        try
        {
            SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
            SqlDataAdapter sqlCmd = new SqlDataAdapter("chart_Health_Watch", sqlCon);
            sqlCmd.SelectCommand.CommandType = CommandType.StoredProcedure;

            sqlCon.Open();

            sqlCmd.Fill(dsData);

            sqlCon.Close();
        }
        catch(Exception ex)
        {
            WebMsgBox.Show(ex.Message);
        }
        return dsData.Tables[0];
    }
}