
namespace DoAnCLinh
{
    partial class Dirty_Read_TH2
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.buttonData = new System.Windows.Forms.Button();
            this.buttoncheck = new System.Windows.Forms.Button();
            this.buttonDoiGiaTien = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // buttonData
            // 
            this.buttonData.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.buttonData.Cursor = System.Windows.Forms.Cursors.Hand;
            this.buttonData.Location = new System.Drawing.Point(724, 78);
            this.buttonData.Name = "buttonData";
            this.buttonData.Size = new System.Drawing.Size(133, 34);
            this.buttonData.TabIndex = 13;
            this.buttonData.Text = "Danh sach nha";
            this.buttonData.UseVisualStyleBackColor = false;
            this.buttonData.Click += new System.EventHandler(this.buttonData_Click);
            // 
            // buttoncheck
            // 
            this.buttoncheck.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(192)))), ((int)(((byte)(255)))));
            this.buttoncheck.Cursor = System.Windows.Forms.Cursors.Hand;
            this.buttoncheck.Location = new System.Drawing.Point(485, 78);
            this.buttoncheck.Name = "buttoncheck";
            this.buttoncheck.Size = new System.Drawing.Size(133, 34);
            this.buttoncheck.TabIndex = 12;
            this.buttoncheck.Text = "So nha";
            this.buttoncheck.UseVisualStyleBackColor = false;
            this.buttoncheck.Click += new System.EventHandler(this.buttoncheck_Click);
            // 
            // buttonDoiGiaTien
            // 
            this.buttonDoiGiaTien.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.buttonDoiGiaTien.Cursor = System.Windows.Forms.Cursors.Hand;
            this.buttonDoiGiaTien.Location = new System.Drawing.Point(238, 78);
            this.buttonDoiGiaTien.Name = "buttonDoiGiaTien";
            this.buttonDoiGiaTien.Size = new System.Drawing.Size(133, 34);
            this.buttonDoiGiaTien.TabIndex = 10;
            this.buttonDoiGiaTien.Text = "Xoa nha";
            this.buttonDoiGiaTien.UseVisualStyleBackColor = false;
            this.buttonDoiGiaTien.Click += new System.EventHandler(this.buttonDoiGiaTien_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Lime;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(487, 140);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(164, 31);
            this.label1.TabIndex = 9;
            this.label1.Text = "Danh sách nhà";
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(97, 178);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 29;
            this.dataGridView1.Size = new System.Drawing.Size(907, 362);
            this.dataGridView1.TabIndex = 8;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // Dirty_Read_TH2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(255)))));
            this.ClientSize = new System.Drawing.Size(1101, 585);
            this.Controls.Add(this.buttonData);
            this.Controls.Add(this.buttoncheck);
            this.Controls.Add(this.buttonDoiGiaTien);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "Dirty_Read_TH2";
            this.Text = "Dirty_Read_TH2";
            this.Load += new System.EventHandler(this.Dirty_Read_TH2_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonData;
        private System.Windows.Forms.Button buttoncheck;
        private System.Windows.Forms.Button buttonDoiGiaTien;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}