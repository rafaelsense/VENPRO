namespace VENPRO
{
    partial class frmtablaimport
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
            this.label4 = new System.Windows.Forms.Label();
            this.ncolumupdate = new System.Windows.Forms.NumericUpDown();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.lst = new System.Windows.Forms.ListBox();
            this.btnbajar = new System.Windows.Forms.Button();
            this.btnsubir = new System.Windows.Forms.Button();
            this.btneliminar = new System.Windows.Forms.Button();
            this.btnagregar = new System.Windows.Forms.Button();
            this.txtnomcolumna = new System.Windows.Forms.TextBox();
            this.btngrabar = new System.Windows.Forms.Button();
            this.btnactualizar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.rbteliminarinsertar = new System.Windows.Forms.RadioButton();
            this.rbtactualizar = new System.Windows.Forms.RadioButton();
            this.ncolumupdate1 = new System.Windows.Forms.NumericUpDown();
            this.label3 = new System.Windows.Forms.Label();
            this.ncolumupdate2 = new System.Windows.Forms.NumericUpDown();
            this.label5 = new System.Windows.Forms.Label();
            this.chkupdate1 = new System.Windows.Forms.CheckBox();
            this.chkupdate2 = new System.Windows.Forms.CheckBox();
            this.chkactivo = new System.Windows.Forms.CheckBox();
            this.ncolumupdate3 = new System.Windows.Forms.NumericUpDown();
            this.label6 = new System.Windows.Forms.Label();
            this.chkupdate3 = new System.Windows.Forms.CheckBox();
            this.ncolumupdate4 = new System.Windows.Forms.NumericUpDown();
            this.label7 = new System.Windows.Forms.Label();
            this.chkupdate4 = new System.Windows.Forms.CheckBox();
            this.ncolumupdate5 = new System.Windows.Forms.NumericUpDown();
            this.label8 = new System.Windows.Forms.Label();
            this.chkupdate5 = new System.Windows.Forms.CheckBox();
            this.ncolumupdate6 = new System.Windows.Forms.NumericUpDown();
            this.label9 = new System.Windows.Forms.Label();
            this.chkupdate6 = new System.Windows.Forms.CheckBox();
            this.ncolumupdate7 = new System.Windows.Forms.NumericUpDown();
            this.label10 = new System.Windows.Forms.Label();
            this.chkupdate7 = new System.Windows.Forms.CheckBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label13 = new System.Windows.Forms.Label();
            this.txtnombrexml = new System.Windows.Forms.TextBox();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate4)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate5)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate6)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate7)).BeginInit();
            this.SuspendLayout();
            // 
            // txtnombre
            // 
            this.txtnombre.Location = new System.Drawing.Point(76, 12);
            this.txtnombre.Name = "txtnombre";
            this.txtnombre.Size = new System.Drawing.Size(270, 20);
            this.txtnombre.TabIndex = 19;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(8, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 13);
            this.label2.TabIndex = 18;
            this.label2.Text = "Nombre BD";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(14, 66);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(74, 13);
            this.label4.TabIndex = 20;
            this.label4.Text = "Colum FECHA";
            this.label4.Visible = false;
            // 
            // ncolumupdate
            // 
            this.ncolumupdate.Location = new System.Drawing.Point(94, 64);
            this.ncolumupdate.Name = "ncolumupdate";
            this.ncolumupdate.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate.TabIndex = 21;
            this.ncolumupdate.Visible = false;
            this.ncolumupdate.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.ncolumupdate_MouseDoubleClick);
            // 
            // groupBox2
            // 
            this.groupBox2.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox2.Controls.Add(this.lst);
            this.groupBox2.Controls.Add(this.btnbajar);
            this.groupBox2.Controls.Add(this.btnsubir);
            this.groupBox2.Controls.Add(this.btneliminar);
            this.groupBox2.Controls.Add(this.btnagregar);
            this.groupBox2.Controls.Add(this.txtnomcolumna);
            this.groupBox2.Location = new System.Drawing.Point(8, 186);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(473, 279);
            this.groupBox2.TabIndex = 22;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Columnas";
            // 
            // lst
            // 
            this.lst.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.lst.FormattingEnabled = true;
            this.lst.Location = new System.Drawing.Point(12, 44);
            this.lst.Name = "lst";
            this.lst.Size = new System.Drawing.Size(388, 225);
            this.lst.TabIndex = 5;
            // 
            // btnbajar
            // 
            this.btnbajar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnbajar.Location = new System.Drawing.Point(406, 154);
            this.btnbajar.Name = "btnbajar";
            this.btnbajar.Size = new System.Drawing.Size(25, 23);
            this.btnbajar.TabIndex = 5;
            this.btnbajar.Text = "\\/";
            this.btnbajar.UseVisualStyleBackColor = true;
            this.btnbajar.Click += new System.EventHandler(this.btnbajar_Click);
            // 
            // btnsubir
            // 
            this.btnsubir.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnsubir.Location = new System.Drawing.Point(406, 125);
            this.btnsubir.Name = "btnsubir";
            this.btnsubir.Size = new System.Drawing.Size(25, 23);
            this.btnsubir.TabIndex = 5;
            this.btnsubir.Text = "/\\";
            this.btnsubir.UseVisualStyleBackColor = true;
            this.btnsubir.Click += new System.EventHandler(this.btnsubir_Click);
            // 
            // btneliminar
            // 
            this.btneliminar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btneliminar.Location = new System.Drawing.Point(407, 85);
            this.btneliminar.Name = "btneliminar";
            this.btneliminar.Size = new System.Drawing.Size(60, 23);
            this.btneliminar.TabIndex = 0;
            this.btneliminar.Text = "Eliminar";
            this.btneliminar.UseVisualStyleBackColor = true;
            this.btneliminar.Click += new System.EventHandler(this.btneliminar_Click);
            // 
            // btnagregar
            // 
            this.btnagregar.Location = new System.Drawing.Point(340, 19);
            this.btnagregar.Name = "btnagregar";
            this.btnagregar.Size = new System.Drawing.Size(60, 23);
            this.btnagregar.TabIndex = 0;
            this.btnagregar.Text = "Agregar";
            this.btnagregar.UseVisualStyleBackColor = true;
            this.btnagregar.Click += new System.EventHandler(this.btnagregar_Click);
            // 
            // txtnomcolumna
            // 
            this.txtnomcolumna.Location = new System.Drawing.Point(10, 19);
            this.txtnomcolumna.Name = "txtnomcolumna";
            this.txtnomcolumna.ReadOnly = true;
            this.txtnomcolumna.Size = new System.Drawing.Size(324, 20);
            this.txtnomcolumna.TabIndex = 4;
            this.txtnomcolumna.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.txtnomcolumna_MouseDoubleClick);
            // 
            // btngrabar
            // 
            this.btngrabar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btngrabar.Location = new System.Drawing.Point(412, 471);
            this.btngrabar.Name = "btngrabar";
            this.btngrabar.Size = new System.Drawing.Size(75, 23);
            this.btngrabar.TabIndex = 23;
            this.btngrabar.Text = "Grabar";
            this.btngrabar.UseVisualStyleBackColor = true;
            this.btngrabar.Click += new System.EventHandler(this.btngrabar_Click);
            // 
            // btnactualizar
            // 
            this.btnactualizar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnactualizar.Location = new System.Drawing.Point(329, 471);
            this.btnactualizar.Name = "btnactualizar";
            this.btnactualizar.Size = new System.Drawing.Size(75, 23);
            this.btnactualizar.TabIndex = 29;
            this.btnactualizar.Text = "Actualizar";
            this.btnactualizar.UseVisualStyleBackColor = true;
            this.btnactualizar.Click += new System.EventHandler(this.btnactualizar_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(321, 66);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(103, 13);
            this.label1.TabIndex = 20;
            this.label1.Text = "Modo Actualizacion:";
            // 
            // rbteliminarinsertar
            // 
            this.rbteliminarinsertar.AutoSize = true;
            this.rbteliminarinsertar.Location = new System.Drawing.Point(332, 82);
            this.rbteliminarinsertar.Name = "rbteliminarinsertar";
            this.rbteliminarinsertar.Size = new System.Drawing.Size(149, 17);
            this.rbteliminarinsertar.TabIndex = 30;
            this.rbteliminarinsertar.TabStop = true;
            this.rbteliminarinsertar.Text = "Eliminar y despues insertar";
            this.rbteliminarinsertar.UseVisualStyleBackColor = true;
            // 
            // rbtactualizar
            // 
            this.rbtactualizar.AutoSize = true;
            this.rbtactualizar.Enabled = false;
            this.rbtactualizar.Location = new System.Drawing.Point(332, 101);
            this.rbtactualizar.Name = "rbtactualizar";
            this.rbtactualizar.Size = new System.Drawing.Size(71, 17);
            this.rbtactualizar.TabIndex = 31;
            this.rbtactualizar.TabStop = true;
            this.rbtactualizar.Text = "Actualizar";
            this.rbtactualizar.UseVisualStyleBackColor = true;
            // 
            // ncolumupdate1
            // 
            this.ncolumupdate1.Enabled = false;
            this.ncolumupdate1.Location = new System.Drawing.Point(94, 84);
            this.ncolumupdate1.Name = "ncolumupdate1";
            this.ncolumupdate1.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate1.TabIndex = 21;
            this.ncolumupdate1.Visible = false;
            this.ncolumupdate1.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.ncolumupdate1_MouseDoubleClick);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(0, 88);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(87, 13);
            this.label3.TabIndex = 20;
            this.label3.Text = "Colum COD TDA";
            this.label3.Visible = false;
            // 
            // ncolumupdate2
            // 
            this.ncolumupdate2.Enabled = false;
            this.ncolumupdate2.Location = new System.Drawing.Point(248, 67);
            this.ncolumupdate2.Name = "ncolumupdate2";
            this.ncolumupdate2.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate2.TabIndex = 21;
            this.ncolumupdate2.Visible = false;
            this.ncolumupdate2.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.ncolumupdate2_MouseDoubleClick);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(168, 69);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(80, 13);
            this.label5.TabIndex = 20;
            this.label5.Text = "Colum Update2";
            this.label5.Visible = false;
            // 
            // chkupdate1
            // 
            this.chkupdate1.AutoSize = true;
            this.chkupdate1.Location = new System.Drawing.Point(137, 90);
            this.chkupdate1.Name = "chkupdate1";
            this.chkupdate1.Size = new System.Drawing.Size(15, 14);
            this.chkupdate1.TabIndex = 33;
            this.chkupdate1.UseVisualStyleBackColor = true;
            this.chkupdate1.Visible = false;
            this.chkupdate1.CheckedChanged += new System.EventHandler(this.chkupdate1_CheckedChanged);
            // 
            // chkupdate2
            // 
            this.chkupdate2.AutoSize = true;
            this.chkupdate2.Location = new System.Drawing.Point(291, 73);
            this.chkupdate2.Name = "chkupdate2";
            this.chkupdate2.Size = new System.Drawing.Size(15, 14);
            this.chkupdate2.TabIndex = 33;
            this.chkupdate2.UseVisualStyleBackColor = true;
            this.chkupdate2.Visible = false;
            this.chkupdate2.CheckedChanged += new System.EventHandler(this.chkupdate2_CheckedChanged);
            // 
            // chkactivo
            // 
            this.chkactivo.AutoSize = true;
            this.chkactivo.Checked = true;
            this.chkactivo.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkactivo.Location = new System.Drawing.Point(352, 14);
            this.chkactivo.Name = "chkactivo";
            this.chkactivo.Size = new System.Drawing.Size(56, 17);
            this.chkactivo.TabIndex = 34;
            this.chkactivo.Text = "Activo";
            this.chkactivo.UseVisualStyleBackColor = true;
            // 
            // ncolumupdate3
            // 
            this.ncolumupdate3.Enabled = false;
            this.ncolumupdate3.Location = new System.Drawing.Point(248, 88);
            this.ncolumupdate3.Name = "ncolumupdate3";
            this.ncolumupdate3.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate3.TabIndex = 21;
            this.ncolumupdate3.Visible = false;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(168, 90);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(80, 13);
            this.label6.TabIndex = 20;
            this.label6.Text = "Colum Update3";
            this.label6.Visible = false;
            // 
            // chkupdate3
            // 
            this.chkupdate3.AutoSize = true;
            this.chkupdate3.Enabled = false;
            this.chkupdate3.Location = new System.Drawing.Point(291, 94);
            this.chkupdate3.Name = "chkupdate3";
            this.chkupdate3.Size = new System.Drawing.Size(15, 14);
            this.chkupdate3.TabIndex = 33;
            this.chkupdate3.UseVisualStyleBackColor = true;
            this.chkupdate3.Visible = false;
            this.chkupdate3.CheckedChanged += new System.EventHandler(this.chkupdate3_CheckedChanged);
            // 
            // ncolumupdate4
            // 
            this.ncolumupdate4.Enabled = false;
            this.ncolumupdate4.Location = new System.Drawing.Point(248, 106);
            this.ncolumupdate4.Name = "ncolumupdate4";
            this.ncolumupdate4.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate4.TabIndex = 21;
            this.ncolumupdate4.Visible = false;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(168, 108);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(80, 13);
            this.label7.TabIndex = 20;
            this.label7.Text = "Colum Update4";
            this.label7.Visible = false;
            // 
            // chkupdate4
            // 
            this.chkupdate4.AutoSize = true;
            this.chkupdate4.Enabled = false;
            this.chkupdate4.Location = new System.Drawing.Point(291, 112);
            this.chkupdate4.Name = "chkupdate4";
            this.chkupdate4.Size = new System.Drawing.Size(15, 14);
            this.chkupdate4.TabIndex = 33;
            this.chkupdate4.UseVisualStyleBackColor = true;
            this.chkupdate4.Visible = false;
            this.chkupdate4.CheckedChanged += new System.EventHandler(this.chkupdate4_CheckedChanged);
            // 
            // ncolumupdate5
            // 
            this.ncolumupdate5.Enabled = false;
            this.ncolumupdate5.Location = new System.Drawing.Point(248, 126);
            this.ncolumupdate5.Name = "ncolumupdate5";
            this.ncolumupdate5.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate5.TabIndex = 21;
            this.ncolumupdate5.Visible = false;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(168, 128);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(80, 13);
            this.label8.TabIndex = 20;
            this.label8.Text = "Colum Update5";
            this.label8.Visible = false;
            // 
            // chkupdate5
            // 
            this.chkupdate5.AutoSize = true;
            this.chkupdate5.Enabled = false;
            this.chkupdate5.Location = new System.Drawing.Point(291, 132);
            this.chkupdate5.Name = "chkupdate5";
            this.chkupdate5.Size = new System.Drawing.Size(15, 14);
            this.chkupdate5.TabIndex = 33;
            this.chkupdate5.UseVisualStyleBackColor = true;
            this.chkupdate5.Visible = false;
            this.chkupdate5.CheckedChanged += new System.EventHandler(this.chkupdate5_CheckedChanged);
            // 
            // ncolumupdate6
            // 
            this.ncolumupdate6.Enabled = false;
            this.ncolumupdate6.Location = new System.Drawing.Point(248, 146);
            this.ncolumupdate6.Name = "ncolumupdate6";
            this.ncolumupdate6.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate6.TabIndex = 21;
            this.ncolumupdate6.Visible = false;
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(168, 148);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(80, 13);
            this.label9.TabIndex = 20;
            this.label9.Text = "Colum Update6";
            this.label9.Visible = false;
            // 
            // chkupdate6
            // 
            this.chkupdate6.AutoSize = true;
            this.chkupdate6.Enabled = false;
            this.chkupdate6.Location = new System.Drawing.Point(291, 152);
            this.chkupdate6.Name = "chkupdate6";
            this.chkupdate6.Size = new System.Drawing.Size(15, 14);
            this.chkupdate6.TabIndex = 33;
            this.chkupdate6.UseVisualStyleBackColor = true;
            this.chkupdate6.Visible = false;
            this.chkupdate6.CheckedChanged += new System.EventHandler(this.chkupdate6_CheckedChanged);
            // 
            // ncolumupdate7
            // 
            this.ncolumupdate7.Enabled = false;
            this.ncolumupdate7.Location = new System.Drawing.Point(248, 166);
            this.ncolumupdate7.Name = "ncolumupdate7";
            this.ncolumupdate7.Size = new System.Drawing.Size(41, 20);
            this.ncolumupdate7.TabIndex = 21;
            this.ncolumupdate7.Visible = false;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(168, 168);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(80, 13);
            this.label10.TabIndex = 20;
            this.label10.Text = "Colum Update7";
            this.label10.Visible = false;
            // 
            // chkupdate7
            // 
            this.chkupdate7.AutoSize = true;
            this.chkupdate7.Enabled = false;
            this.chkupdate7.Location = new System.Drawing.Point(291, 172);
            this.chkupdate7.Name = "chkupdate7";
            this.chkupdate7.Size = new System.Drawing.Size(15, 14);
            this.chkupdate7.TabIndex = 33;
            this.chkupdate7.UseVisualStyleBackColor = true;
            this.chkupdate7.Visible = false;
            this.chkupdate7.CheckedChanged += new System.EventHandler(this.chkupdate7_CheckedChanged);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.ForeColor = System.Drawing.Color.DarkSlateGray;
            this.label12.Location = new System.Drawing.Point(329, 130);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(106, 26);
            this.label12.TabIndex = 35;
            this.label12.Text = "*La PrimeraColumna \r\nimplicita es \"archivo\"";
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(8, 41);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(69, 13);
            this.label13.TabIndex = 18;
            this.label13.Text = "Nombre XML";
            // 
            // txtnombrexml
            // 
            this.txtnombrexml.Location = new System.Drawing.Point(76, 34);
            this.txtnombrexml.Name = "txtnombrexml";
            this.txtnombrexml.Size = new System.Drawing.Size(270, 20);
            this.txtnombrexml.TabIndex = 19;
            this.txtnombrexml.TextChanged += new System.EventHandler(this.txtnombrexml_TextChanged);
            // 
            // frmtablaimport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(493, 496);
            this.Controls.Add(this.label12);
            this.Controls.Add(this.chkactivo);
            this.Controls.Add(this.chkupdate7);
            this.Controls.Add(this.chkupdate6);
            this.Controls.Add(this.chkupdate5);
            this.Controls.Add(this.chkupdate4);
            this.Controls.Add(this.chkupdate3);
            this.Controls.Add(this.chkupdate2);
            this.Controls.Add(this.chkupdate1);
            this.Controls.Add(this.rbtactualizar);
            this.Controls.Add(this.rbteliminarinsertar);
            this.Controls.Add(this.btnactualizar);
            this.Controls.Add(this.btngrabar);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.label10);
            this.Controls.Add(this.label9);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.ncolumupdate7);
            this.Controls.Add(this.ncolumupdate6);
            this.Controls.Add(this.ncolumupdate5);
            this.Controls.Add(this.ncolumupdate4);
            this.Controls.Add(this.ncolumupdate3);
            this.Controls.Add(this.ncolumupdate2);
            this.Controls.Add(this.ncolumupdate1);
            this.Controls.Add(this.ncolumupdate);
            this.Controls.Add(this.txtnombrexml);
            this.Controls.Add(this.label13);
            this.Controls.Add(this.txtnombre);
            this.Controls.Add(this.label2);
            this.Name = "frmtablaimport";
            this.Text = "Tablas Import";
            this.Load += new System.EventHandler(this.frmtablaimport_Load);
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate)).EndInit();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate4)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate5)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate6)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ncolumupdate7)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Button btnbajar;
        private System.Windows.Forms.Button btnsubir;
        private System.Windows.Forms.Button btneliminar;
        private System.Windows.Forms.Button btnagregar;
        private System.Windows.Forms.TextBox txtnomcolumna;
        public System.Windows.Forms.Button btnactualizar;
        public System.Windows.Forms.TextBox txtnombre;
        public System.Windows.Forms.NumericUpDown ncolumupdate;
        public System.Windows.Forms.ListBox lst;
        public System.Windows.Forms.Button btngrabar;
        private System.Windows.Forms.Label label1;
        public System.Windows.Forms.RadioButton rbteliminarinsertar;
        public System.Windows.Forms.RadioButton rbtactualizar;
        public System.Windows.Forms.NumericUpDown ncolumupdate1;
        private System.Windows.Forms.Label label3;
        public System.Windows.Forms.NumericUpDown ncolumupdate2;
        private System.Windows.Forms.Label label5;
        public System.Windows.Forms.NumericUpDown ncolumupdate3;
        private System.Windows.Forms.Label label6;
        public System.Windows.Forms.NumericUpDown ncolumupdate4;
        private System.Windows.Forms.Label label7;
        public System.Windows.Forms.NumericUpDown ncolumupdate5;
        private System.Windows.Forms.Label label8;
        public System.Windows.Forms.NumericUpDown ncolumupdate6;
        private System.Windows.Forms.Label label9;
        public System.Windows.Forms.NumericUpDown ncolumupdate7;
        private System.Windows.Forms.Label label10;
        public System.Windows.Forms.CheckBox chkactivo;
        public System.Windows.Forms.CheckBox chkupdate1;
        public System.Windows.Forms.CheckBox chkupdate2;
        public System.Windows.Forms.CheckBox chkupdate3;
        public System.Windows.Forms.CheckBox chkupdate4;
        public System.Windows.Forms.CheckBox chkupdate5;
        public System.Windows.Forms.CheckBox chkupdate6;
        public System.Windows.Forms.CheckBox chkupdate7;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.Label label13;
        public System.Windows.Forms.TextBox txtnombrexml;
    }
}