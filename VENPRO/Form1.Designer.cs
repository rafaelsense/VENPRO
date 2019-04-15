namespace VENPRO
{
    partial class Form1
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea2 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend2 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series3 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.Series series4 = new System.Windows.Forms.DataVisualization.Charting.Series();
            System.Windows.Forms.DataVisualization.Charting.Title title2 = new System.Windows.Forms.DataVisualization.Charting.Title();
            this.txtmensaje = new System.Windows.Forms.TextBox();
            this.Label9 = new System.Windows.Forms.Label();
            this.Timer1 = new System.Windows.Forms.Timer(this.components);
            this.grbdatos = new System.Windows.Forms.GroupBox();
            this.lbltiempo = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.lblulttrataarchivo = new System.Windows.Forms.Label();
            this.lbltextotrata = new System.Windows.Forms.Label();
            this.lblrutadescarga = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.btndescargar = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.btnprocesar = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.btndescargamanual = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripLabel2 = new System.Windows.Forms.ToolStripLabel();
            this.tooltimeractivo = new System.Windows.Forms.ToolStripLabel();
            this.toolhora = new System.Windows.Forms.ToolStripLabel();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripDropDownButton1 = new System.Windows.Forms.ToolStripDropDownButton();
            this.tiendasToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.estructuraToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.tablasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.columnasToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem4 = new System.Windows.Forms.ToolStripSeparator();
            this.conexionToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.actualizarToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tiendasActivasToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem5 = new System.Windows.Forms.ToolStripSeparator();
            this.tablasActivasToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
            this.accionesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.elimBackArchToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripSeparator();
            this.reprocesoDatosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
            this.timer2 = new System.Windows.Forms.Timer(this.components);
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.lblhoraserv = new System.Windows.Forms.Label();
            this.PictureBox1 = new System.Windows.Forms.PictureBox();
            this.grbdatos.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.PictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // txtmensaje
            // 
            this.txtmensaje.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtmensaje.BackColor = System.Drawing.Color.WhiteSmoke;
            this.txtmensaje.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtmensaje.ForeColor = System.Drawing.Color.Black;
            this.txtmensaje.Location = new System.Drawing.Point(7, 343);
            this.txtmensaje.Multiline = true;
            this.txtmensaje.Name = "txtmensaje";
            this.txtmensaje.ReadOnly = true;
            this.txtmensaje.ScrollBars = System.Windows.Forms.ScrollBars.Both;
            this.txtmensaje.Size = new System.Drawing.Size(739, 96);
            this.txtmensaje.TabIndex = 19;
            // 
            // Label9
            // 
            this.Label9.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.Label9.AutoSize = true;
            this.Label9.Font = new System.Drawing.Font("Modern No. 20", 8.249999F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Label9.ForeColor = System.Drawing.SystemColors.AppWorkspace;
            this.Label9.Location = new System.Drawing.Point(689, 442);
            this.Label9.Name = "Label9";
            this.Label9.Size = new System.Drawing.Size(62, 14);
            this.Label9.TabIndex = 32;
            this.Label9.Text = "By M@rcelo";
            // 
            // Timer1
            // 
            this.Timer1.Interval = 60000;
            this.Timer1.Tick += new System.EventHandler(this.Timer1_Tick);
            // 
            // grbdatos
            // 
            this.grbdatos.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.grbdatos.Controls.Add(this.lbltiempo);
            this.grbdatos.Controls.Add(this.label2);
            this.grbdatos.Controls.Add(this.lblulttrataarchivo);
            this.grbdatos.Controls.Add(this.lbltextotrata);
            this.grbdatos.Controls.Add(this.lblrutadescarga);
            this.grbdatos.Controls.Add(this.label1);
            this.grbdatos.Location = new System.Drawing.Point(7, 42);
            this.grbdatos.Name = "grbdatos";
            this.grbdatos.Size = new System.Drawing.Size(736, 49);
            this.grbdatos.TabIndex = 35;
            this.grbdatos.TabStop = false;
            // 
            // lbltiempo
            // 
            this.lbltiempo.AutoSize = true;
            this.lbltiempo.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbltiempo.ForeColor = System.Drawing.Color.Gray;
            this.lbltiempo.Location = new System.Drawing.Point(634, 12);
            this.lbltiempo.Name = "lbltiempo";
            this.lbltiempo.Size = new System.Drawing.Size(42, 12);
            this.lbltiempo.TabIndex = 1;
            this.lbltiempo.Text = "lbltiempo";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.Gray;
            this.label2.Location = new System.Drawing.Point(610, 12);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(24, 12);
            this.label2.TabIndex = 0;
            this.label2.Text = "Min:";
            // 
            // lblulttrataarchivo
            // 
            this.lblulttrataarchivo.AutoSize = true;
            this.lblulttrataarchivo.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblulttrataarchivo.ForeColor = System.Drawing.Color.Gray;
            this.lblulttrataarchivo.Location = new System.Drawing.Point(95, 28);
            this.lblulttrataarchivo.Name = "lblulttrataarchivo";
            this.lblulttrataarchivo.Size = new System.Drawing.Size(74, 12);
            this.lblulttrataarchivo.TabIndex = 1;
            this.lblulttrataarchivo.Text = "lblulttrataarchivo";
            // 
            // lbltextotrata
            // 
            this.lbltextotrata.AutoSize = true;
            this.lbltextotrata.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbltextotrata.ForeColor = System.Drawing.Color.Gray;
            this.lbltextotrata.Location = new System.Drawing.Point(3, 28);
            this.lbltextotrata.Name = "lbltextotrata";
            this.lbltextotrata.Size = new System.Drawing.Size(86, 12);
            this.lbltextotrata.TabIndex = 0;
            this.lbltextotrata.Text = "Ult Elim/Back Arch:";
            // 
            // lblrutadescarga
            // 
            this.lblrutadescarga.AutoSize = true;
            this.lblrutadescarga.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblrutadescarga.ForeColor = System.Drawing.Color.Gray;
            this.lblrutadescarga.Location = new System.Drawing.Point(42, 12);
            this.lblrutadescarga.Name = "lblrutadescarga";
            this.lblrutadescarga.Size = new System.Drawing.Size(68, 12);
            this.lblrutadescarga.TabIndex = 1;
            this.lblrutadescarga.Text = "lblrutadescarga";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Gray;
            this.label1.Location = new System.Drawing.Point(3, 12);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(28, 12);
            this.label1.TabIndex = 0;
            this.label1.Text = "Ruta:";
            // 
            // toolStrip1
            // 
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btndescargar,
            this.toolStripSeparator1,
            this.btnprocesar,
            this.toolStripSeparator2,
            this.btndescargamanual,
            this.toolStripSeparator3,
            this.toolStripLabel2,
            this.tooltimeractivo,
            this.toolhora,
            this.toolStripLabel1,
            this.toolStripSeparator4,
            this.toolStripDropDownButton1,
            this.toolStripSeparator5});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(750, 39);
            this.toolStrip1.TabIndex = 36;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // btndescargar
            // 
            this.btndescargar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btndescargar.Image = ((System.Drawing.Image)(resources.GetObject("btndescargar.Image")));
            this.btndescargar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btndescargar.Name = "btndescargar";
            this.btndescargar.Size = new System.Drawing.Size(36, 36);
            this.btndescargar.Text = "Descargar";
            this.btndescargar.ToolTipText = "Descargar los archivos XML del servidor";
            this.btndescargar.Click += new System.EventHandler(this.btndescargar_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(6, 39);
            // 
            // btnprocesar
            // 
            this.btnprocesar.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnprocesar.Image = ((System.Drawing.Image)(resources.GetObject("btnprocesar.Image")));
            this.btnprocesar.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnprocesar.Name = "btnprocesar";
            this.btnprocesar.Size = new System.Drawing.Size(36, 36);
            this.btnprocesar.Text = "Procesar";
            this.btnprocesar.ToolTipText = "Procesa los archivos XML a la BD";
            this.btnprocesar.Click += new System.EventHandler(this.btnprocesar_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(6, 39);
            // 
            // btndescargamanual
            // 
            this.btndescargamanual.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btndescargamanual.Image = ((System.Drawing.Image)(resources.GetObject("btndescargamanual.Image")));
            this.btndescargamanual.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btndescargamanual.Name = "btndescargamanual";
            this.btndescargamanual.Size = new System.Drawing.Size(36, 36);
            this.btndescargamanual.Text = "Descarga por Tiendas";
            this.btndescargamanual.ToolTipText = "Descarga en forma manual\r\nlas tiendas seleccionadas.";
            this.btndescargamanual.Click += new System.EventHandler(this.btndescargamanual_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(6, 39);
            // 
            // toolStripLabel2
            // 
            this.toolStripLabel2.Name = "toolStripLabel2";
            this.toolStripLabel2.Size = new System.Drawing.Size(34, 36);
            this.toolStripLabel2.Text = "         ";
            // 
            // tooltimeractivo
            // 
            this.tooltimeractivo.ActiveLinkColor = System.Drawing.Color.Red;
            this.tooltimeractivo.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.tooltimeractivo.DoubleClickEnabled = true;
            this.tooltimeractivo.Image = global::VENPRO.Properties.Resources.desac;
            this.tooltimeractivo.Name = "tooltimeractivo";
            this.tooltimeractivo.Size = new System.Drawing.Size(32, 36);
            this.tooltimeractivo.Text = "Evento Timer Activo";
            this.tooltimeractivo.ToolTipText = "Evento Tiempo Activo para descarga y procesamiento de datos";
            this.tooltimeractivo.DoubleClick += new System.EventHandler(this.tooltimeractivo_DoubleClick);
            // 
            // toolhora
            // 
            this.toolhora.Name = "toolhora";
            this.toolhora.Size = new System.Drawing.Size(44, 36);
            this.toolhora.Text = "lblhora";
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(34, 36);
            this.toolStripLabel1.Text = "         ";
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(6, 39);
            // 
            // toolStripDropDownButton1
            // 
            this.toolStripDropDownButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripDropDownButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tiendasToolStripMenuItem1,
            this.estructuraToolStripMenuItem1,
            this.toolStripMenuItem4,
            this.conexionToolStripMenuItem1,
            this.actualizarToolStripMenuItem,
            this.toolStripMenuItem1,
            this.accionesToolStripMenuItem});
            this.toolStripDropDownButton1.Image = ((System.Drawing.Image)(resources.GetObject("toolStripDropDownButton1.Image")));
            this.toolStripDropDownButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton1.Name = "toolStripDropDownButton1";
            this.toolStripDropDownButton1.Size = new System.Drawing.Size(45, 36);
            this.toolStripDropDownButton1.Text = "Configuracion";
            // 
            // tiendasToolStripMenuItem1
            // 
            this.tiendasToolStripMenuItem1.Name = "tiendasToolStripMenuItem1";
            this.tiendasToolStripMenuItem1.Size = new System.Drawing.Size(127, 22);
            this.tiendasToolStripMenuItem1.Text = "Tiendas";
            this.tiendasToolStripMenuItem1.Click += new System.EventHandler(this.tiendasToolStripMenuItem1_Click);
            // 
            // estructuraToolStripMenuItem1
            // 
            this.estructuraToolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tablasToolStripMenuItem,
            this.columnasToolStripMenuItem1});
            this.estructuraToolStripMenuItem1.Name = "estructuraToolStripMenuItem1";
            this.estructuraToolStripMenuItem1.Size = new System.Drawing.Size(127, 22);
            this.estructuraToolStripMenuItem1.Text = "Estructura";
            // 
            // tablasToolStripMenuItem
            // 
            this.tablasToolStripMenuItem.Name = "tablasToolStripMenuItem";
            this.tablasToolStripMenuItem.Size = new System.Drawing.Size(128, 22);
            this.tablasToolStripMenuItem.Text = "Tablas";
            this.tablasToolStripMenuItem.Click += new System.EventHandler(this.tablasToolStripMenuItem_Click);
            // 
            // columnasToolStripMenuItem1
            // 
            this.columnasToolStripMenuItem1.Name = "columnasToolStripMenuItem1";
            this.columnasToolStripMenuItem1.Size = new System.Drawing.Size(128, 22);
            this.columnasToolStripMenuItem1.Text = "Columnas";
            this.columnasToolStripMenuItem1.Click += new System.EventHandler(this.columnasToolStripMenuItem1_Click);
            // 
            // toolStripMenuItem4
            // 
            this.toolStripMenuItem4.Name = "toolStripMenuItem4";
            this.toolStripMenuItem4.Size = new System.Drawing.Size(124, 6);
            // 
            // conexionToolStripMenuItem1
            // 
            this.conexionToolStripMenuItem1.Name = "conexionToolStripMenuItem1";
            this.conexionToolStripMenuItem1.Size = new System.Drawing.Size(127, 22);
            this.conexionToolStripMenuItem1.Text = "conexion";
            // 
            // actualizarToolStripMenuItem
            // 
            this.actualizarToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.tiendasActivasToolStripMenuItem1,
            this.toolStripMenuItem5,
            this.tablasActivasToolStripMenuItem1});
            this.actualizarToolStripMenuItem.Name = "actualizarToolStripMenuItem";
            this.actualizarToolStripMenuItem.Size = new System.Drawing.Size(127, 22);
            this.actualizarToolStripMenuItem.Text = "Actualizar";
            // 
            // tiendasActivasToolStripMenuItem1
            // 
            this.tiendasActivasToolStripMenuItem1.Name = "tiendasActivasToolStripMenuItem1";
            this.tiendasActivasToolStripMenuItem1.Size = new System.Drawing.Size(156, 22);
            this.tiendasActivasToolStripMenuItem1.Text = "Tiendas Activas";
            this.tiendasActivasToolStripMenuItem1.Click += new System.EventHandler(this.tiendasActivasToolStripMenuItem1_Click);
            // 
            // toolStripMenuItem5
            // 
            this.toolStripMenuItem5.Name = "toolStripMenuItem5";
            this.toolStripMenuItem5.Size = new System.Drawing.Size(153, 6);
            // 
            // tablasActivasToolStripMenuItem1
            // 
            this.tablasActivasToolStripMenuItem1.Name = "tablasActivasToolStripMenuItem1";
            this.tablasActivasToolStripMenuItem1.Size = new System.Drawing.Size(156, 22);
            this.tablasActivasToolStripMenuItem1.Text = "Tablas Activas";
            this.tablasActivasToolStripMenuItem1.Click += new System.EventHandler(this.tablasActivasToolStripMenuItem1_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(124, 6);
            // 
            // accionesToolStripMenuItem
            // 
            this.accionesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.elimBackArchToolStripMenuItem,
            this.toolStripMenuItem2,
            this.reprocesoDatosToolStripMenuItem});
            this.accionesToolStripMenuItem.Name = "accionesToolStripMenuItem";
            this.accionesToolStripMenuItem.Size = new System.Drawing.Size(127, 22);
            this.accionesToolStripMenuItem.Text = "Acciones";
            // 
            // elimBackArchToolStripMenuItem
            // 
            this.elimBackArchToolStripMenuItem.Name = "elimBackArchToolStripMenuItem";
            this.elimBackArchToolStripMenuItem.Size = new System.Drawing.Size(162, 22);
            this.elimBackArchToolStripMenuItem.Text = "Elim/Back Arch";
            this.elimBackArchToolStripMenuItem.Click += new System.EventHandler(this.elimBackArchToolStripMenuItem_Click);
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(159, 6);
            // 
            // reprocesoDatosToolStripMenuItem
            // 
            this.reprocesoDatosToolStripMenuItem.Name = "reprocesoDatosToolStripMenuItem";
            this.reprocesoDatosToolStripMenuItem.Size = new System.Drawing.Size(162, 22);
            this.reprocesoDatosToolStripMenuItem.Text = "Reproceso Datos";
            this.reprocesoDatosToolStripMenuItem.Click += new System.EventHandler(this.reprocesoDatosToolStripMenuItem_Click);
            // 
            // toolStripSeparator5
            // 
            this.toolStripSeparator5.Name = "toolStripSeparator5";
            this.toolStripSeparator5.Size = new System.Drawing.Size(6, 39);
            // 
            // timer2
            // 
            this.timer2.Enabled = true;
            this.timer2.Interval = 60000;
            this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
            // 
            // chart1
            // 
            this.chart1.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            chartArea2.AxisX.IsLabelAutoFit = false;
            chartArea2.AxisX.IsMarginVisible = false;
            chartArea2.AxisX.LabelStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            chartArea2.AxisX.LabelStyle.ForeColor = System.Drawing.Color.DimGray;
            chartArea2.AxisX.MajorGrid.Enabled = false;
            chartArea2.AxisX.MinorTickMark.Enabled = true;
            chartArea2.AxisX.ScaleBreakStyle.Spacing = 1D;
            chartArea2.AxisX.TextOrientation = System.Windows.Forms.DataVisualization.Charting.TextOrientation.Horizontal;
            chartArea2.AxisX.Title = "Minutos";
            chartArea2.AxisX.TitleFont = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            chartArea2.AxisX.TitleForeColor = System.Drawing.Color.DimGray;
            chartArea2.AxisY.IsLabelAutoFit = false;
            chartArea2.AxisY.LabelStyle.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            chartArea2.AxisY.LabelStyle.ForeColor = System.Drawing.Color.DimGray;
            chartArea2.AxisY.LineWidth = 0;
            chartArea2.AxisY.TextOrientation = System.Windows.Forms.DataVisualization.Charting.TextOrientation.Rotated270;
            chartArea2.AxisY.Title = "Archivos Procesado";
            chartArea2.AxisY.TitleFont = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            chartArea2.AxisY.TitleForeColor = System.Drawing.Color.DarkGreen;
            chartArea2.AxisY2.TextOrientation = System.Windows.Forms.DataVisualization.Charting.TextOrientation.Rotated90;
            chartArea2.AxisY2.Title = "Archivos Descargados";
            chartArea2.AxisY2.TitleFont = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            chartArea2.AxisY2.TitleForeColor = System.Drawing.Color.Teal;
            chartArea2.BackImageWrapMode = System.Windows.Forms.DataVisualization.Charting.ChartImageWrapMode.Scaled;
            chartArea2.BorderDashStyle = System.Windows.Forms.DataVisualization.Charting.ChartDashStyle.DashDotDot;
            chartArea2.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea2);
            legend2.Enabled = false;
            legend2.Name = "Legend1";
            this.chart1.Legends.Add(legend2);
            this.chart1.Location = new System.Drawing.Point(-25, 92);
            this.chart1.Name = "chart1";
            this.chart1.Palette = System.Windows.Forms.DataVisualization.Charting.ChartColorPalette.Bright;
            series3.BorderWidth = 4;
            series3.ChartArea = "ChartArea1";
            series3.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series3.Color = System.Drawing.Color.ForestGreen;
            series3.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            series3.IsValueShownAsLabel = true;
            series3.IsVisibleInLegend = false;
            series3.LabelForeColor = System.Drawing.Color.DimGray;
            series3.Legend = "Legend1";
            series3.Name = "Series1";
            series4.BorderWidth = 4;
            series4.ChartArea = "ChartArea1";
            series4.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series4.Color = System.Drawing.Color.CadetBlue;
            series4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            series4.IsValueShownAsLabel = true;
            series4.IsVisibleInLegend = false;
            series4.LabelBorderColor = System.Drawing.Color.Teal;
            series4.LabelForeColor = System.Drawing.Color.DimGray;
            series4.Legend = "Legend1";
            series4.Name = "Series2";
            series4.YAxisType = System.Windows.Forms.DataVisualization.Charting.AxisType.Secondary;
            this.chart1.Series.Add(series3);
            this.chart1.Series.Add(series4);
            this.chart1.Size = new System.Drawing.Size(794, 251);
            this.chart1.TabIndex = 37;
            this.chart1.Text = "chart1";
            title2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            title2.Name = "Historico";
            title2.TextStyle = System.Windows.Forms.DataVisualization.Charting.TextStyle.Shadow;
            title2.Visible = false;
            this.chart1.Titles.Add(title2);
            // 
            // lblhoraserv
            // 
            this.lblhoraserv.AutoSize = true;
            this.lblhoraserv.Font = new System.Drawing.Font("Microsoft Sans Serif", 6.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblhoraserv.Location = new System.Drawing.Point(9, 445);
            this.lblhoraserv.Name = "lblhoraserv";
            this.lblhoraserv.Size = new System.Drawing.Size(51, 12);
            this.lblhoraserv.TabIndex = 38;
            this.lblhoraserv.Text = "lblhoraserv";
            // 
            // PictureBox1
            // 
            this.PictureBox1.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.PictureBox1.ErrorImage = null;
            this.PictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("PictureBox1.Image")));
            this.PictureBox1.Location = new System.Drawing.Point(716, 0);
            this.PictureBox1.Name = "PictureBox1";
            this.PictureBox1.Size = new System.Drawing.Size(30, 25);
            this.PictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.PictureBox1.TabIndex = 31;
            this.PictureBox1.TabStop = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(750, 461);
            this.Controls.Add(this.lblhoraserv);
            this.Controls.Add(this.chart1);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.PictureBox1);
            this.Controls.Add(this.grbdatos);
            this.Controls.Add(this.txtmensaje);
            this.Controls.Add(this.Label9);
            this.Name = "Form1";
            this.Text = "**VENPRO x64** V1.3.7";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.grbdatos.ResumeLayout(false);
            this.grbdatos.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.PictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        internal System.Windows.Forms.TextBox txtmensaje;
        internal System.Windows.Forms.Label Label9;
        internal System.Windows.Forms.PictureBox PictureBox1;
        private System.Windows.Forms.GroupBox grbdatos;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton btndescargar;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripButton btnprocesar;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripButton btndescargamanual;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton1;
        private System.Windows.Forms.ToolStripMenuItem tiendasToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem estructuraToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem tablasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem columnasToolStripMenuItem1;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem4;
        private System.Windows.Forms.ToolStripMenuItem conexionToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem actualizarToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem tiendasActivasToolStripMenuItem1;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem5;
        private System.Windows.Forms.ToolStripMenuItem tablasActivasToolStripMenuItem1;
        private System.Windows.Forms.Label lblrutadescarga;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.Label lbltiempo;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        public System.Windows.Forms.Timer Timer1;
        private System.Windows.Forms.ToolStripLabel toolStripLabel2;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
        private System.Windows.Forms.ToolStripLabel toolhora;
        private System.Windows.Forms.ToolStripLabel tooltimeractivo;
        private System.Windows.Forms.Timer timer2;
        private System.Windows.Forms.Label lblulttrataarchivo;
        private System.Windows.Forms.Label lbltextotrata;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem accionesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem elimBackArchToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem reprocesoDatosToolStripMenuItem;
        private System.Windows.Forms.Label lblhoraserv;
    }
}

