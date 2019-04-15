using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace VENPRO
{
    public partial class frmconsultartiendas : Form
    {
        public static Boolean boolModCajas = false;
        public static string Mnomobj;
        public static string archcensado="";

        //public static frmconsultartiendas f1;
        public frmconsultartiendas()
        {
            InitializeComponent();
            //frmconsultartiendas.f1 = this;
        }

        VENPRO.cllog cllog = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();

        public  bool rs = false;
        public DataTable g_lista = new DataTable();

        private void cargardtg()
        {
            try
            {

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

                this.btnModificar.Enabled = false;
                DataSet ds;
                ds = new DataSet();
                

                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        ds = cldatos_sql.cargar_tienda_sql(cnsql, this.txtnombre.Text.Trim());
                        break;

                    case "Mysql":
                        ds = cldatos.cargar_tienda_mysql(cnmysql, this.txtnombre.Text.Trim());
                        break;
                }

                if (ds.Tables[0].Rows.Count > 0)
                {
                    //dtg.DataSource = null;
                    dtg.DataSource = ds.Tables[0];


                }
                else
                {
                    dtg.DataSource = null;
                    //MessageBox.Show(cldatos.err);
                }

                //Cerrar conexion....
                if (cnmysql.State != ConnectionState.Closed) {
                    cnmysql.Close();
                    cnmysql.ClearAllPoolsAsync();
                    cnmysql.Dispose();                    
                }                 
                //............
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                globales.escribirLOG("Error aplicacion consultartienda.cargardtg(). " + ex.ToString());
                //fin Log...............
            }

        }


        private void deshablitar()
        {
            this.btnModificar.Enabled = false;
            this.btndescargar.Enabled = false;
        }


        private void consultartienda_Load(object sender, EventArgs e)
        {

            try
            {

                DataGridViewCheckBoxColumn chk = new DataGridViewCheckBoxColumn();
                chk.HeaderText = "CHK";
                this.dtg.Columns.Add(chk);
                this.dtg.Columns.Add("COD", "COD");
                this.dtg.Columns.Add("TIENDA", "TIENDA");
                this.dtg.Columns.Add("SERVIDOR", "SERVIDOR");
                this.dtg.Columns.Add("RUTA", "RUTA");
                this.dtg.Columns.Add("USUARIO", "USUARIO");
                this.dtg.Columns.Add("PASS", "PASS");
                this.dtg.Columns.Add("ESTADO", "ESTADO");
                this.dtg.Columns[1].DataPropertyName = "codtienda";
                this.dtg.Columns[2].DataPropertyName = "nomtienda";
                this.dtg.Columns[3].DataPropertyName = "servidor";
                this.dtg.Columns[4].DataPropertyName = "ruta";
                this.dtg.Columns[5].DataPropertyName = "usuario";
                this.dtg.Columns[6].DataPropertyName = "password";
                this.dtg.Columns[7].DataPropertyName = "estado";
                this.dtg.AutoGenerateColumns = false;

                dtg.Columns[0].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[1].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[2].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[3].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[4].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[5].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[6].AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells;
                dtg.Columns[6].Visible = false;

                this.dtg.Columns[0].ReadOnly = false;
                this.dtg.Columns[1].ReadOnly = true;
                this.dtg.Columns[2].ReadOnly = true;
                this.dtg.Columns[3].ReadOnly = true;
                this.dtg.Columns[4].ReadOnly = true;
                this.dtg.Columns[5].ReadOnly = true;
                this.dtg.Columns[6].ReadOnly = true;
                this.dtg.Columns[7].ReadOnly = true;




            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Aplicacion consultartienda.Load(). " + ex.ToString());
            }


        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                frmtienda frm = new frmtienda();
                frm.g_codigo = -1;
                frm.ShowDialog();
                if (frmtienda.boolAgr)
                {
                    //leerconfig();
                    cargardtg();
                    boolModCajas = true;
                    //globales.Reconfigurarcliente();
                    this.btnCambiarEstado.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                globales.escribirLOG("Error aplicacion Consultartienda.Agregar(). " + ex.ToString());
                //fin Log...............
            }     

            

        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {

                //VENPRO BD------------------------

                //    SqlConnection cnsql_venpro = new SqlConnection();
                //    MySqlConnection cnmysql_venpro = new MySqlConnection();
                //    switch (globales.Gcxconexiontipovenpro)
                //    {
                //        case "SQL":
                //            //............                        
                //            cnsql_venpro = new SqlConnection(clconexion.conexionvenpro);
                //            if (cnsql_venpro.State != ConnectionState.Open)
                //                cnsql_venpro.Open();
                //            //...........
                //            break;

                //        case "Mysql":
                //            //............                        
                //            cnmysql_venpro = new MySqlConnection(clconexion.conexionvenpro);
                //            if (cnmysql_venpro.State != ConnectionState.Open)
                //                cnmysql_venpro.Open();
                //            //...........
                //            break;
                //    }

                //    //-----------------------------

                //DataSet ds;
                //ds = new DataSet();
                //ds = cldatos.cargar_nomparam_mysql(cnmysql, t_nombre);

                //Cargar detalle Columnas.....
                int t_codigo = Convert.ToInt32(dtg.Rows[dtg.CurrentRow.Index].Cells[1].Value.ToString());
                string t_nombre = dtg.Rows[dtg.CurrentRow.Index].Cells[2].Value.ToString();
                string t_servidor = dtg.Rows[dtg.CurrentRow.Index].Cells[3].Value.ToString();
                string t_ruta = dtg.Rows[dtg.CurrentRow.Index].Cells[4].Value.ToString();
                string t_usuario = dtg.Rows[dtg.CurrentRow.Index].Cells[5].Value.ToString();
                string t_password = dtg.Rows[dtg.CurrentRow.Index].Cells[6].Value.ToString();
                Boolean t_estado = Convert.ToBoolean(Convert.ToInt32(dtg.Rows[dtg.CurrentRow.Index].Cells[7].Value));

                frmtienda frm = new frmtienda();
                frm.g_codigo = t_codigo;
                frm.txtcodtienda.Text = t_codigo.ToString();
                frm.txtnombre.Text = t_nombre;
                frm.txtservidor.Text = t_servidor;
                frm.txtruta.Text = t_ruta;
                frm.txtusuario.Text = t_usuario;
                frm.txtpass.Text = t_password;
                frm.chkActivar.Checked = t_estado;

                frm.ShowDialog();
                if (frmtienda.boolAgr)
                {
                    //leerconfig();
                    cargardtg();
                    //frmMruta.boolMod = false;
                    boolModCajas = true;
                    this.btnCambiarEstado.Enabled = false;

                }


                this.btnModificar.Enabled = false;

            }

            catch (Exception ex)
            {
                //Escribiendo Log.......
                globales.escribirLOG("Error aplicacion consultatienda.Modificar(). " + ex.ToString());
                //fin Log...............
            }
        }




        private void dtg_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtg.Rows.Count >= 1)
            {
                
                if (((System.Windows.Forms.DataGridView)(sender)).CurrentCell.ColumnIndex == 0)
                {
                    if (Convert.ToBoolean(((System.Windows.Forms.DataGridView)(sender)).CurrentRow.Cells[0].Value))
                    {
                        ((System.Windows.Forms.DataGridView)(sender)).CurrentRow.Cells[0].Value = false;
                    }
                    else
                    {
                        ((System.Windows.Forms.DataGridView)(sender)).CurrentRow.Cells[0].Value = true;
                    }

                    this.btnCambiarEstado.Enabled = true;

                    this.btnModificar.Enabled = false;
                    //this.btnEliminar.Enabled = false;
                }
                else {
                    if (dtg.Rows.Count >= 1)
                    {
                        this.btnModificar.Enabled = true;
                        //this.btnEliminar.Enabled = true;

                    }
                }
            }
        }

        private void btnCambiarEstado_Click(object sender, EventArgs e)
        {
            
            if (MessageBox.Show("Desea Guardar los cambios de Estados de la lista?", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
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

                bool tmp_err = false;
                for (int i = 0; i <= dtg.Rows.Count - 1; i++)
                {
                    bool tmp_actualizar = false;
                   // cldatos.err = "";

                    switch (globales.Gcxconexiontipo)
                    {
                        case "SQL":
                            cldatos_sql.err = "";
                            break;

                        case "Mysql":
                            cldatos.err = "";
                            break;
                    }

                    int t_codigo = Convert.ToInt32(dtg.Rows[i].Cells[1].Value.ToString());
                    Boolean t_estado = false;
                    t_estado = Convert.ToBoolean(dtg.Rows[i].Cells[0].Value);
                    //MessageBox.Show("valor:" + dtg.Rows[i].Cells[0].Value + " Esta:" + t_estado.ToString());

                    //break;
                   
                    switch (globales.Gcxconexiontipo)
                    {
                        case "SQL":
                            tmp_actualizar = cldatos_sql.update_tiendaestado_sql(cnsql, t_codigo, t_estado);
                            break;

                        case "Mysql":
                            tmp_actualizar = cldatos.update_tiendaestado_mysql(cnmysql, t_codigo, t_estado);
                            break;
                    }

                    if (!tmp_actualizar)
                    {
                        tmp_err = true;
                        cllog.escribirLOG("Error consultartienda.CambiarEstado(). No se pudo actualizar. " + t_codigo.ToString());
                    }


                }

                if (tmp_err)
                {
                    tmp_err = true;
                    MessageBox.Show("Ocurrio problemas al actualizar los estados. Verificar el Log.");
                }
                else
                {
                    deshablitar();
                    //leerconfig();
                    //cargar LISTA......................
                    cargardtg();
                    //.....................................
                    boolModCajas = true;
                    MessageBox.Show("Se cambio los estados correctamente.");
                }

                
                this.btnCambiarEstado.Enabled = false;

                //Cerrar conexion....
                if (cnmysql.State != ConnectionState.Closed)
                {
                    cnmysql.Close();
                    cnmysql.ClearAllPoolsAsync();
                    cnmysql.Dispose();
                }
                //............

            }

            

        }

      
        private void btnbuscar_Click(object sender, EventArgs e)
        {
            cargardtg();
        }

        private void btnsalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btndescargar_Click(object sender, EventArgs e)
        {
            if (dtg.RowCount > 0)
            {
                DataTable dt = new DataTable();
                dt.TableName = "tienda";
                dt.Columns.Add("codtienda");
                dt.Columns.Add("nomtienda");
                dt.Columns.Add("servidor");
                dt.Columns.Add("ruta");
                dt.Columns.Add("usuario");
                dt.Columns.Add("password");
                dt.Columns.Add("estado");
                List<string> tmp_lista = new List<string>();
                for (int i = 0; i < dtg.RowCount; i++)
                {                    

                    if (Convert.ToBoolean(dtg.Rows[i].Cells[0].Value) == true)
                    {
                        int t_codigo = Convert.ToInt32(dtg.Rows[i].Cells[1].Value.ToString());
                        string t_nombre = dtg.Rows[i].Cells[2].Value.ToString();
                        string t_servidor = dtg.Rows[i].Cells[3].Value.ToString();
                        string t_ruta = dtg.Rows[i].Cells[4].Value.ToString();
                        string t_usuario = dtg.Rows[i].Cells[5].Value.ToString();
                        string t_password = dtg.Rows[i].Cells[6].Value.ToString();
                        Boolean t_estado = Convert.ToBoolean(Convert.ToInt32(dtg.Rows[i].Cells[7].Value));

                        dt.Rows.Add(t_codigo, t_nombre, t_servidor, t_ruta, t_usuario, t_password, t_estado);

                        //tmp_lista.Add(dtg.Rows[i].Cells[2].Value.ToString());
                    }
                }

                if (dt.Rows.Count > 0)
                {
                    rs = true;
                    this.Close();
                    g_lista = dt;
                }
                else
                {
                    MessageBox.Show("Usted no ha seleccionado por lo menos un Items.");
                }

                //g_nombre = t_nombreimport;

            }
        }

        private void btncheck_Click(object sender, EventArgs e)
        {

            if (dtg.RowCount > 0)
            {
                DataTable dt = new DataTable();
                dt.TableName = "tienda";
                dt.Columns.Add("codtienda");
                dt.Columns.Add("nomtienda");
                dt.Columns.Add("servidor");
                dt.Columns.Add("ruta");
                dt.Columns.Add("usuario");
                dt.Columns.Add("password");
                dt.Columns.Add("estado");
                List<string> tmp_lista = new List<string>();
                for (int i = 0; i < dtg.RowCount; i++)
                {

                    if (Convert.ToBoolean(dtg.Rows[i].Cells[0].Value) == true)
                    {
                        int t_codigo = Convert.ToInt32(dtg.Rows[i].Cells[1].Value.ToString());
                        string t_nombre = dtg.Rows[i].Cells[2].Value.ToString();
                        string t_servidor = dtg.Rows[i].Cells[3].Value.ToString();
                        string t_ruta = dtg.Rows[i].Cells[4].Value.ToString();
                        string t_usuario = dtg.Rows[i].Cells[5].Value.ToString();
                        string t_password = dtg.Rows[i].Cells[6].Value.ToString();
                        Boolean t_estado = Convert.ToBoolean(Convert.ToInt32(dtg.Rows[i].Cells[7].Value));

                        dt.Rows.Add(t_codigo, t_nombre, t_servidor, t_ruta, t_usuario, t_password, t_estado);

                        //tmp_lista.Add(dtg.Rows[i].Cells[2].Value.ToString());
                    }
                }

                if (dt.Rows.Count > 0)
                {
                    rs = true;
                    this.Close();
                    g_lista = dt;
                }
                else
                {
                    MessageBox.Show("Usted no ha seleccionado por lo menos un Items.");
                }

                //g_nombre = t_nombreimport;

            }

        }

        




    }
}