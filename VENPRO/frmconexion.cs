using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;

namespace VENPRO
{
    public partial class frmconexion : Form
    {
        public frmconexion()
        {
            InitializeComponent();
        }

        VENPRO.cllog cllog = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();

        public static Int64 g_codigo = -1;
        private void frmconexion_Load(object sender, EventArgs e)
        {
            this.dtg.Columns.Add("COD", "COD");
            this.dtg.Columns.Add("Nombre", "Nombre");
            this.dtg.Columns.Add("TipoConexion", "TipoConexion");
            this.dtg.Columns.Add("ConexionString", "ConexionString");
            this.dtg.Columns[0].DataPropertyName = "codconexionbd";
            this.dtg.Columns[1].DataPropertyName = "nomconexion";
            this.dtg.Columns[2].DataPropertyName = "nomtipoconexion";
            this.dtg.Columns[3].DataPropertyName = "conexion";
            this.dtg.AutoGenerateColumns = false;

            //.....
            SqlConnection cnsql = new SqlConnection();
            MySqlConnection cnmysql = new MySqlConnection();
            switch (globales.Gcxconexiontipovenpro)
            {
                case "SQL":
                    //............                        
                    cnsql = new SqlConnection(clconexion.conexionvenpro);
                    if (cnsql.State != ConnectionState.Open)
                        cnsql.Open();
                    //...........
                    break;

                case "Mysql":
                    //............                        
                    cnmysql = new MySqlConnection(clconexion.conexionvenpro);
                    if (cnmysql.State != ConnectionState.Open)
                        cnmysql.Open();
                    //...........
                    break;
            }

            DataSet ds;
            ds = new DataSet();
            

            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    ds = cldatos_sql.cargar_tipoconexion_sql(cnsql, 0);
                    break;

                case "Mysql":
                    ds = cldatos.cargar_tipoconexion_mysql(cnmysql, 0);
                    break;
            }

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                this.cbotipo.Items.Add(ds.Tables[0].Rows[i]["nomtipoconexion"].ToString());
            }

            //...
            ds = new DataSet();
            
            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    ds = cldatos_sql.cargar_conexionbd_sql(cnsql);
                    break;

                case "Mysql":
                    ds = cldatos.cargar_conexionbd_mysql(cnmysql);
                    break;
            }

           
            dtg.DataSource = ds.Tables[0];
            //...

            //.....
            this.cbotipo.SelectedIndex = -1;
            this.cboejemplo.SelectedIndex = -1;
            this.groupBox1.Enabled = false;
            
        }

        private void btnNuevo_Click(object sender, EventArgs e)
        {
            this.groupBox1.Enabled = true;
            this.btnAgregar.Enabled = true;
            this.btnModificar.Enabled = false;
            this.btnEliminar.Enabled = false;
            this.txtnombre.Text = "";
            this.cbotipo.SelectedIndex = -1;
            this.txtconexion.Text = "";
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {

            if (this.txtnombre.Text=="")
            {
                MessageBox.Show("Por favor ingresar el nombre.");
                this.txtnombre.Focus();
                return;
            }  

             if (this.cbotipo.SelectedIndex == -1)
            {
                MessageBox.Show("Por favor ingresar el tipo de conexion.");
                this.cbotipo.Focus();
                return;
            }

             if (this.txtconexion.Text == "")
             {
                 MessageBox.Show("Por favor ingresar la cadena de conexion.");
                 this.txtconexion.Focus();
                 return;
             } 

            SqlConnection cnsql = new SqlConnection();
            MySqlConnection cnmysql = new MySqlConnection();
            switch (globales.Gcxconexiontipovenpro)
            {
                case "SQL":
                    //............                        
                    cnsql = new SqlConnection(clconexion.conexionvenpro);
                    if (cnsql.State != ConnectionState.Open)
                        cnsql.Open();
                    //...........
                    break;

                case "Mysql":
                    //............                        
                    cnmysql = new MySqlConnection(clconexion.conexionvenpro);
                    if (cnmysql.State != ConnectionState.Open)
                        cnmysql.Open();
                    //...........
                    break;
            }
               

                bool tmp_grabar = false;
                

                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        cldatos_sql.err = "";
                        tmp_grabar = cldatos_sql.insert_conexionbd_sql(cnsql, this.cbotipo.SelectedItem.ToString(), this.txtnombre.Text.Trim(),
                    this.txtconexion.Text.Trim());
                        break;

                    case "Mysql":
                        cldatos.err = "";
                        tmp_grabar = cldatos.insert_conexionbd_mysql(cnmysql, this.cbotipo.SelectedItem.ToString(), this.txtnombre.Text.Trim(),
                    this.txtconexion.Text.Trim());
                        break;
                }

                

                if (!tmp_grabar)
                {

                    string err = "";

                    switch (globales.Gcxconexiontipo)
                    {
                        case "SQL":
                            err = cldatos_sql.err;
                            break;

                        case "Mysql":
                            err = cldatos.err;
                            break;
                    }

                    MessageBox.Show(err);
                }
                else
                {
                    MessageBox.Show("Fue Grabado Correctamente.");
                    //this.Close();
                    this.btnAgregar.Enabled = false;
                    this.groupBox1.Enabled = false;
                    this.btnModificar.Enabled = false;
                    this.btnEliminar.Enabled = false;

                    //...
                    DataSet ds;
                    ds = new DataSet();
                    

                    switch (globales.Gcxconexiontipovenpro)
                    {
                        case "SQL":
                            ds = cldatos_sql.cargar_conexionbd_sql(cnsql);
                            break;

                        case "Mysql":
                            ds = cldatos.cargar_conexionbd_mysql(cnmysql);
                            break;
                    }

                    dtg.DataSource = ds.Tables[0];
                    //...
                }



        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (g_codigo < 0) {
                MessageBox.Show("No se tiene el codigo a actualizar. Intentar nuevamente.");
                return;
            }

            if (this.txtnombre.Text == "")
            {
                MessageBox.Show("Por favor ingresar el nombre.");
                this.txtnombre.Focus();
                return;
            }

            if (this.cbotipo.SelectedIndex == -1)
            {
                MessageBox.Show("Por favor ingresar el tipo de conexion.");
                this.cbotipo.Focus();
                return;
            }

            if (this.txtconexion.Text == "")
            {
                MessageBox.Show("Por favor ingresar la cadena de conexion.");
                this.txtconexion.Focus();
                return;
            }

            SqlConnection cnsql = new SqlConnection();
            MySqlConnection cnmysql = new MySqlConnection();
            switch (globales.Gcxconexiontipovenpro)
            {
                case "SQL":
                    //............                        
                    cnsql = new SqlConnection(clconexion.conexionvenpro);
                    if (cnsql.State != ConnectionState.Open)
                        cnsql.Open();
                    //...........
                    break;

                case "Mysql":
                    //............                        
                    cnmysql = new MySqlConnection(clconexion.conexionvenpro);
                    if (cnmysql.State != ConnectionState.Open)
                        cnmysql.Open();
                    //...........
                    break;
            }


            bool tmp_grabar = false;
            

            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    cldatos_sql.err = "";
                    break;

                case "Mysql":
                    cldatos.err = "";
                    break;
            }
           
            switch (globales.Gcxconexiontipovenpro)
            {
                case "SQL":
                    tmp_grabar = cldatos_sql.update_conexionbd_sql(cnsql, g_codigo, this.cbotipo.SelectedItem.ToString(), this.txtnombre.Text.Trim(),
                this.txtconexion.Text.Trim());
                    break;

                case "Mysql":
                    tmp_grabar = cldatos.update_conexionbd_mysql(cnmysql, g_codigo, this.cbotipo.SelectedItem.ToString(), this.txtnombre.Text.Trim(),
                this.txtconexion.Text.Trim());
                    break;
            }

            if (!tmp_grabar)
            {
                string err = "";

                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        err = cldatos_sql.err;
                        break;

                    case "Mysql":
                        err = cldatos.err;
                        break;
                }

                MessageBox.Show(err);
                this.btnModificar.Enabled = false;
                this.groupBox1.Enabled = false;

                
            }
            else
            {
                MessageBox.Show("Fue Actualizado Correctamente.");
                //this.Close();
                this.btnModificar.Enabled = false;
                this.btnAgregar.Enabled = false;
                this.btnEliminar.Enabled = false;
                this.groupBox1.Enabled = false;

                //...
                DataSet ds;
                ds = new DataSet();
                
                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        ds = cldatos_sql.cargar_conexionbd_sql(cnsql);
                        break;

                    case "Mysql":
                        ds = cldatos.cargar_conexionbd_mysql(cnmysql);
                        break;
                }

                dtg.DataSource = ds.Tables[0];
                //...
            }
            g_codigo = -1;


        }

        private void dtg_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {

            if (dtg.RowCount > 0)
            {
                string t_codigo = dtg.Rows[e.RowIndex].Cells[0].Value.ToString();
                string t_nombre = dtg.Rows[e.RowIndex].Cells[1].Value.ToString();
                string t_tipoconexion = dtg.Rows[e.RowIndex].Cells[2].Value.ToString();
                string t_conexion = dtg.Rows[e.RowIndex].Cells[3].Value.ToString();


                g_codigo = Convert.ToInt64(t_codigo);
                this.txtnombre.Text = t_nombre;
                this.cbotipo.SelectedItem = t_tipoconexion;
                this.txtconexion.Text = t_conexion;

                this.groupBox1.Enabled = true;
                this.btnModificar.Enabled = true;
                this.btnAgregar.Enabled = false;
                this.btnEliminar.Enabled = false;
                
            }

        }

        private void btntestconexion_Click(object sender, EventArgs e)
        {

            if (this.cbotipo.SelectedIndex == -1)
            {
                MessageBox.Show("Por favor ingresar el tipo de conexion.");
                this.cbotipo.Focus();
                return;
            }

             if (this.txtconexion.Text == "")
            {
                MessageBox.Show("Por favor ingresar la cadena de conexion.");
                this.txtconexion.Focus();
                return;
            }
            

            bool tmp_test = false;
            tmp_test = clconexion.testconexionbd(cbotipo.SelectedItem.ToString(), this.txtconexion.Text.Trim());
            if (tmp_test)
            {
                MessageBox.Show("Conexion Satisfactoria.");
            }
            else
            {
                MessageBox.Show("No se pudo conectar, verificar el Log.");
            }

            
        }

        private void btnejemplo_Click(object sender, EventArgs e)
        {
            //EJEMPLO ACCESS
            //EJEMPLO MYSQL
            //EJEMPLO SQL
            //EJEMPLO ORACLE
            //EJEMPLO OTROS

             DialogResult result =MessageBox.Show("Desea Cargar un ejemplo de conexion?","Pregunta",MessageBoxButtons.YesNo);
             if (DialogResult.No == result) {
                 return;
             }

            if (this.cboejemplo.SelectedIndex == -1) {
                MessageBox.Show("Usted no selecciono ningun Ejemplo a cargar.");
                this.cboejemplo.Focus();
                return;
            }

            if (this.cboejemplo.SelectedItem.ToString() == "EJEMPLO ACCESS")
            {
                this.txtconexion.Text = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=D:\BD\access.accdb; Persist Security Info=False;";
                //Provider=Microsoft.Jet.OLEDB.4.0;Data Source=yourdbfile.mdb; Jet OLEDB:Database Password=yourpassword;
            }

            if (this.cboejemplo.SelectedItem.ToString() == "EJEMPLO MYSQL")
            {
                this.txtconexion.Text = @"Server=localhost;Database=BD; User id=root;Password=123; Allow User Variables=True; persist security info=true; default command timeout=30000;";
            }

            if (this.cboejemplo.SelectedItem.ToString() == "EJEMPLO SQL")
            {
                this.txtconexion.Text = @"Data Source=localhost;Initial Catalog=BD;Integrated Security=True;";
            }

            //if (this.cboejemplo.SelectedItem.ToString() == "EJEMPLO ORACLE")
            //{
            //    this.txtconexion.Text = @"Driver={Microsoft ODBC for Oracle};Server=myOracleServer; UID=demo;PWD=demo;";
            //}

            if (this.cboejemplo.SelectedItem.ToString() == "EJEMPLO OTROS")
            {
                this.txtconexion.Text = @"dsn=pruebabd;UID=;PWD=;";
            }
        }



    }
}
