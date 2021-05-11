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
    public partial class DirTy_Read_TH3 : Form
    {
        public DirTy_Read_TH3()
        {
            InitializeComponent();
        }
        string strConnect = @"Data Source=DESKTOP-7O9O0JV\SQLEXPRESS;Initial Catalog=QuanLyNha;Integrated Security=True";
        SqlConnection sqlCon = null;
        int id, manv, loai;
        
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
        private void DirTy_Read_TH3_Load(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void buttonData_Click(object sender, EventArgs e)
        {
            this.LoadData();
        }

        private void buttoncheck_Click(object sender, EventArgs e)
        {
            if(this.id > 0)
            {
                sqlCon = new SqlConnection(strConnect);
                sqlCon.Open();

                SqlCommand cmd = new SqlCommand("T32_fix", sqlCon);
                cmd.CommandTimeout = 0;

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@MaNha", SqlDbType.NVarChar).Value = this.id;
                cmd.Parameters.Add("@macsh", SqlDbType.Bit).Direction = ParameterDirection.ReturnValue;

                cmd.ExecuteNonQuery();

                MessageBox.Show("Ma chu so huu la: " + cmd.Parameters["@macsh"].Value);


                sqlCon.Close();
            }
            else
            {
                MessageBox.Show("Ban chua chon doi tuong");
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            this.id = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["ID"].FormattedValue.ToString());
            this.manv = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["Ma_NV"].FormattedValue.ToString());
            this.loai = Convert.ToInt32(dataGridView1.Rows[e.RowIndex].Cells["Ma_Loai"].FormattedValue.ToString());
        }

        private void buttonDoiGiaTien_Click(object sender, EventArgs e)
        {
            if (this.id > 0 && txtmaKH.Text.Length > 0)
            {
                if (MessageBox.Show("Ban muon ban doi tuong nay?", "Message", MessageBoxButtons.YesNo, MessageBoxIcon.Question)
                        == DialogResult.Yes)
                {
                    sqlCon = new SqlConnection(strConnect);
                    sqlCon.Open();

                    // 
                    SqlCommand cmd = new SqlCommand("T31", sqlCon);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@MaNha", SqlDbType.NVarChar).Value = this.id;
                    cmd.Parameters.Add("@MaKH", SqlDbType.NVarChar).Value = Convert.ToInt32(txtmaKH.Text);
                    cmd.Parameters.Add("@MaNV", SqlDbType.NVarChar).Value = this.manv;
                    cmd.Parameters.Add("@loai", SqlDbType.NVarChar).Value = this.loai;

                    cmd.ExecuteNonQuery();
                    sqlCon.Close();
                    MessageBox.Show("Thao tac thanh cong");
                    this.LoadData();
                }

            }
            else
            {
                MessageBox.Show("Chua chon doi tuong hay ma khach hang rong");
            }
        }
    }
}
