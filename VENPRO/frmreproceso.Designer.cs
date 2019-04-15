namespace VENPRO
{
    partial class frmreproceso
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmreproceso));
            this.btneliminardatos = new System.Windows.Forms.Button();
            this.grbelimfecha = new System.Windows.Forms.GroupBox();
            this.dtfecha = new System.Windows.Forms.DateTimePicker();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.rbtelimfecha = new System.Windows.Forms.RadioButton();
            this.rbtelimfechaxtienda = new System.Windows.Forms.RadioButton();
            this.grbelimfechxtienda = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.btneliminar = new System.Windows.Forms.Button();
            this.lst = new System.Windows.Forms.ListBox();
            this.btnbajar = new System.Windows.Forms.Button();
            this.btnsubir = new System.Windows.Forms.Button();
            this.btnagregar = new System.Windows.Forms.Button();
            this.dtfechaxtienda = new System.Windows.Forms.DateTimePicker();
            this.btnelminardatosxtienda = new System.Windows.Forms.Button();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.lblresult = new System.Windows.Forms.Label();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.label8 = new System.Windows.Forms.Label();
            this.chkactivarreproceso = new System.Windows.Forms.CheckBox();
            this.btngrabar = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.btnlimpiarcarpeta = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.txtrutareproceso = new System.Windows.Forms.TextBox();
            this.dtfechareproceso = new System.Windows.Forms.DateTimePicker();
            this.label1 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.grbelimfecha.SuspendLayout();
            this.grbelimfechxtienda.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.groupBox4.SuspendLayout();
            this.SuspendLayout();
            // 
            // btneliminardatos
            // 
            this.btneliminardatos.Location = new System.Drawing.Point(145, 12);
            this.btneliminardatos.Name = "btneliminardatos";
            this.btneliminardatos.Size = new System.Drawing.Size(75, 39);
            this.btneliminardatos.TabIndex = 3;
            this.btneliminardatos.Text = "Eliminar Datos";
            this.btneliminardatos.UseVisualStyleBackColor = true;
            this.btneliminardatos.Click += new System.EventHandler(this.btneliminardatos_Click);
            // 
            // grbelimfecha
            // 
            this.grbelimfecha.Controls.Add(this.dtfecha);
            this.grbelimfecha.Controls.Add(this.btneliminardatos);
            this.grbelimfecha.Location = new System.Drawing.Point(6, 70);
            this.grbelimfecha.Name = "grbelimfecha";
            this.grbelimfecha.Size = new System.Drawing.Size(226, 64);
            this.grbelimfecha.TabIndex = 4;
            this.grbelimfecha.TabStop = false;
            // 
            // dtfecha
            // 
            this.dtfecha.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtfecha.Location = new System.Drawing.Point(6, 18);
            this.dtfecha.Name = "dtfecha";
            this.dtfecha.Size = new System.Drawing.Size(107, 20);
            this.dtfecha.TabIndex = 29;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(3, 3);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(261, 25);
            this.label2.TabIndex = 30;
            this.label2.Text = "PASO 1: Eliminar Datos";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(5, 28);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(409, 13);
            this.label3.TabIndex = 31;
            this.label3.Text = "___________________________________________________________________";
            // 
            // rbtelimfecha
            // 
            this.rbtelimfecha.AutoSize = true;
            this.rbtelimfecha.Checked = true;
            this.rbtelimfecha.Location = new System.Drawing.Point(6, 54);
            this.rbtelimfecha.Name = "rbtelimfecha";
            this.rbtelimfecha.Size = new System.Drawing.Size(178, 17);
            this.rbtelimfecha.TabIndex = 33;
            this.rbtelimfecha.TabStop = true;
            this.rbtelimfecha.Text = "Eliminar todo los datos por fecha";
            this.rbtelimfecha.UseVisualStyleBackColor = true;
            this.rbtelimfecha.CheckedChanged += new System.EventHandler(this.rbtelimfecha_CheckedChanged);
            // 
            // rbtelimfechaxtienda
            // 
            this.rbtelimfechaxtienda.AutoSize = true;
            this.rbtelimfechaxtienda.Location = new System.Drawing.Point(240, 54);
            this.rbtelimfechaxtienda.Name = "rbtelimfechaxtienda";
            this.rbtelimfechaxtienda.Size = new System.Drawing.Size(183, 17);
            this.rbtelimfechaxtienda.TabIndex = 33;
            this.rbtelimfechaxtienda.Text = "Eliminar datos por fecha y tiendas";
            this.rbtelimfechaxtienda.UseVisualStyleBackColor = true;
            this.rbtelimfechaxtienda.CheckedChanged += new System.EventHandler(this.rbtelimfechaxtienda_CheckedChanged);
            // 
            // grbelimfechxtienda
            // 
            this.grbelimfechxtienda.Controls.Add(this.groupBox3);
            this.grbelimfechxtienda.Controls.Add(this.dtfechaxtienda);
            this.grbelimfechxtienda.Controls.Add(this.btnelminardatosxtienda);
            this.grbelimfechxtienda.Enabled = false;
            this.grbelimfechxtienda.Location = new System.Drawing.Point(240, 70);
            this.grbelimfechxtienda.Name = "grbelimfechxtienda";
            this.grbelimfechxtienda.Size = new System.Drawing.Size(386, 366);
            this.grbelimfechxtienda.TabIndex = 34;
            this.grbelimfechxtienda.TabStop = false;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.btneliminar);
            this.groupBox3.Controls.Add(this.lst);
            this.groupBox3.Controls.Add(this.btnbajar);
            this.groupBox3.Controls.Add(this.btnsubir);
            this.groupBox3.Controls.Add(this.btnagregar);
            this.groupBox3.Location = new System.Drawing.Point(6, 57);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(369, 298);
            this.groupBox3.TabIndex = 37;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Tiendas";
            // 
            // btneliminar
            // 
            this.btneliminar.Location = new System.Drawing.Point(303, 262);
            this.btneliminar.Name = "btneliminar";
            this.btneliminar.Size = new System.Drawing.Size(60, 23);
            this.btneliminar.TabIndex = 6;
            this.btneliminar.Text = "Eliminar";
            this.btneliminar.UseVisualStyleBackColor = true;
            this.btneliminar.Click += new System.EventHandler(this.btneliminar_Click);
            // 
            // lst
            // 
            this.lst.FormattingEnabled = true;
            this.lst.Location = new System.Drawing.Point(7, 52);
            this.lst.Name = "lst";
            this.lst.Size = new System.Drawing.Size(290, 238);
            this.lst.TabIndex = 5;
            // 
            // btnbajar
            // 
            this.btnbajar.Location = new System.Drawing.Point(303, 186);
            this.btnbajar.Name = "btnbajar";
            this.btnbajar.Size = new System.Drawing.Size(25, 23);
            this.btnbajar.TabIndex = 5;
            this.btnbajar.Text = "\\/";
            this.btnbajar.UseVisualStyleBackColor = true;
            this.btnbajar.Click += new System.EventHandler(this.btnbajar_Click);
            // 
            // btnsubir
            // 
            this.btnsubir.Location = new System.Drawing.Point(303, 157);
            this.btnsubir.Name = "btnsubir";
            this.btnsubir.Size = new System.Drawing.Size(25, 23);
            this.btnsubir.TabIndex = 5;
            this.btnsubir.Text = "/\\";
            this.btnsubir.UseVisualStyleBackColor = true;
            this.btnsubir.Click += new System.EventHandler(this.btnsubir_Click);
            // 
            // btnagregar
            // 
            this.btnagregar.Location = new System.Drawing.Point(237, 23);
            this.btnagregar.Name = "btnagregar";
            this.btnagregar.Size = new System.Drawing.Size(60, 23);
            this.btnagregar.TabIndex = 0;
            this.btnagregar.Text = "Agregar";
            this.btnagregar.UseVisualStyleBackColor = true;
            this.btnagregar.Click += new System.EventHandler(this.btnagregar_Click);
            // 
            // dtfechaxtienda
            // 
            this.dtfechaxtienda.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtfechaxtienda.Location = new System.Drawing.Point(6, 18);
            this.dtfechaxtienda.Name = "dtfechaxtienda";
            this.dtfechaxtienda.Size = new System.Drawing.Size(107, 20);
            this.dtfechaxtienda.TabIndex = 29;
            // 
            // btnelminardatosxtienda
            // 
            this.btnelminardatosxtienda.Location = new System.Drawing.Point(300, 12);
            this.btnelminardatosxtienda.Name = "btnelminardatosxtienda";
            this.btnelminardatosxtienda.Size = new System.Drawing.Size(75, 39);
            this.btnelminardatosxtienda.TabIndex = 3;
            this.btnelminardatosxtienda.Text = "Eliminar Datos";
            this.btnelminardatosxtienda.UseVisualStyleBackColor = true;
            this.btnelminardatosxtienda.Click += new System.EventHandler(this.btnelminardatosxtienda_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Location = new System.Drawing.Point(1, 2);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(643, 467);
            this.tabControl1.TabIndex = 35;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.lblresult);
            this.tabPage1.Controls.Add(this.label2);
            this.tabPage1.Controls.Add(this.grbelimfechxtienda);
            this.tabPage1.Controls.Add(this.grbelimfecha);
            this.tabPage1.Controls.Add(this.rbtelimfechaxtienda);
            this.tabPage1.Controls.Add(this.label3);
            this.tabPage1.Controls.Add(this.rbtelimfecha);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(635, 441);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Paso1";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // lblresult
            // 
            this.lblresult.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblresult.ForeColor = System.Drawing.Color.DarkCyan;
            this.lblresult.Location = new System.Drawing.Point(446, 15);
            this.lblresult.Name = "lblresult";
            this.lblresult.Size = new System.Drawing.Size(181, 56);
            this.lblresult.TabIndex = 35;
            this.lblresult.Text = "lblresult";
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.label8);
            this.tabPage2.Controls.Add(this.chkactivarreproceso);
            this.tabPage2.Controls.Add(this.btngrabar);
            this.tabPage2.Controls.Add(this.groupBox4);
            this.tabPage2.Controls.Add(this.label1);
            this.tabPage2.Controls.Add(this.label5);
            this.tabPage2.Location = new System.Drawing.Point(4, 22);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(635, 441);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Paso2";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label8.Location = new System.Drawing.Point(3, 150);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(521, 52);
            this.label8.TabIndex = 37;
            this.label8.Text = resources.GetString("label8.Text");
            // 
            // chkactivarreproceso
            // 
            this.chkactivarreproceso.AutoSize = true;
            this.chkactivarreproceso.Location = new System.Drawing.Point(12, 54);
            this.chkactivarreproceso.Name = "chkactivarreproceso";
            this.chkactivarreproceso.Size = new System.Drawing.Size(183, 17);
            this.chkactivarreproceso.TabIndex = 36;
            this.chkactivarreproceso.Text = "Activar Reproceso Archivos XML";
            this.chkactivarreproceso.UseVisualStyleBackColor = true;
            // 
            // btngrabar
            // 
            this.btngrabar.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btngrabar.Location = new System.Drawing.Point(541, 152);
            this.btngrabar.Name = "btngrabar";
            this.btngrabar.Size = new System.Drawing.Size(88, 37);
            this.btngrabar.TabIndex = 3;
            this.btngrabar.Text = "Grabar";
            this.btngrabar.UseVisualStyleBackColor = true;
            this.btngrabar.Click += new System.EventHandler(this.btngrabar_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.btnlimpiarcarpeta);
            this.groupBox4.Controls.Add(this.label7);
            this.groupBox4.Controls.Add(this.txtrutareproceso);
            this.groupBox4.Controls.Add(this.dtfechareproceso);
            this.groupBox4.Location = new System.Drawing.Point(12, 68);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(617, 79);
            this.groupBox4.TabIndex = 34;
            this.groupBox4.TabStop = false;
            // 
            // btnlimpiarcarpeta
            // 
            this.btnlimpiarcarpeta.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnlimpiarcarpeta.Location = new System.Drawing.Point(191, 47);
            this.btnlimpiarcarpeta.Name = "btnlimpiarcarpeta";
            this.btnlimpiarcarpeta.Size = new System.Drawing.Size(104, 23);
            this.btnlimpiarcarpeta.TabIndex = 37;
            this.btnlimpiarcarpeta.Text = "Limpiar Carpeta";
            this.btnlimpiarcarpeta.UseVisualStyleBackColor = true;
            this.btnlimpiarcarpeta.Click += new System.EventHandler(this.btnlimpiarcarpeta_Click);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(130, 24);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(55, 13);
            this.label7.TabIndex = 35;
            this.label7.Text = "Ruta XML";
            // 
            // txtrutareproceso
            // 
            this.txtrutareproceso.Location = new System.Drawing.Point(191, 21);
            this.txtrutareproceso.Name = "txtrutareproceso";
            this.txtrutareproceso.Size = new System.Drawing.Size(420, 20);
            this.txtrutareproceso.TabIndex = 36;
            // 
            // dtfechareproceso
            // 
            this.dtfechareproceso.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtfechareproceso.Location = new System.Drawing.Point(6, 18);
            this.dtfechareproceso.Name = "dtfechareproceso";
            this.dtfechareproceso.Size = new System.Drawing.Size(107, 20);
            this.dtfechareproceso.TabIndex = 29;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(7, 3);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(300, 25);
            this.label1.TabIndex = 32;
            this.label1.Text = "PASO 2: Procesar Archivos";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(9, 28);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(409, 13);
            this.label5.TabIndex = 33;
            this.label5.Text = "___________________________________________________________________";
            // 
            // frmreproceso
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(644, 472);
            this.Controls.Add(this.tabControl1);
            this.Name = "frmreproceso";
            this.Text = "Reproceso de Archivos";
            this.Load += new System.EventHandler(this.frmreproceso_Load);
            this.grbelimfecha.ResumeLayout(false);
            this.grbelimfechxtienda.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btneliminardatos;
        private System.Windows.Forms.GroupBox grbelimfecha;
        private System.Windows.Forms.DateTimePicker dtfecha;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.RadioButton rbtelimfecha;
        private System.Windows.Forms.RadioButton rbtelimfechaxtienda;
        private System.Windows.Forms.GroupBox grbelimfechxtienda;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Button btneliminar;
        public System.Windows.Forms.ListBox lst;
        private System.Windows.Forms.Button btnbajar;
        private System.Windows.Forms.Button btnsubir;
        public System.Windows.Forms.Button btnagregar;
        private System.Windows.Forms.DateTimePicker dtfechaxtienda;
        private System.Windows.Forms.Button btnelminardatosxtienda;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.CheckBox chkactivarreproceso;
        private System.Windows.Forms.Button btngrabar;
        private System.Windows.Forms.GroupBox groupBox4;
        private System.Windows.Forms.Button btnlimpiarcarpeta;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox txtrutareproceso;
        private System.Windows.Forms.DateTimePicker dtfechareproceso;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label lblresult;
    }
}