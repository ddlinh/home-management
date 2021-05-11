using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DoAnCLinh
{
    public partial class Form1 : Form
    {
        static string STORE_1 = "T11";
        static string STORE_2 = "T12";
        public Form1()
        {
            InitializeComponent();
        }
        string strConnect = @"Data Source=.;Initial Catalog=QuanLyNha;Integrated Security=True";
        SqlConnection sqlCon = null;
        int id;
        string dk = "";
        private void Form1_Load(object sender, EventArgs e)
        {
            this.LoadData();
        }

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
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            this.id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["ID"].FormattedValue.ToString());
            this.dk = dataGridView1.Rows[e.RowIndex].Cells["Dieu_Kien"].FormattedValue.ToString();
        }

        private void buttonData_Click(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void buttonDoiGiaTien_Click(object sender, EventArgs e)
        {
            if(this.id > 0)
            {
                if (txtGia.Text.Length > 0)
                {
                    if (MessageBox.Show("Ban muon cap nhat gia tien?", "Message", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
                        == DialogResult.Yes)
                    {
                        sqlCon = new SqlConnection(strConnect);
                        sqlCon.Open();

                        // 
                        SqlCommand cmd = new SqlCommand(STORE_1, sqlCon);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = this.id;
                        int bonus = 0;
                        if (this.dk.Length > 0)
                        {
                            bonus += 500000;
                        }
                        cmd.Parameters.Add("@GiaMoi", SqlDbType.NVarChar).Value = Convert.ToInt32(txtGia.Text) + bonus;
                        cmd.ExecuteNonQuery();
                        sqlCon.Close();
                        MessageBox.Show("Cap nhat thanh cong");
                        this.LoadData();
                    }
                }
            }
            else
            {
                MessageBox.Show("Ban chua chon doi tuong can thay doi");
            }
            
        }

        private void buttoncheck_Click(object sender, EventArgs e)
        {

            if(this.id > 0)
            {
                sqlCon = new SqlConnection(strConnect);
                sqlCon.Open();

                SqlCommand cmd = new SqlCommand(STORE_2, sqlCon);
                cmd.CommandTimeout = 0;
               
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = this.id;
                cmd.Parameters.Add("@gia", SqlDbType.Bit).Direction = ParameterDirection.ReturnValue;

                cmd.ExecuteNonQuery();

                MessageBox.Show("Gia nha la: " + cmd.Parameters["@gia"].Value);

                
                sqlCon.Close();
            }
            else
            {
                MessageBox.Show("Ban chua chon doi tuong");
            }
        }
    }
}
