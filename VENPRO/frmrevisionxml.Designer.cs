namespace VENPRO
{
    partial class frmrevisionxml
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
            this.dtg = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.dtgcampos = new System.Windows.Forms.DataGridView();
            this.lblcantxml = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lbltotxml = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dtg)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgcampos)).BeginInit();
            this.SuspendLayout();
            // 
            // dtg
            // 
            this.dtg.AllowUserToAddRows = false;
            this.dtg.AllowUserToDeleteRows = false;
            this.dtg.AllowUserToResizeRows = false;
            this.dtg.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)));
            this.dtg.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dtg.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dtg.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtg.Location = new System.Drawing.Point(12, 129);
            this.dtg.MultiSelect = false;
            this.dtg.Name = "dtg";
            this.dtg.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtg.ShowCellErrors = false;
            this.dtg.ShowCellToolTips = false;
            this.dtg.ShowEditingIcon = false;
            this.dtg.ShowRowErrors = false;
            this.dtg.Size = new System.Drawing.Size(252, 274);
            this.dtg.TabIndex = 48;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(102, 13);
            this.label1.TabIndex = 49;
            this.label1.Text = "Ruta Revision XML:";
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(116, 19);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(453, 20);
            this.textBox1.TabIndex = 50;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.textBox1);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(12, 26);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(588, 53);
            this.groupBox1.TabIndex = 51;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Paso1";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(12, 89);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(205, 23);
            this.button1.TabIndex = 52;
            this.button1.Text = "Buscar Modificaciones Ultima Revision";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // dtgcampos
            // 
            this.dtgcampos.AllowUserToAddRows = false;
            this.dtgcampos.AllowUserToDeleteRows = false;
            this.dtgcampos.AllowUserToResizeRows = false;
            this.dtgcampos.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.dtgcampos.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.dtgcampos.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dtgcampos.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgcampos.Location = new System.Drawing.Point(281, 129);
            this.dtgcampos.MultiSelect = false;
            this.dtgcampos.Name = "dtgcampos";
            this.dtgcampos.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dtgcampos.ShowCellErrors = false;
            this.dtgcampos.ShowCellToolTips = false;
            this.dtgcampos.ShowEditingIcon = false;
            this.dtgcampos.ShowRowErrors = false;
            this.dtgcampos.Size = new System.Drawing.Size(315, 274);
            this.dtgcampos.TabIndex = 48;
            // 
            // lblcantxml
            // 
            this.lblcantxml.AutoSize = true;
            this.lblcantxml.Location = new System.Drawing.Point(229, 94);
            this.lblcantxml.Name = "lblcantxml";
            this.lblcantxml.Size = new System.Drawing.Size(53, 13);
            this.lblcantxml.TabIndex = 53;
            this.lblcantxml.Text = "lblcantxml";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(310, 94);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(19, 13);
            this.label2.TabIndex = 54;
            this.label2.Text = "de";
            // 
            // lbltotxml
            // 
            this.lbltotxml.AutoSize = true;
            this.lbltotxml.Location = new System.Drawing.Point(372, 94);
            this.lbltotxml.Name = "lbltotxml";
            this.lbltotxml.Size = new System.Drawing.Size(44, 13);
            this.lbltotxml.TabIndex = 55;
            this.lbltotxml.Text = "lbltotxml";
            // 
            // frmrevisionxml
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(608, 415);
            this.Controls.Add(this.lbltotxml);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lblcantxml);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dtgcampos);
            this.Controls.Add(this.dtg);
            this.Name = "frmrevisionxml";
            this.Text = "Revision de Campos XML";
            this.Load += new System.EventHandler(this.frmrevisionxml_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dtg)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgcampos)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dtg;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.DataGridView dtgcampos;
        private System.Windows.Forms.Label lblcantxml;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lbltotxml;
    }
}