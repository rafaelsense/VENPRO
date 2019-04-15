using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.IO;

namespace VENPRO
{
    public partial class frmreproceso : Form
    {
        public frmreproceso()
        {
            InitializeComponent();
        }

        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();
        VENPRO.cllog cllog = new VENPRO.cllog();

        public bool rs = false;
        private void frmreproceso_Load(object sender, EventArgs e)
        {
            this.lblresult.Text = "";
            this.dtfecha.Value = DateTime.Now.AddDays(-1);
            this.dtfechaxtienda.Value = DateTime.Now.AddDays(-1);
            this.dtfechareproceso.Value = DateTime.Now.AddDays(-1);
            

            this.txtrutareproceso.Text = globales.Grutareproceso;
            this.dtfechareproceso.Value = globales.Grfechareproceso;
            this.chkactivarreproceso.Checked = globales.Gractreproceso;

        }



        private void btnagregar_Click(object sender, EventArgs e)
        {

            frmconsultartiendas frm = new frmconsultartiendas();
            frm.rs = false;

            frm.btncheck.Visible = true;

            frm.btndescargar.Visible = false;
            frm.btnAgregar.Visible = false;
            frm.btnCambiarEstado.Visible = false;
            frm.btnModificar.Visible = false;
            frm.toolStripLabel2.Visible = false;
            frm.toolStripLabel3.Visible = false;

            frm.ShowDialog();
            if (frm.rs)
            {
                List<string> tmp_list = new List<string>();
                for (int i = 0; i < frm.g_lista.Rows.Count; i++)
                {
                    tmp_list.Add(frm.g_lista.Rows[i]["codtienda"].ToString());
                }

                for (int p = 0; p < tmp_list.Count; p++)
                {

                    if (this.lst.Items.Count > 0)
                    {
                        bool existe = false;
                        for (int i = 0; i < this.lst.Items.Count; i++)
                        {
                            if (this.lst.Items[i].ToString() == tmp_list[p])
                            {
                                existe = true;
                                break;
                            }
                        }
                        if (existe)
                        {
                            MessageBox.Show(tmp_list[p] + " ya esta agregado. No se agrego.");
                            continue;
                        }
                        this.lst.Items.Add(tmp_list[p]);

                    }
                    else
                    {
                        this.lst.Items.Add(tmp_list[p]);
                    }
                }


            }

        }

        private void btnsubir_Click(object sender, EventArgs e)
        {
            //ListBox
            if (this.lst.SelectedIndex == -1 ||
                 this.lst.SelectedIndex == 0)
                return;

            string item, aboveItem;
            int itemIndex, aboveItemIndex;
            itemIndex = this.lst.SelectedIndex;
            aboveItemIndex = this.lst.SelectedIndex - 1;
            item = (string)this.lst.Items[itemIndex];
            aboveItem = (string)this.lst.Items[aboveItemIndex];

            this.lst.Items.RemoveAt(aboveItemIndex);
            this.lst.Items.Insert(itemIndex, aboveItem);
        }

        private void btnbajar_Click(object sender, EventArgs e)
        {
            //ListBox
            if (this.lst.SelectedIndex == -1 ||
                             this.lst.SelectedIndex >= this.lst.Items.Count)
                return;

            string item, belowItem;
            int itemIndex, belowItemIndex;
            itemIndex = this.lst.SelectedIndex;
            belowItemIndex = this.lst.SelectedIndex + 1;
            if (belowItemIndex >= this.lst.Items.Count)
                return;
            item = (string)this.lst.Items[itemIndex];
            belowItem = (string)this.lst.Items[belowItemIndex];

            this.lst.Items.RemoveAt(itemIndex);
            this.lst.Items.Insert(belowItemIndex, item);
            this.lst.SelectedIndex = belowItemIndex;
        }

        private void btneliminar_Click(object sender, EventArgs e)
        {
            if (lst.Items.Count > 0 && this.lst.SelectedIndex != -1)
            {
                this.lst.Items.RemoveAt(this.lst.SelectedIndex);
            }

        }

        private void btneliminardatos_Click(object sender, EventArgs e)
        {
            this.lblresult.Text = "";
            string tmp_fecha = this.dtfecha.Value.ToString("yyyy-MM-dd");
            if (MessageBox.Show("Esta Seguro de Eliminar todos los datos de la fecha " + tmp_fecha + " ?. ", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                return;
            }

            //CONEXION BD VENTAS------------------------

            SqlConnection cnsql_bd = new SqlConnection();
            MySqlConnection cnmysql_bd = new MySqlConnection();

            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    //............                        
                    cnsql_bd = new SqlConnection(clconexion.conexion);
                    if (cnsql_bd.State != ConnectionState.Open)
                        cnsql_bd.Open();
                    //...........
                    break;

                case "Mysql":
                    //............                        
                    cnmysql_bd = new MySqlConnection(clconexion.conexion);
                    if (cnmysql_bd.State != ConnectionState.Open)
                        cnmysql_bd.Open();
                    //...........
                    break;
            }
            //---------------------------------------
            cllog.escribirLOG("Inicio eliminacion datos xFecha...");
            globales.esribirmensajeform("Inicio eliminacion datos xFecha...");
            DataSet dsdel = globales.Gedsejecutartabladel;
            for (int i = 0; i < dsdel.Tables[0].Rows.Count; i++)
            {
                string v_codtabla = dsdel.Tables[0].Rows[i]["codtabla"].ToString();
                string v_tabla = dsdel.Tables[0].Rows[i]["nomtabla"].ToString();

                string tmp_delete_tabla = "";
                
                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        tmp_delete_tabla = cldatos_sql.delete_archivoimport_sql(cnsql_bd, v_tabla, "fecha_venpro", tmp_fecha,
                      "codtienda_venpro", 0);
                        break;

                    case "Mysql":
                        tmp_delete_tabla = cldatos.delete_archivoimport_mysql(cnmysql_bd, v_tabla, "fecha_venpro", tmp_fecha,
                     "codtienda_venpro", 0);
                        break;
                }

                //tmp_delete_tabla = cldatos.delete_archivoimport_mysql(cnmysql_bd, v_tabla, "Tail_Fecha", tmp_fecha,
                //    "codtienda_venpro", 0);
                if (tmp_delete_tabla != "1")
                {
                    //result = tmp_delete_tabla;
                   globales.esribirmensajeform(tmp_delete_tabla);
                    cllog.escribirLOG(tmp_delete_tabla);

                }
            }

            //Cerrar conexion....
            if (cnmysql_bd.State != ConnectionState.Closed)
            {
                cnmysql_bd.Close();
                cnmysql_bd.ClearAllPoolsAsync();
                cnmysql_bd.Dispose();
            }
            //............

            cllog.escribirLOG("Fin eliminacion datos xFecha.");
            globales.esribirmensajeform("Fin eliminacion datos xFecha.");
            this.lblresult.Text = "Se concluyo la Eliminacion datos.";
        }

        private void btnelminardatosxtienda_Click(object sender, EventArgs e)
        {

            this.lblresult.Text = "";
            if (this.lst.Items.Count==0)
            {
                MessageBox.Show("Debe ingresar por lo menos una tienda.");
                this.btnagregar.Focus();
                return;
            }

            string tmp_fecha = this.dtfechaxtienda.Value.ToString("yyyy-MM-dd");
            if (MessageBox.Show("Esta Seguro de Eliminar todos los datos de la fecha " + tmp_fecha + " y la lista de tiendas agregadas?. ", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                return;
            }

            //CONEXION BD VENTAS------------------------

            SqlConnection cnsql_bd = new SqlConnection();
            MySqlConnection cnmysql_bd = new MySqlConnection();

            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    //............                        
                    cnsql_bd = new SqlConnection(clconexion.conexion);
                    if (cnsql_bd.State != ConnectionState.Open)
                        cnsql_bd.Open();
                    //...........
                    break;

                case "Mysql":
                    //............                        
                    cnmysql_bd = new MySqlConnection(clconexion.conexion);
                    if (cnmysql_bd.State != ConnectionState.Open)
                        cnmysql_bd.Open();
                    //...........
                    break;
            }
            //---------------------------------------
            cllog.escribirLOG("Inicio eliminacion datos FechaxTienda...");
            DataSet dsdel = globales.Gedsejecutartabladel;
            for (int p = 0; p < this.lst.Items.Count; p++)
            {
                Int64 tmp_codtienda = Convert.ToInt64(this.lst.Items[p].ToString());
                for (int i = 0; i < dsdel.Tables[0].Rows.Count; i++)
                {
                    string v_codtabla = dsdel.Tables[0].Rows[i]["codtabla"].ToString();
                    string v_tabla = dsdel.Tables[0].Rows[i]["nomtabla"].ToString();

                    string tmp_delete_tabla = "";
                    
                    
                    switch (globales.Gcxconexiontipo)
                    {
                        case "SQL":
                            tmp_delete_tabla = cldatos_sql.delete_archivoimport_sql(cnsql_bd, v_tabla, "fecha_venpro", tmp_fecha,
                         "codtienda_venpro", tmp_codtienda);
                            break;

                        case "Mysql":
                            tmp_delete_tabla = cldatos.delete_archivoimport_mysql(cnmysql_bd, v_tabla, "fecha_venpro", tmp_fecha,
                         "codtienda_venpro", tmp_codtienda);
                            break;
                    }
                    
                    if (tmp_delete_tabla != "1")
                    {
                        //result = tmp_delete_tabla;
                        globales.esribirmensajeform(tmp_delete_tabla);
                        cllog.escribirLOG(tmp_delete_tabla);

                    }
                }
            }

            //Cerrar conexion....
            if (cnmysql_bd.State != ConnectionState.Closed)
            {
                cnmysql_bd.Close();
                cnmysql_bd.ClearAllPoolsAsync();
                cnmysql_bd.Dispose();
            }
            //............

            cllog.escribirLOG("Fin eliminacion datos FechaxTienda.");
            globales.esribirmensajeform("Fin eliminacion datos FechaxTienda.");
            this.lblresult.Text = "Se concluyo la Eliminacion datos.";
            this.lst.Items.Clear();
        }

        private void rbtelimfecha_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rbtelimfecha.Checked)
            {
                this.grbelimfecha.Enabled = true;
                this.grbelimfechxtienda.Enabled = false;
            }

        }

        private void rbtelimfechaxtienda_CheckedChanged(object sender, EventArgs e)
        {
            if (this.rbtelimfechaxtienda.Checked)
            {
                this.grbelimfecha.Enabled = false;
                this.grbelimfechxtienda.Enabled = true;
            }
        }

        private void btngrabar_Click(object sender, EventArgs e)
        {
            if (this.txtrutareproceso.Text.Trim()=="")
            {
                MessageBox.Show("Debe agregar una ruta.");
                this.txtrutareproceso.Focus();
                return;
            }

            if (MessageBox.Show("Desea Grabar los cambios?. ", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.No)
            {
                return;
            }


            if (globales.grabarreprocesoXML("reproceso", this.chkactivarreproceso.Checked,
                this.dtfechareproceso.Value.ToString("yyyy-MM-dd"), this.txtrutareproceso.Text.Trim()))
            {
                rs = true;
                MessageBox.Show("Se grabo correctamente.");
            }
            else {
                MessageBox.Show("Ocurrio un error, vuelva a intentarlo.");
            };
        }

        private void btnlimpiarcarpeta_Click(object sender, EventArgs e)
        {
            try
            {
                if (MessageBox.Show("Desea Limpiar la carpeta?. ", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.No)
                {
                    return;
                }

                if (Directory.Exists(this.txtrutareproceso.Text.Trim()))
                {
                    Directory.Delete(this.txtrutareproceso.Text.Trim());
                    Directory.CreateDirectory(this.txtrutareproceso.Text.Trim());
                }
                else
                {
                    Directory.CreateDirectory(this.txtrutareproceso.Text.Trim());
                }

                MessageBox.Show("Se Limpio ok.");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocurrio un error, vuelva a intentarlo." +  ex.Message);
            }
        }




    }
}
