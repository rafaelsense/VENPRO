namespace VENPRO
{
    partial class frmcolumnasimport
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
            this.txtnombre = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cbotipo = new System.Windows.Forms.ComboBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txtsize = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtformatopersonalizado = new System.Windows.Forms.TextBox();
            this.cboformato = new System.Windows.Forms.ComboBox();
            this.txtnombrexml = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.btngrabar = new System.Windows.Forms.Button();
            this.btnactualizar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtnombre
            // 
            this.txtnombre.Location = new System.Drawing.Point(82, 19);
            this.txtnombre.Name = "txtnombre";
            this.txtnombre.Size = new System.Drawing.Size(321, 20);
            this.txtnombre.TabIndex = 20;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(14, 22);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 13);
            this.label2.TabIndex = 19;
            this.label2.Text = "Nombre BD";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(40, 74);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(28, 13);
            this.label3.TabIndex = 22;
            this.label3.Text = "Tipo";
            // 
            // cbotipo
            // 
            this.cbotipo.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbotipo.FormattingEnabled = true;
            this.cbotipo.Items.AddRange(new object[] {
            "VarChar",
            "Char",
            "DateTime",
            "Date",
            "Time",
            "Double",
            "Bit",
            "Int",
            "Text"});
            this.cbotipo.Location = new System.Drawing.Point(82, 71);
            this.cbotipo.Name = "cbotipo";
            this.cbotipo.Size = new System.Drawing.Size(121, 21);
            this.cbotipo.TabIndex = 24;
            this.cbotipo.SelectedIndexChanged += new System.EventHandler(this.cbotipo_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(25, 127);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(45, 13);
            this.label4.TabIndex = 21;
            this.label4.Text = "Formato";
            // 
            // txtsize
            // 
            this.txtsize.Location = new System.Drawing.Point(82, 98);
            this.txtsize.Name = "txtsize";
            this.txtsize.ReadOnly = true;
            this.txtsize.Size = new System.Drawing.Size(53, 20);
            this.txtsize.TabIndex = 26;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(41, 101);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(27, 13);
            this.label1.TabIndex = 25;
            this.label1.Text = "Size";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtformatopersonalizado);
            this.groupBox1.Controls.Add(this.cboformato);
            this.groupBox1.Controls.Add(this.txtnombrexml);
            this.groupBox1.Controls.Add(this.txtnombre);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.cbotipo);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtsize);
            this.groupBox1.Location = new System.Drawing.Point(8, 9);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(409, 162);
            this.groupBox1.TabIndex = 27;
            this.groupBox1.TabStop = false;
            // 
            // txtformatopersonalizado
            // 
            this.txtformatopersonalizado.Location = new System.Drawing.Point(209, 125);
            this.txtformatopersonalizado.Name = "txtformatopersonalizado";
            this.txtformatopersonalizado.Size = new System.Drawing.Size(104, 20);
            this.txtformatopersonalizado.TabIndex = 28;
            this.txtformatopersonalizado.Visible = false;
            // 
            // cboformato
            // 
            this.cboformato.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cboformato.FormattingEnabled = true;
            this.cboformato.Location = new System.Drawing.Point(82, 124);
            this.cboformato.Name = "cboformato";
            this.cboformato.Size = new System.Drawing.Size(121, 21);
            this.cboformato.TabIndex = 27;
            this.cboformato.SelectedIndexChanged += new System.EventHandler(this.cboformato_SelectedIndexChanged);
            // 
            // txtnombrexml
            // 
            this.txtnombrexml.Location = new System.Drawing.Point(82, 45);
            this.txtnombrexml.Name = "txtnombrexml";
            this.txtnombrexml.Size = new System.Drawing.Size(321, 20);
            this.txtnombrexml.TabIndex = 20;
            this.txtnombrexml.TextChanged += new System.EventHandler(this.txtnombrexml_TextChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(13, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(69, 13);
            this.label5.TabIndex = 19;
            this.label5.Text = "Nombre XML";
            // 
            // btngrabar
            // 
            this.btngrabar.Location = new System.Drawing.Point(342, 177);
            this.btngrabar.Name = "btngrabar";
            this.btngrabar.Size = new System.Drawing.Size(75, 23);
            this.btngrabar.TabIndex = 28;
            this.btngrabar.Text = "Grabar";
            this.btngrabar.UseVisualStyleBackColor = true;
            this.btngrabar.Click += new System.EventHandler(this.btngrabar_Click);
            // 
            // btnactualizar
            // 
            this.btnactualizar.Location = new System.Drawing.Point(261, 177);
            this.btnactualizar.Name = "btnactualizar";
            this.btnactualizar.Size = new System.Drawing.Size(75, 23);
            this.btnactualizar.TabIndex = 28;
            this.btnactualizar.Text = "Actualizar";
            this.btnactualizar.UseVisualStyleBackColor = true;
            this.btnactualizar.Click += new System.EventHandler(this.btnactualizar_Click);
            // 
            // frmcolumnasimport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(429, 210);
            this.Controls.Add(this.btnactualizar);
            this.Controls.Add(this.btngrabar);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmcolumnasimport";
            this.Text = "Columnas";
            this.Load += new System.EventHandler(this.frmcolumnasimport_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox groupBox1;
        public System.Windows.Forms.TextBox txtnombre;
        public System.Windows.Forms.ComboBox cbotipo;
        public System.Windows.Forms.TextBox txtsize;
        public System.Windows.Forms.Button btngrabar;
        public System.Windows.Forms.Button btnactualizar;
        private System.Windows.Forms.TextBox txtformatopersonalizado;
        public System.Windows.Forms.ComboBox cboformato;
        public System.Windows.Forms.TextBox txtnombrexml;
        private System.Windows.Forms.Label label5;
    }
}