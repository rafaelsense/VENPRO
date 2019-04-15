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
    public partial class frmconsultartabla : Form
    {
        public frmconsultartabla()
        {
            InitializeComponent();
        }

        VENPRO.cllog cllog = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();

        public static bool rs = false;
        public static string g_nombre = "";

        private void frmconsultartabla_Load(object sender, EventArgs e)
        {
            DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
            btn.HeaderText = "Detalle";
            this.dtg.Columns.Add(btn);
            this.dtg.Columns.Add("codtabla", "codtabla");
            this.dtg.Columns.Add("Tabla", "Nombre Tabla");
            this.dtg.Columns.Add("Tabla XML", "Nombre Tabla XML");
            this.dtg.Columns.Add("Estado", "Estado");
            this.dtg.Columns.Add("nomcolumna", "Columnas");
            this.dtg.Columns.Add("modoactualizacion", "Modo Actualizacion");
            this.dtg.Columns.Add("columnaUpdate", "Columna Update");
            this.dtg.Columns.Add("columnaUpdate1", "Columna Update1");
            this.dtg.Columns.Add("columnaUpdate2", "Columna Update2");
            this.dtg.Columns.Add("columnaUpdate3", "Columna Update3");
            this.dtg.Columns.Add("columnaUpdate4", "Columna Update4");
            this.dtg.Columns.Add("columnaUpdate5", "Columna Update5");
            this.dtg.Columns.Add("columnaUpdate6", "Columna Update6");
            this.dtg.Columns.Add("columnaUpdate7", "Columna Update7");

            //this.dtg.Columns[0].DataPropertyName = "...";
            this.dtg.Columns[1].DataPropertyName = "codtabla";
            this.dtg.Columns[2].DataPropertyName = "nomtabla";
            this.dtg.Columns[3].DataPropertyName = "nomtablaxml";
            this.dtg.Columns[4].DataPropertyName = "estadoactivo";
            this.dtg.Columns[5].DataPropertyName = "cantcolumnas";
            this.dtg.Columns[6].DataPropertyName = "modoactualizacion";
            this.dtg.Columns[7].DataPropertyName = "col_posicion_update";
            this.dtg.Columns[8].DataPropertyName = "col_posicion_update1";
            this.dtg.Columns[9].DataPropertyName = "col_posicion_update2";
            this.dtg.Columns[10].DataPropertyName = "col_posicion_update3";
            this.dtg.Columns[11].DataPropertyName = "col_posicion_update4";
            this.dtg.Columns[12].DataPropertyName = "col_posicion_update5";
            this.dtg.Columns[13].DataPropertyName = "col_posicion_update6";
            this.dtg.Columns[14].DataPropertyName = "col_posicion_update7";
            this.dtg.AutoGenerateColumns = false;

            //this.dtg.Columns[0].Visible = false;

        }

        private void btnbuscar_Click(object sender, EventArgs e)
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

            this.btnmodificar.Enabled = false;
            DataSet ds;
            ds = new DataSet();
            
            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    ds = cldatos_sql.cargar_tablaimport_sql(cnsql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim());
                    break;

                case "Mysql":
                    ds = cldatos.cargar_tablaimport_mysql(cnmysql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim());
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

        }

        private void dtg_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtg.RowCount > 0)
            {
                if (e.RowIndex >= 0)
                {

                    if (e.ColumnIndex == 0) { 
                    
                        //Cargar detalle Columnas.....
                        string t_codigo = dtg.Rows[dtg.CurrentRow.Index].Cells[1].Value.ToString();
                        string t_nomtabla = dtg.Rows[dtg.CurrentRow.Index].Cells[2].Value.ToString();
                        string t_nomtablaxml = dtg.Rows[dtg.CurrentRow.Index].Cells[3].Value.ToString();
                        string t_estadoactivo = dtg.Rows[dtg.CurrentRow.Index].Cells[4].Value.ToString();
                        string t_cantcolumnas = dtg.Rows[dtg.CurrentRow.Index].Cells[5].Value.ToString();
                        string t_modoactualizacion = dtg.Rows[dtg.CurrentRow.Index].Cells[6].Value.ToString();
                        string t_columnaupdate = dtg.Rows[dtg.CurrentRow.Index].Cells[7].Value.ToString();
                        string t_columnaupdate1 = dtg.Rows[dtg.CurrentRow.Index].Cells[8].Value.ToString();
                        string t_columnaupdate2 = dtg.Rows[dtg.CurrentRow.Index].Cells[9].Value.ToString();
                        string t_columnaupdate3 = dtg.Rows[dtg.CurrentRow.Index].Cells[10].Value.ToString();
                        string t_columnaupdate4 = dtg.Rows[dtg.CurrentRow.Index].Cells[11].Value.ToString();
                        string t_columnaupdate5 = dtg.Rows[dtg.CurrentRow.Index].Cells[12].Value.ToString();
                        string t_columnaupdate6 = dtg.Rows[dtg.CurrentRow.Index].Cells[13].Value.ToString();
                        string t_columnaupdate7 = dtg.Rows[dtg.CurrentRow.Index].Cells[14].Value.ToString();


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
                                ds = cldatos_sql.cargar_nomcolumna_sql(cnsql, t_nomtabla);
                                break;

                            case "Mysql":
                                ds = cldatos.cargar_nomcolumna_mysql(cnmysql, t_nomtabla);
                                break;
                        }

                        frmdetallecolumnas frm = new frmdetallecolumnas();
                        frm.dtg.Columns.Add("columnaUpdate", "Posicion");
                        frm.dtg.Columns.Add("nomcolumna", "Columnas");
                        frm.dtg.Columns.Add("nomcolumnaxml", "Columnas XML");
                        frm.dtg.Columns[0].DataPropertyName = "posicion";
                        frm.dtg.Columns[1].DataPropertyName = "nomcolumna";
                        frm.dtg.Columns[2].DataPropertyName = "nomcolumnaxml";
                        frm.dtg.AutoGenerateColumns = false;
                        frm.dtg.DataSource = ds.Tables[0];
                        frm.Text = "DETALLE [" + t_nomtabla + "]";
                        frm.ShowDialog();

                        //..........

                    } else {
                        this.btnmodificar.Enabled = true;
                    }
                   

                    
                }
            }


        }

        private void btnmodificar_Click(object sender, EventArgs e)
        {

            if (dtg.RowCount > 0)
            {
                string t_codigo = dtg.Rows[dtg.CurrentRow.Index].Cells[1].Value.ToString();
                string t_nomtabla = dtg.Rows[dtg.CurrentRow.Index].Cells[2].Value.ToString();
                string t_nomtablaxml = dtg.Rows[dtg.CurrentRow.Index].Cells[3].Value.ToString();
                string t_estadoactivo = dtg.Rows[dtg.CurrentRow.Index].Cells[4].Value.ToString();
                string t_cantcolumnas = dtg.Rows[dtg.CurrentRow.Index].Cells[5].Value.ToString();
                string t_modoactualizacion = dtg.Rows[dtg.CurrentRow.Index].Cells[6].Value.ToString();
                string t_columnaupdate = dtg.Rows[dtg.CurrentRow.Index].Cells[7].Value.ToString();
                string t_columnaupdate1 = dtg.Rows[dtg.CurrentRow.Index].Cells[8].Value.ToString();
                string t_columnaupdate2 = dtg.Rows[dtg.CurrentRow.Index].Cells[9].Value.ToString();
                string t_columnaupdate3 = dtg.Rows[dtg.CurrentRow.Index].Cells[10].Value.ToString();
                string t_columnaupdate4 = dtg.Rows[dtg.CurrentRow.Index].Cells[11].Value.ToString();
                string t_columnaupdate5 = dtg.Rows[dtg.CurrentRow.Index].Cells[12].Value.ToString();
                string t_columnaupdate6 = dtg.Rows[dtg.CurrentRow.Index].Cells[13].Value.ToString();
                string t_columnaupdate7 = dtg.Rows[dtg.CurrentRow.Index].Cells[14].Value.ToString();

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
                        ds = cldatos_sql.cargar_nomcolumna_sql(cnsql, t_nomtabla);
                        break;

                    case "Mysql":
                        ds = cldatos.cargar_nomcolumna_mysql(cnmysql, t_nomtabla);
                        break;
                }

                frmtablaimport frm = new frmtablaimport();
                frm.g_codigo = Convert.ToInt64(t_codigo);
                frm.txtnombre.Text = t_nomtabla;
                frm.txtnombrexml.Text = t_nomtablaxml;

                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        frm.chkactivo.Checked = Convert.ToBoolean(t_estadoactivo);
                        break;

                    case "Mysql":
                        frm.chkactivo.Checked = Convert.ToBoolean(Convert.ToInt32(t_estadoactivo));
                        break;
                }
                

                if (t_columnaupdate == "")
                {
                    t_columnaupdate = "0";
                    frm.ncolumupdate.Value = Convert.ToDecimal(t_columnaupdate);

                }
                else
                {
                    frm.ncolumupdate.Value = Convert.ToDecimal(t_columnaupdate);
                }
                if (t_columnaupdate1 == "")
                {
                    t_columnaupdate1 = "0";
                    frm.chkupdate1.Checked = false;
                    frm.ncolumupdate1.Value = Convert.ToDecimal(t_columnaupdate1);
                    
                }
                else {
                    frm.chkupdate1.Checked = true;
                    frm.ncolumupdate1.Value = Convert.ToDecimal(t_columnaupdate1);
                }
                if (t_columnaupdate2 == "")
                {
                    t_columnaupdate2 = "0";
                    frm.chkupdate2.Checked = false;
                    frm.ncolumupdate2.Value = Convert.ToDecimal(t_columnaupdate2);
                }
                else
                {
                    frm.chkupdate2.Checked = true;
                    frm.ncolumupdate2.Value = Convert.ToDecimal(t_columnaupdate2);
                }
                if (t_columnaupdate3 == "")
                {
                    t_columnaupdate3 = "0";
                    frm.chkupdate3.Checked = false;
                    frm.ncolumupdate3.Value = Convert.ToDecimal(t_columnaupdate3);
                }
                else
                {
                    frm.chkupdate3.Checked = true;
                    frm.ncolumupdate3.Value = Convert.ToDecimal(t_columnaupdate3);
                }
                if (t_columnaupdate4 == "")
                {
                    t_columnaupdate4 = "0";
                    frm.chkupdate4.Checked = false;
                    frm.ncolumupdate4.Value = Convert.ToDecimal(t_columnaupdate4);
                }
                else
                {
                    frm.chkupdate4.Checked = true;
                    frm.ncolumupdate4.Value = Convert.ToDecimal(t_columnaupdate4);
                }
                if (t_columnaupdate5 == "")
                {
                    t_columnaupdate5 = "0";
                    frm.chkupdate5.Checked = false;
                    frm.ncolumupdate5.Value = Convert.ToDecimal(t_columnaupdate5);
                }
                else
                {
                    frm.chkupdate5.Checked = true;
                    frm.ncolumupdate5.Value = Convert.ToDecimal(t_columnaupdate5);
                }
                if (t_columnaupdate6 == "")
                {
                    t_columnaupdate6 = "0";
                    frm.chkupdate6.Checked = false;
                    frm.ncolumupdate6.Value = Convert.ToDecimal(t_columnaupdate6);
                }
                else
                {
                    frm.chkupdate6.Checked = true;
                    frm.ncolumupdate6.Value = Convert.ToDecimal(t_columnaupdate6);
                }
                if (t_columnaupdate7 == "")
                {
                    t_columnaupdate7 = "0";
                    frm.chkupdate7.Checked = false;
                    frm.ncolumupdate7.Value = Convert.ToDecimal(t_columnaupdate7);
                }
                else
                {
                    frm.chkupdate7.Checked = true;
                    frm.ncolumupdate7.Value = Convert.ToDecimal(t_columnaupdate7);
                }

                if (t_modoactualizacion == "ELIMINARINSERTAR")
                {
                    frm.rbtactualizar.Checked = false;
                    frm.rbteliminarinsertar.Checked = true;
                    
                }
                if (t_modoactualizacion == "ACTUALIZAR")
                {
                    frm.rbteliminarinsertar.Checked = false;
                    frm.rbtactualizar.Checked = true;
                }

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    frm.lst.Items.Add(ds.Tables[0].Rows[i]["nomcolumna"].ToString());
                }
                
                frm.btnactualizar.Visible = true;
                frm.btngrabar.Visible = false;
                frm.ShowDialog();
            }


        }

        private void btncrear_Click(object sender, EventArgs e)
        {
            frmtablaimport frm = new frmtablaimport();
            frm.g_codigo = -1;
            frm.btnactualizar.Visible = false;
            frm.btngrabar.Visible = true;
            frm.ShowDialog();
        }


        private void dtg_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtg.RowCount > 0)
            {
                string t_codigo = dtg.Rows[e.RowIndex].Cells[1].Value.ToString();
                string t_nomtabla = dtg.Rows[e.RowIndex].Cells[2].Value.ToString();

                rs = true;
                g_nombre = t_nomtabla;
                this.Close();
            }

        }

        





    }
}
