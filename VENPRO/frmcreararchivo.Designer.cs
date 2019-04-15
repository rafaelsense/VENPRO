namespace VENPRO
{
    partial class frmcreararchivo
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txttexto = new System.Windows.Forms.TextBox();
            this.txtdato = new System.Windows.Forms.TextBox();
            this.btnagregatexto = new System.Windows.Forms.Button();
            this.btnagregarmescomer = new System.Windows.Forms.Button();
            this.btnagregarsemana = new System.Windows.Forms.Button();
            this.btnagregafecha = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.numdiamescomer = new System.Windows.Forms.NumericUpDown();
            this.numdiasemana = new System.Windows.Forms.NumericUpDown();
            this.numdia = new System.Windows.Forms.NumericUpDown();
            this.label7 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.txtformato = new System.Windows.Forms.TextBox();
            this.cbofechaformat = new System.Windows.Forms.ComboBox();
            this.btnaceptar = new System.Windows.Forms.Button();
            this.btnlimpiar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numdiamescomer)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numdiasemana)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numdia)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.groupBox1.Controls.Add(this.txttexto);
            this.groupBox1.Controls.Add(this.txtdato);
            this.groupBox1.Controls.Add(this.btnagregatexto);
            this.groupBox1.Controls.Add(this.btnagregarmescomer);
            this.groupBox1.Controls.Add(this.btnagregarsemana);
            this.groupBox1.Controls.Add(this.btnagregafecha);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.numdiamescomer);
            this.groupBox1.Controls.Add(this.numdiasemana);
            this.groupBox1.Controls.Add(this.numdia);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.txtformato);
            this.groupBox1.Controls.Add(this.cbofechaformat);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(759, 239);
            this.groupBox1.TabIndex = 38;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "FORMATO";
            // 
            // txttexto
            // 
            this.txttexto.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txttexto.Location = new System.Drawing.Point(103, 77);
            this.txttexto.MaxLength = 250;
            this.txttexto.Multiline = true;
            this.txttexto.Name = "txttexto";
            this.txttexto.Size = new System.Drawing.Size(643, 62);
            this.txttexto.TabIndex = 9;
            // 
            // txtdato
            // 
            this.txtdato.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtdato.Location = new System.Drawing.Point(411, 145);
            this.txtdato.Multiline = true;
            this.txtdato.Name = "txtdato";
            this.txtdato.ReadOnly = true;
            this.txtdato.Size = new System.Drawing.Size(342, 88);
            this.txtdato.TabIndex = 39;
            // 
            // btnagregatexto
            // 
            this.btnagregatexto.Location = new System.Drawing.Point(28, 89);
            this.btnagregatexto.Name = "btnagregatexto";
            this.btnagregatexto.Size = new System.Drawing.Size(69, 23);
            this.btnagregatexto.TabIndex = 8;
            this.btnagregatexto.Text = "AGr texto";
            this.btnagregatexto.UseVisualStyleBackColor = true;
            this.btnagregatexto.Click += new System.EventHandler(this.btnagregatexto_Click);
            // 
            // btnagregarmescomer
            // 
            this.btnagregarmescomer.Location = new System.Drawing.Point(606, 43);
            this.btnagregarmescomer.Name = "btnagregarmescomer";
            this.btnagregarmescomer.Size = new System.Drawing.Size(115, 23);
            this.btnagregarmescomer.TabIndex = 7;
            this.btnagregarmescomer.Text = "AGr MesComercial";
            this.btnagregarmescomer.UseVisualStyleBackColor = true;
            this.btnagregarmescomer.Visible = false;
            this.btnagregarmescomer.Click += new System.EventHandler(this.btnagregarmescomer_Click);
            // 
            // btnagregarsemana
            // 
            this.btnagregarsemana.Location = new System.Drawing.Point(606, 19);
            this.btnagregarsemana.Name = "btnagregarsemana";
            this.btnagregarsemana.Size = new System.Drawing.Size(88, 23);
            this.btnagregarsemana.TabIndex = 7;
            this.btnagregarsemana.Text = "AGr Semana";
            this.btnagregarsemana.UseVisualStyleBackColor = true;
            this.btnagregarsemana.Visible = false;
            this.btnagregarsemana.Click += new System.EventHandler(this.btnagregarsemana_Click);
            // 
            // btnagregafecha
            // 
            this.btnagregafecha.Location = new System.Drawing.Point(359, 15);
            this.btnagregafecha.Name = "btnagregafecha";
            this.btnagregafecha.Size = new System.Drawing.Size(69, 23);
            this.btnagregafecha.TabIndex = 7;
            this.btnagregafecha.Text = "AGr Fecha";
            this.btnagregafecha.UseVisualStyleBackColor = true;
            this.btnagregafecha.Click += new System.EventHandler(this.btnagregafecha_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(519, 45);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(21, 13);
            this.label8.TabIndex = 5;
            this.label8.Text = "dia";
            this.label8.Visible = false;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(519, 21);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(21, 13);
            this.label6.TabIndex = 5;
            this.label6.Text = "dia";
            this.label6.Visible = false;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(267, 18);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(21, 13);
            this.label4.TabIndex = 5;
            this.label4.Text = "dia";
            // 
            // numdiamescomer
            // 
            this.numdiamescomer.Location = new System.Drawing.Point(541, 43);
            this.numdiamescomer.Maximum = new decimal(new int[] {
            365,
            0,
            0,
            0});
            this.numdiamescomer.Minimum = new decimal(new int[] {
            365,
            0,
            0,
            -2147483648});
            this.numdiamescomer.Name = "numdiamescomer";
            this.numdiamescomer.Size = new System.Drawing.Size(59, 20);
            this.numdiamescomer.TabIndex = 4;
            this.numdiamescomer.Visible = false;
            // 
            // numdiasemana
            // 
            this.numdiasemana.Location = new System.Drawing.Point(541, 19);
            this.numdiasemana.Maximum = new decimal(new int[] {
            365,
            0,
            0,
            0});
            this.numdiasemana.Minimum = new decimal(new int[] {
            365,
            0,
            0,
            -2147483648});
            this.numdiasemana.Name = "numdiasemana";
            this.numdiasemana.Size = new System.Drawing.Size(59, 20);
            this.numdiasemana.TabIndex = 4;
            this.numdiasemana.Visible = false;
            // 
            // numdia
            // 
            this.numdia.Location = new System.Drawing.Point(289, 16);
            this.numdia.Maximum = new decimal(new int[] {
            365,
            0,
            0,
            0});
            this.numdia.Minimum = new decimal(new int[] {
            365,
            0,
            0,
            -2147483648});
            this.numdia.Name = "numdia";
            this.numdia.Size = new System.Drawing.Size(59, 20);
            this.numdia.TabIndex = 4;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(439, 45);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(79, 13);
            this.label7.TabIndex = 2;
            this.label7.Text = "Mes Comercial:";
            this.label7.Visible = false;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(60, 76);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(37, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Texto:";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(469, 21);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(49, 13);
            this.label5.TabIndex = 2;
            this.label5.Text = "Semana:";
            this.label5.Visible = false;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(15, 18);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(87, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Fecha Dinamica:";
            // 
            // txtformato
            // 
            this.txtformato.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtformato.Location = new System.Drawing.Point(7, 145);
            this.txtformato.Multiline = true;
            this.txtformato.Name = "txtformato";
            this.txtformato.ReadOnly = true;
            this.txtformato.Size = new System.Drawing.Size(398, 88);
            this.txtformato.TabIndex = 1;
            this.txtformato.MouseDoubleClick += new System.Windows.Forms.MouseEventHandler(this.txtformato_MouseDoubleClick);
            // 
            // cbofechaformat
            // 
            this.cbofechaformat.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbofechaformat.FormattingEnabled = true;
            this.cbofechaformat.Items.AddRange(new object[] {
            "yyyyMMdd",
            "yyMMdd",
            "yyMM",
            "MMdd",
            "dd",
            "ddd",
            "MM",
            "MMM",
            "yy",
            "yyyy",
            "ddMMyyyy",
            "ddMMyy",
            "ddMM",
            "MMyyyy",
            "MMyy",
            "yyyyMMM",
            "yyMMM",
            "yy_MMM",
            "yyyy_MMM",
            "yyyy-MMM",
            "yy-MM",
            "MMM_dd",
            "MM_dd",
            "MM-dd",
            "MMM_dd",
            "MMM-ddd",
            "MM-ddd",
            "MMM_ddd",
            "MM_ddd",
            "MMMM",
            "dddd",
            "MMMM_dddd",
            "MMMM-dddd",
            "yyyy-MMM",
            "yyyy-MMMM",
            "yyyy_MMMM",
            "yy_MMMM",
            "yyyy_MMMM_dddd",
            "yyyy-MMMM-dddd",
            "yyyyMMMMdddd",
            "yyyy-MM-dd"});
            this.cbofechaformat.Location = new System.Drawing.Point(105, 15);
            this.cbofechaformat.Name = "cbofechaformat";
            this.cbofechaformat.Size = new System.Drawing.Size(156, 21);
            this.cbofechaformat.TabIndex = 0;
            // 
            // btnaceptar
            // 
            this.btnaceptar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnaceptar.Location = new System.Drawing.Point(696, 257);
            this.btnaceptar.Name = "btnaceptar";
            this.btnaceptar.Size = new System.Drawing.Size(75, 24);
            this.btnaceptar.TabIndex = 40;
            this.btnaceptar.Text = "Aceptar";
            this.btnaceptar.UseVisualStyleBackColor = true;
            this.btnaceptar.Click += new System.EventHandler(this.btnaceptar_Click);
            // 
            // btnlimpiar
            // 
            this.btnlimpiar.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.btnlimpiar.Location = new System.Drawing.Point(19, 258);
            this.btnlimpiar.Name = "btnlimpiar";
            this.btnlimpiar.Size = new System.Drawing.Size(75, 23);
            this.btnlimpiar.TabIndex = 40;
            this.btnlimpiar.Text = "Limpiar";
            this.btnlimpiar.UseVisualStyleBackColor = true;
            this.btnlimpiar.Click += new System.EventHandler(this.btnlimpiar_Click);
            // 
            // frmcreararchivo
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(793, 293);
            this.Controls.Add(this.btnlimpiar);
            this.Controls.Add(this.btnaceptar);
            this.Controls.Add(this.groupBox1);
            this.Name = "frmcreararchivo";
            this.Text = "Formato Texto";
            this.Load += new System.EventHandler(this.frmcreararchivo_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numdiamescomer)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numdiasemana)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numdia)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txttexto;
        private System.Windows.Forms.Button btnagregatexto;
        private System.Windows.Forms.Button btnagregarmescomer;
        private System.Windows.Forms.Button btnagregarsemana;
        private System.Windows.Forms.Button btnagregafecha;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.NumericUpDown numdiamescomer;
        private System.Windows.Forms.NumericUpDown numdiasemana;
        private System.Windows.Forms.NumericUpDown numdia;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtformato;
        private System.Windows.Forms.ComboBox cbofechaformat;
        private System.Windows.Forms.TextBox txtdato;
        public System.Windows.Forms.Button btnaceptar;
        private System.Windows.Forms.Button btnlimpiar;
    }
}