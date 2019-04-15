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
    public partial class frmconsultarcolumnasimport : Form
    {
        public frmconsultarcolumnasimport()
        {
            InitializeComponent();
        }

        VENPRO.cllog cllog = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();

        public static bool rs = false;
        public static string g_nombre = "";
        private void frmconsultarcolumnasimport_Load(object sender, EventArgs e)
        {

            this.dtg.Columns.Add("codcolumna", "codcolumna");
            this.dtg.Columns.Add("nomcolumna", "Nombre");
            this.dtg.Columns.Add("nomcolumna XML", "Nombre XML");
            this.dtg.Columns.Add("tipocolumna", "Tipo Columna");
            this.dtg.Columns.Add("size", "Size");
            this.dtg.Columns.Add("formato", "Formato");
            this.dtg.Columns[0].DataPropertyName = "codcolumna";
            this.dtg.Columns[1].DataPropertyName = "nomcolumna";
            this.dtg.Columns[2].DataPropertyName = "nomcolumnaxml";
            this.dtg.Columns[3].DataPropertyName = "tipocolumna";
            this.dtg.Columns[4].DataPropertyName = "size";
            this.dtg.Columns[5].DataPropertyName = "formato";
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
                    ds = cldatos_sql.cargar_columnasimport_sql(cnsql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim());
                    break;

                case "Mysql":
                    ds = cldatos.cargar_columnasimport_mysql(cnmysql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim());
                    break;
            }

            if (ds.Tables[0].Rows.Count > 0)
            {
                //dtg.DataSource = null;
                dtg.DataSource = ds.Tables[0];
                
                
            }
            else {
                dtg.DataSource = null;
                //MessageBox.Show(cldatos.err);
            }

        }

        private void dtg_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
           if(dtg.RowCount>0){
               if (e.RowIndex >= 0) {

                   this.btnmodificar.Enabled = true;

               }
           }
            

        }

        private void btnmodificar_Click(object sender, EventArgs e)
        {

            if (dtg.RowCount > 0) {
                string t_codigo = dtg.Rows[dtg.CurrentRow.Index].Cells[0].Value.ToString();
                string t_nomcolumna = dtg.Rows[dtg.CurrentRow.Index].Cells[1].Value.ToString();
                string t_nomcolumnaxml = dtg.Rows[dtg.CurrentRow.Index].Cells[2].Value.ToString();
                string t_tipocolumna = dtg.Rows[dtg.CurrentRow.Index].Cells[3].Value.ToString();
                string t_size = dtg.Rows[dtg.CurrentRow.Index].Cells[4].Value.ToString();
                string t_formato = dtg.Rows[dtg.CurrentRow.Index].Cells[5].Value.ToString();

                
                //MessageBox.Show("Fila " + t_codigo);

                frmcolumnasimport frm = new frmcolumnasimport();
                frmcolumnasimport.g_codigo = Convert.ToInt64(t_codigo);
                //frm.txtnombre.Text = t_nomcolumna;
                //frm.cbotipo.SelectedItem = t_tipocolumna;
                //frm.txtsize.Text = t_size;
                //frm.cboformato.SelectedItem = t_formato;                
                frm.btnactualizar.Visible = true;
                frm.btngrabar.Visible = false;
                frm.ShowDialog();
            }


        }

        private void btncrear_Click(object sender, EventArgs e)
        {
            frmcolumnasimport frm = new frmcolumnasimport();
            frmcolumnasimport.g_codigo = -1;
            frm.btnactualizar.Visible = false;
            frm.btngrabar.Visible = true;
            frm.ShowDialog();
        }


        private void dtg_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dtg.RowCount > 0)
            {
                string t_codigo = dtg.Rows[e.RowIndex].Cells[0].Value.ToString();
                string t_nomcolumna = dtg.Rows[e.RowIndex].Cells[1].Value.ToString();

                rs = true;
                g_nombre = t_nomcolumna;
                this.Close();
            }

        }

       


    }
}
