using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DoAnCLinh
{
    public partial class Dirty_Read_TH2 : Form
    {
        public Dirty_Read_TH2()
        {
            InitializeComponent();
        }
        string strConnect = @"Data Source=DESKTOP-7O9O0JV\SQLEXPRESS;Initial Catalog=QuanLyNha;Integrated Security=True";
        SqlConnection sqlCon = null;
        int id;
        public void LoadData()
        {
            sqlCon = new SqlConnection(strConnect);
            sqlCon.Open();

            string sqlSelect = "SELECT * FROM Nha";
            SqlCommand cmd = new SqlCommand(sqlSelect, sqlCon);
            SqlDataReader dr = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(dr);
            dataGridView1.DataSource = dt;


            sqlCon.Close();
        }
        private void Dirty_Read_TH2_Load(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void buttonData_Click(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void buttonDoiGiaTien_Click(object sender, EventArgs e)
        {
            if(this.id > 0)
            {
                if (MessageBox.Show("Ban muon xoa doi tuong nay?", "Message", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
                        == DialogResult.Yes)
                {
                    sqlCon = new SqlConnection(strConnect);
                    sqlCon.Open();

                    // 
                    SqlCommand cmd = new SqlCommand("T21", sqlCon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = this.id;
                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    MessageBox.Show("Thao tac thanh cong");
                    this.LoadData();
                }
                    
            }
            else
            {
                MessageBox.Show("Chua chon doi tuong");
            }
            
        }

        private void buttoncheck_Click(object sender, EventArgs e)
        {
            sqlCon = new SqlConnection(strConnect);
            sqlCon.Open();

            SqlCommand cmd = new SqlCommand("T22_fix", sqlCon);
            cmd.CommandTimeout = 0;

            cmd.CommandType = CommandType.StoredProcedure;
            
            cmd.Parameters.Add("@c", SqlDbType.Bit).Direction = ParameterDirection.ReturnValue;

            cmd.ExecuteNonQuery();

            MessageBox.Show("So nha la: " + cmd.Parameters["@c"].Value);


            sqlCon.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            this.id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["ID"].FormattedValue.ToString());
        }
    }
}
