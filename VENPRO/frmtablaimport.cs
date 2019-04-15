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
    public partial class frmtablaimport : Form
    {
        public frmtablaimport()
        {
            InitializeComponent();
        }

        VENPRO.cllog cllog = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();

        public  Int64 g_codigo = -1;
        //public string g_conexion = "";

        private void frmtablaimport_Load(object sender, EventArgs e)
        {

            ////-----------
            //SqlConnection cnsql = new SqlConnection();
            //MySqlConnection cnmysql = new MySqlConnection();
            //switch (globales.Gcxconexiontipovenpro)
            //{
            //    case "SQL":
            //        //............                        
            //        cnsql = new SqlConnection(clconexion.conexionvenpro);
            //        if (cnsql.State != ConnectionState.Open)
            //            cnsql.Open();
            //        //...........
            //        break;

            //    case "Mysql":
            //        //............                        
            //        cnmysql = new MySqlConnection(clconexion.conexionvenpro);
            //        if (cnmysql.State != ConnectionState.Open)
            //            cnmysql.Open();
            //        //...........
            //        break;
            //}
            ////-----------

            // DataSet ds;
            //ds = new DataSet();
            //ds = cldatos.cargar_conexionbd_mysql(cnmysql);

            //this.cboconexion.Items.Clear();

            //for (int i = 0; i < ds.Tables[0].Rows.Count; i++) {
            //    this.cboconexion.Items.Add(ds.Tables[0].Rows[i]["nomconexion"].ToString());
            //}
            //this.cboconexion.SelectedIndex = -1;
            ////......


            //if (g_codigo != -1)
            //{
            //    this.cboconexion.SelectedItem = g_conexion;
            //}


        }

        private void btnagregar_Click(object sender, EventArgs e)
        {

            if (this.txtnomcolumna.Text.Trim() == "")
            {
                MessageBox.Show("Por favor ingresar el Nombre Columna.");
                this.txtnomcolumna.Focus();
                return;
            }

            if (this.lst.Items.Count > 0)
            {
                bool existe = false;
                for (int i = 0; i < this.lst.Items.Count; i++)
                {
                    if (this.lst.Items[i].ToString() == this.txtnomcolumna.Text.Trim())
                    {
                        existe = true;
                        break;
                    }
                }
                if (existe)
                {
                    MessageBox.Show("La columna ya esta agregado.");
                    this.txtnomcolumna.Text = "";
                    this.txtnomcolumna.Focus();
                    return;
                }
                this.lst.Items.Add(this.txtnomcolumna.Text.Trim());

            }
            else {
                this.lst.Items.Add(this.txtnomcolumna.Text.Trim());
            }
            this.txtnomcolumna.Text = "";

        }

        private void txtnomcolumna_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            frmconsultarcolumnasimport frm = new frmconsultarcolumnasimport();
            frm.ShowDialog();
            if (frmconsultarcolumnasimport.rs)
            {
                this.txtnomcolumna.Text = frmconsultarcolumnasimport.g_nombre;
            }
            else {
                this.txtnomcolumna.Text = "";
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

        private void btngrabar_Click(object sender, EventArgs e)
        {

            if (this.txtnombre.Text.Trim() == "")
            {
                MessageBox.Show("Por favor ingresar el nombre.");
                this.txtnombre.Focus();
                return;
            }
            if (this.txtnombrexml.Text.Trim() == "")
            {
                MessageBox.Show("Por favor ingresar el nombre xml a buscar.");
                this.txtnombrexml.Focus();
                return;
            }
            if (this.lst.Items.Count == 0)
            {
                MessageBox.Show("Por favor ingresar las columnas.");
                this.txtnomcolumna.Focus();
                return;
            }

           
           

            if (this.chkupdate1.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate1.Focus();
                    return;
                }
            }

            if (this.chkupdate2.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate2.Focus();
                    return;
                }
            }

            if (this.chkupdate3.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate3.Focus();
                    return;
                }
            }

            if (this.chkupdate4.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate4.Focus();
                    return;
                }
            }

            if (this.chkupdate5.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate5.Focus();
                    return;
                }
            }

            if (this.chkupdate6.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate6.Focus();
                    return;
                }
            }

            if (this.chkupdate7.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate7.Focus();
                    return;
                }
            }

            if (this.chkupdate1.Checked && this.chkupdate2.Checked)
            {
                if (this.ncolumupdate1.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }
            }


            if (this.rbtactualizar.Checked == false && this.rbteliminarinsertar.Checked == false)
            {
                MessageBox.Show("Por favor ingresar Debe ingresar el modo de Actualizacion.");
                this.rbteliminarinsertar.Focus();
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

            List<String> t_columnas=new List<string>();
            List<int> t_posiciones = new List<int>();

            for (int i = 0; i < this.lst.Items.Count; i++)
            {
                t_columnas.Add(this.lst.Items[i].ToString());
                t_posiciones.Add(i+1);
            }

            //............
            string tmp_modoactualizacion = "";

            if (this.rbteliminarinsertar.Checked) {
                tmp_modoactualizacion = "ELIMINARINSERTAR";
            }
            if (this.rbtactualizar.Checked)
            {
                tmp_modoactualizacion = "ACTUALIZAR";
            }
            //............
            ////............
            //int tmp_update1 = 0;
            //int tmp_update2 = 0;

            //if (this.chkupdate1.Checked)
            //{
            //    tmp_update1 = Convert.ToInt32(this.ncolumupdate1.Value);
            //}
            //else {
            //    tmp_update1 = 0;
            //}
            //if (this.chkupdate2.Checked)
            //{
            //    tmp_update2 = Convert.ToInt32(this.ncolumupdate2.Value);
            //}
            //else
            //{
            //    tmp_update2 = 0;
            //}
            ////............


            bool tmp_grabar = false;


            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                                cldatos_sql.err = "";
            tmp_grabar = cldatos_sql.insert_tablaimport_sql(cnsql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(),
               Convert.ToInt32(this.ncolumupdate.Value), Convert.ToInt32(this.ncolumupdate1.Value),
               Convert.ToInt32(this.ncolumupdate2.Value), Convert.ToInt32(this.ncolumupdate3.Value), Convert.ToInt32(this.ncolumupdate4.Value),
               Convert.ToInt32(this.ncolumupdate5.Value), Convert.ToInt32(this.ncolumupdate6.Value), Convert.ToInt32(this.ncolumupdate7.Value),
               tmp_modoactualizacion, this.chkactivo.Checked, t_columnas.ToArray(), t_posiciones.ToArray());
                    break;

                case "Mysql":
                                cldatos.err = "";
            tmp_grabar = cldatos.insert_tablaimport_mysql(cnmysql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(),
               Convert.ToInt32(this.ncolumupdate.Value), Convert.ToInt32(this.ncolumupdate1.Value),
               Convert.ToInt32(this.ncolumupdate2.Value), Convert.ToInt32(this.ncolumupdate3.Value), Convert.ToInt32(this.ncolumupdate4.Value),
               Convert.ToInt32(this.ncolumupdate5.Value), Convert.ToInt32(this.ncolumupdate6.Value), Convert.ToInt32(this.ncolumupdate7.Value),
               tmp_modoactualizacion, this.chkactivo.Checked, t_columnas.ToArray(), t_posiciones.ToArray());
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
                this.Close();
            }


        }

        private void btnactualizar_Click(object sender, EventArgs e)
        {

            if (this.txtnombre.Text.Trim() == "")
            {
                MessageBox.Show("Por favor ingresar el nombre.");
                this.txtnombre.Focus();
                return;
            }
            if (this.txtnombrexml.Text.Trim() == "")
            {
                MessageBox.Show("Por favor ingresar el nombre que busca en el XML.");
                this.txtnombrexml.Focus();
                return;
            }
            if (this.lst.Items.Count == 0)
            {
                MessageBox.Show("Por favor ingresar las columnas.");
                this.txtnomcolumna.Focus();
                return;
            }

            
                        
            if (this.chkupdate1.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate1.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate1.Focus();
                    return;
                }
            }

            if (this.chkupdate2.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate2.Focus();
                    return;
                }
            }

            if (this.chkupdate3.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate3.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate3.Focus();
                    return;
                }
            }

            if (this.chkupdate4.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate5.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate4.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate4.Focus();
                    return;
                }
            }

            if (this.chkupdate5.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate5.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate5.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate5.Focus();
                    return;
                }
            }

            if (this.chkupdate6.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate6.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate6.Focus();
                    return;
                }
            }

            if (this.chkupdate7.Checked)
            {
                if (this.ncolumupdate.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate.Focus();
                    return;
                }

                if (this.ncolumupdate1.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate1.Focus();
                    return;
                }

                if (this.ncolumupdate2.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }

                if (this.ncolumupdate3.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate3.Focus();
                    return;
                }

                if (this.ncolumupdate4.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate4.Focus();
                    return;
                }

                if (this.ncolumupdate6.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate6.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == this.ncolumupdate7.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate7.Focus();
                    return;
                }

                if (this.ncolumupdate7.Value == 0)
                {
                    MessageBox.Show("Por favor la columna de actualizacion no puede ser Cero");
                    this.ncolumupdate7.Focus();
                    return;
                }
            }

            if (this.chkupdate1.Checked && this.chkupdate2.Checked)
            {
                if (this.ncolumupdate1.Value == this.ncolumupdate2.Value)
                {
                    MessageBox.Show("Por favor ingresar otra columna de actualizacion, no se pueden repetir.");
                    this.ncolumupdate2.Focus();
                    return;
                }
            }


            if (this.rbtactualizar.Checked == false && this.rbteliminarinsertar.Checked == false)
            {
                MessageBox.Show("Por favor ingresar Debe ingresar el modo de Actualizacion.");
                this.rbteliminarinsertar.Focus();
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

            List<String> t_columnas = new List<string>();
            List<int> t_posiciones = new List<int>();

            for (int i = 0; i < this.lst.Items.Count; i++)
            {
                t_columnas.Add(this.lst.Items[i].ToString());
                t_posiciones.Add(i + 1);
            }

            //............
            string tmp_modoactualizacion = "";

            if (this.rbteliminarinsertar.Checked)
            {
                tmp_modoactualizacion = "ELIMINARINSERTAR";
            }
            if (this.rbtactualizar.Checked)
            {
                tmp_modoactualizacion = "ACTUALIZAR";
            }
            //............
            
            bool tmp_grabar = false;
            

            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    cldatos_sql.err = "";
            tmp_grabar = cldatos_sql.update_tablaimport_sql(cnsql, g_codigo, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(),
               Convert.ToInt32(this.ncolumupdate.Value), Convert.ToInt32(this.ncolumupdate1.Value),
               Convert.ToInt32(this.ncolumupdate2.Value), Convert.ToInt32(this.ncolumupdate3.Value), Convert.ToInt32(this.ncolumupdate4.Value),
               Convert.ToInt32(this.ncolumupdate5.Value), Convert.ToInt32(this.ncolumupdate6.Value), Convert.ToInt32(this.ncolumupdate7.Value),
               tmp_modoactualizacion, this.chkactivo.Checked,  t_columnas.ToArray(), t_posiciones.ToArray());
                    break;

                case "Mysql":
                    cldatos.err = "";
            tmp_grabar = cldatos.update_tablaimport_mysql(cnmysql, g_codigo, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(),
               Convert.ToInt32(this.ncolumupdate.Value), Convert.ToInt32(this.ncolumupdate1.Value),
               Convert.ToInt32(this.ncolumupdate2.Value), Convert.ToInt32(this.ncolumupdate3.Value), Convert.ToInt32(this.ncolumupdate4.Value),
               Convert.ToInt32(this.ncolumupdate5.Value), Convert.ToInt32(this.ncolumupdate6.Value), Convert.ToInt32(this.ncolumupdate7.Value),
               tmp_modoactualizacion, this.chkactivo.Checked,  t_columnas.ToArray(), t_posiciones.ToArray());
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
                MessageBox.Show("Fue Actualizado Correctamente.");
                this.Close();
            }

        }

        private void chkupdate1_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkupdate1.Checked)
            {
                this.ncolumupdate1.Value = 2;
                this.ncolumupdate1.Enabled = true;

                this.chkupdate2.Enabled = true;
            }
            else {
                this.ncolumupdate1.Value = 0;
                this.ncolumupdate1.Enabled = false;

                this.chkupdate2.Enabled = false;
                this.chkupdate2.Checked = false;
            }
        }

        private void chkupdate2_CheckedChanged(object sender, EventArgs e)
        {
            
            if (this.chkupdate2.Checked)
            {
                this.ncolumupdate2.Value = 3;
                this.ncolumupdate2.Enabled = true;

                this.chkupdate3.Enabled = true;
            }
            else
            {
                this.ncolumupdate2.Value = 0;
                this.ncolumupdate2.Enabled = false;

                this.chkupdate3.Enabled = false;
                this.chkupdate3.Checked = false;
            }
        }

        private void chkupdate3_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkupdate3.Checked)
            {
                this.ncolumupdate3.Value = 4;
                this.ncolumupdate3.Enabled = true;

                this.chkupdate4.Enabled = true;
            }
            else
            {
                this.ncolumupdate3.Value = 0;
                this.ncolumupdate3.Enabled = false;

                this.chkupdate4.Enabled = false;
                this.chkupdate4.Checked = false;
            }
        }

        private void chkupdate4_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkupdate4.Checked)
            {
                this.ncolumupdate4.Value = 5;
                this.ncolumupdate4.Enabled = true;

                this.chkupdate5.Enabled = true;
            }
            else
            {
                this.ncolumupdate4.Value = 0;
                this.ncolumupdate4.Enabled = false;

                this.chkupdate5.Enabled = false;
                this.chkupdate5.Checked = false;
            }
        }

        private void chkupdate5_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkupdate5.Checked)
            {
                this.ncolumupdate5.Value = 6;
                this.ncolumupdate5.Enabled = true;

                this.chkupdate6.Enabled = true;
            }
            else
            {
                this.ncolumupdate5.Value = 0;
                this.ncolumupdate5.Enabled = false;

                this.chkupdate6.Enabled = false;
                this.chkupdate6.Checked = false;
            }
        }

        private void chkupdate6_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkupdate6.Checked)
            {
                this.ncolumupdate6.Value = 7;
                this.ncolumupdate6.Enabled = true;

                this.chkupdate7.Enabled = true;
            }
            else
            {
                this.ncolumupdate6.Value = 0;
                this.ncolumupdate6.Enabled = false;

                this.chkupdate7.Enabled = true;
                this.chkupdate7.Checked = false;
            }
        }

        private void chkupdate7_CheckedChanged(object sender, EventArgs e)
        {
            if (this.chkupdate7.Checked)
            {
                this.ncolumupdate7.Value = 8;
                this.ncolumupdate7.Enabled = true;
            }
            else
            {
                this.ncolumupdate7.Value = 0;
                this.ncolumupdate7.Enabled = false;
            }
        }

        private void ncolumupdate_MouseDoubleClick(object sender, MouseEventArgs e)
        {

            frmdetallecolumnas frm = new frmdetallecolumnas();
            frm.dtg.Columns.Add("columnaUpdate", "Posicion");
            frm.dtg.Columns.Add("nomcolumna", "Columnas");
            frm.dtg.Columns[0].DataPropertyName = "posicion";
            frm.dtg.Columns[1].DataPropertyName = "nomcolumna";
            frm.dtg.AutoGenerateColumns = false;
            frm.Text = "DETALLE [" + this.txtnombre.Text + "]";

            for (int i = 0; i < lst.Items.Count; i++) {
                frm.dtg.Rows.Add(i + 1, lst.Items[i].ToString());
            }
            frm.ShowDialog();
            if (frm.rs)
            {
                this.ncolumupdate.Value = frm.g_codigo;
            }
            else
            {
                this.ncolumupdate.Value = 1;
            }

            
        }

        private void ncolumupdate1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            frmdetallecolumnas frm = new frmdetallecolumnas();
            frm.dtg.Columns.Add("columnaUpdate", "Posicion");
            frm.dtg.Columns.Add("nomcolumna", "Columnas");
            frm.dtg.Columns[0].DataPropertyName = "posicion";
            frm.dtg.Columns[1].DataPropertyName = "nomcolumna";
            frm.dtg.AutoGenerateColumns = false;
            frm.Text = "DETALLE [" + this.txtnombre.Text + "]";

            for (int i = 0; i < lst.Items.Count; i++)
            {
                frm.dtg.Rows.Add(i + 1, lst.Items[i].ToString());
            }
            frm.ShowDialog();
            if (frm.rs)
            {
                this.ncolumupdate1.Value = frm.g_codigo;
            }
            else
            {
                this.ncolumupdate1.Value = 0;
            }

        }

        private void ncolumupdate2_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            frmdetallecolumnas frm = new frmdetallecolumnas();
            frm.dtg.Columns.Add("columnaUpdate", "Posicion");
            frm.dtg.Columns.Add("nomcolumna", "Columnas");
            frm.dtg.Columns[0].DataPropertyName = "posicion";
            frm.dtg.Columns[1].DataPropertyName = "nomcolumna";
            frm.dtg.AutoGenerateColumns = false;
            frm.Text = "DETALLE [" + this.txtnombre.Text + "]";

            for (int i = 0; i < lst.Items.Count; i++)
            {
                frm.dtg.Rows.Add(i+1, lst.Items[i].ToString());
            }
            frm.ShowDialog();
            if (frm.rs)
            {
                this.ncolumupdate1.Value = frm.g_codigo;
            }
            else
            {
                this.ncolumupdate1.Value = 0;
            }

        }

        private void txtnombrexml_TextChanged(object sender, EventArgs e)
        {
            //if (txtnombrexml.TextLength > 0)
            //{
            //    this.txtnombre.Text = txtnombrexml.Text;
            //}
            //else
            //{

            //}
        }



       

    }
}
