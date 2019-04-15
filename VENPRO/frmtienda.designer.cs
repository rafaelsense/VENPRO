namespace VENPRO
{
    partial class frmtienda
    {
        /// <summary>
        /// Variable del diseñador requerida.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpiar los recursos que se estén utilizando.
        /// </summary>
        /// <param name="disposing">true si los recursos administrados se deben eliminar; false en caso contrario, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código generado por el Diseñador de Windows Forms

        /// <summary>
        /// Método necesario para admitir el Diseñador. No se puede modificar
        /// el contenido del método con el editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmtienda));
            this.label1 = new System.Windows.Forms.Label();
            this.txtruta = new System.Windows.Forms.TextBox();
            this.btnok = new System.Windows.Forms.Button();
            this.btnSalir = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.chkActivar = new System.Windows.Forms.CheckBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.txtservidor = new System.Windows.Forms.TextBox();
            this.txtnombre = new System.Windows.Forms.TextBox();
            this.txtcodtienda = new System.Windows.Forms.TextBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtvisor = new System.Windows.Forms.TextBox();
            this.txtusuario = new System.Windows.Forms.TextBox();
            this.txtpass = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btntest = new System.Windows.Forms.Button();
            this.btnruta = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 44);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(72, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Servidor FTP:";
            // 
            // txtruta
            // 
            this.txtruta.AllowDrop = true;
            this.txtruta.Location = new System.Drawing.Point(111, 63);
            this.txtruta.Name = "txtruta";
            this.txtruta.ReadOnly = true;
            this.txtruta.Size = new System.Drawing.Size(408, 20);
            this.txtruta.TabIndex = 3;
            this.txtruta.TextChanged += new System.EventHandler(this.txtruta_TextChanged);
            // 
            // btnok
            // 
            this.btnok.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnok.Location = new System.Drawing.Point(412, 271);
            this.btnok.Name = "btnok";
            this.btnok.Size = new System.Drawing.Size(75, 23);
            this.btnok.TabIndex = 8;
            this.btnok.Text = "OK";
            this.btnok.UseVisualStyleBackColor = true;
            this.btnok.Click += new System.EventHandler(this.btnok_Click);
            // 
            // btnSalir
            // 
            this.btnSalir.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnSalir.Location = new System.Drawing.Point(513, 271);
            this.btnSalir.Name = "btnSalir";
            this.btnSalir.Size = new System.Drawing.Size(87, 23);
            this.btnSalir.TabIndex = 5;
            this.btnSalir.Text = "SALIR";
            this.btnSalir.UseVisualStyleBackColor = true;
            this.btnSalir.Click += new System.EventHandler(this.btnSalir_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnruta);
            this.groupBox1.Controls.Add(this.chkActivar);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtservidor);
            this.groupBox1.Controls.Add(this.txtnombre);
            this.groupBox1.Controls.Add(this.txtcodtienda);
            this.groupBox1.Controls.Add(this.txtruta);
            this.groupBox1.Location = new System.Drawing.Point(3, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(603, 96);
            this.groupBox1.TabIndex = 7;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "DATOS";
            // 
            // chkActivar
            // 
            this.chkActivar.AutoSize = true;
            this.chkActivar.Checked = true;
            this.chkActivar.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkActivar.Location = new System.Drawing.Point(525, 65);
            this.chkActivar.Name = "chkActivar";
            this.chkActivar.Size = new System.Drawing.Size(72, 17);
            this.chkActivar.TabIndex = 6;
            this.chkActivar.Text = "ACTIVAR";
            this.chkActivar.UseVisualStyleBackColor = true;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(200, 16);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(54, 13);
            this.label6.TabIndex = 0;
            this.label6.Text = "NOMBRE";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(32, 14);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(73, 13);
            this.label2.TabIndex = 0;
            this.label2.Text = "COD TIENDA";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(79, 45);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(32, 13);
            this.label3.TabIndex = 0;
            this.label3.Text = "ftp://";
            // 
            // txtservidor
            // 
            this.txtservidor.AllowDrop = true;
            this.txtservidor.Location = new System.Drawing.Point(111, 37);
            this.txtservidor.Name = "txtservidor";
            this.txtservidor.Size = new System.Drawing.Size(187, 20);
            this.txtservidor.TabIndex = 2;
            this.txtservidor.TextChanged += new System.EventHandler(this.txtruta_TextChanged);
            // 
            // txtnombre
            // 
            this.txtnombre.AllowDrop = true;
            this.txtnombre.Location = new System.Drawing.Point(260, 11);
            this.txtnombre.Name = "txtnombre";
            this.txtnombre.Size = new System.Drawing.Size(337, 20);
            this.txtnombre.TabIndex = 1;
            this.txtnombre.TextChanged += new System.EventHandler(this.txtruta_TextChanged);
            // 
            // txtcodtienda
            // 
            this.txtcodtienda.AllowDrop = true;
            this.txtcodtienda.Location = new System.Drawing.Point(111, 11);
            this.txtcodtienda.Name = "txtcodtienda";
            this.txtcodtienda.Size = new System.Drawing.Size(83, 20);
            this.txtcodtienda.TabIndex = 0;
            this.txtcodtienda.TextChanged += new System.EventHandler(this.txtruta_TextChanged);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtvisor);
            this.groupBox2.Location = new System.Drawing.Point(3, 203);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(603, 62);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "VISOR";
            // 
            // txtvisor
            // 
            this.txtvisor.Location = new System.Drawing.Point(6, 17);
            this.txtvisor.Multiline = true;
            this.txtvisor.Name = "txtvisor";
            this.txtvisor.ReadOnly = true;
            this.txtvisor.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;
            this.txtvisor.Size = new System.Drawing.Size(591, 39);
            this.txtvisor.TabIndex = 7;
            // 
            // txtusuario
            // 
            this.txtusuario.Location = new System.Drawing.Point(87, 19);
            this.txtusuario.Name = "txtusuario";
            this.txtusuario.Size = new System.Drawing.Size(211, 20);
            this.txtusuario.TabIndex = 4;
            // 
            // txtpass
            // 
            this.txtpass.Location = new System.Drawing.Point(87, 45);
            this.txtpass.Name = "txtpass";
            this.txtpass.Size = new System.Drawing.Size(211, 20);
            this.txtpass.TabIndex = 5;
            this.txtpass.UseSystemPasswordChar = true;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(22, 22);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(46, 13);
            this.label4.TabIndex = 1;
            this.label4.Text = "Usuario:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 48);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(56, 13);
            this.label5.TabIndex = 1;
            this.label5.Text = "Password:";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.txtusuario);
            this.groupBox3.Controls.Add(this.txtpass);
            this.groupBox3.Controls.Add(this.label4);
            this.groupBox3.Controls.Add(this.label5);
            this.groupBox3.Location = new System.Drawing.Point(3, 114);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(320, 83);
            this.groupBox3.TabIndex = 4;
            this.groupBox3.TabStop = false;
            // 
            // btntest
            // 
            this.btntest.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btntest.Location = new System.Drawing.Point(513, 174);
            this.btntest.Name = "btntest";
            this.btntest.Size = new System.Drawing.Size(87, 23);
            this.btntest.TabIndex = 5;
            this.btntest.Text = "TEST";
            this.btntest.UseVisualStyleBackColor = true;
            this.btntest.Click += new System.EventHandler(this.btntest_Click);
            // 
            // btnruta
            // 
            this.btnruta.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnruta.Location = new System.Drawing.Point(61, 61);
            this.btnruta.Name = "btnruta";
            this.btnruta.Size = new System.Drawing.Size(44, 23);
            this.btnruta.TabIndex = 7;
            this.btnruta.Text = "Ruta";
            this.btnruta.UseVisualStyleBackColor = true;
            this.btnruta.Click += new System.EventHandler(this.btnruta_Click);
            // 
            // frmtienda
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(612, 308);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.btntest);
            this.Controls.Add(this.btnSalir);
            this.Controls.Add(this.btnok);
            this.ForeColor = System.Drawing.Color.Navy;
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "frmtienda";
            this.ShowInTaskbar = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "CREAR TIENDA";
            this.Load += new System.EventHandler(this.frmAruta_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnok;
        private System.Windows.Forms.Button btnSalir;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox txtvisor;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        public System.Windows.Forms.TextBox txtpass;
        public System.Windows.Forms.TextBox txtusuario;
        public System.Windows.Forms.CheckBox chkActivar;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label2;
        public System.Windows.Forms.TextBox txtruta;
        public System.Windows.Forms.TextBox txtservidor;
        public System.Windows.Forms.TextBox txtnombre;
        public System.Windows.Forms.TextBox txtcodtienda;
        private System.Windows.Forms.Button btntest;
        private System.Windows.Forms.Button btnruta;
    }
}