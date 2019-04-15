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
    public partial class frmcolumnasimport : Form
    {
        //public static frmcolumnasimport f1; 
        public frmcolumnasimport()
        {
            //frmcolumnasimport.f1 = this;
            InitializeComponent();
        }

        VENPRO.cllog cllog = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();

        public static Int64 g_codigo = -1;

        private void frmcolumnasimport_Load(object sender, EventArgs e)
        {

            this.txtformatopersonalizado.Visible = false;

            if (g_codigo != -1)
            {

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


                //...............
                DataSet ds;
                ds = new DataSet();
                
                switch (globales.Gcxconexiontipo)
                {
                    case "SQL":
                        ds = cldatos_sql.cargar_columnasimport_sql(cnsql, g_codigo);
                        break;

                    case "Mysql":
                        ds = cldatos.cargar_columnasimport_mysql(cnmysql, g_codigo);
                        break;
                }

                if (ds.Tables[0].Rows.Count > 0)
                {
                    this.txtnombre.Text = ds.Tables[0].Rows[0]["nomcolumna"].ToString();
                    this.txtnombrexml.Text = ds.Tables[0].Rows[0]["nomcolumnaxml"].ToString();
                    this.cbotipo.SelectedItem = ds.Tables[0].Rows[0]["tipocolumna"].ToString();
                    this.txtsize.Text = ds.Tables[0].Rows[0]["size"].ToString();
                    this.cboformato.SelectedItem = ds.Tables[0].Rows[0]["formato"].ToString();
                    if (this.cboformato.SelectedIndex == -1) {
                        this.cboformato.SelectedItem = "NINGUNO";
                    }
                    if (this.cboformato.SelectedIndex == -1)
                    {
                        this.cboformato.SelectedItem = "PERSONALIZADO";
                        this.txtformatopersonalizado.Text = ds.Tables[0].Rows[0]["formato"].ToString();
                    }

                }


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
                MessageBox.Show("Por favor ingresar el nombre que se busca en XML.");
                this.txtnombrexml.Focus();
                return;
            }
            if (this.cbotipo.SelectedIndex == -1)
            {
                MessageBox.Show("Por favor ingresar el Tipo.");
                this.cbotipo.Focus();
                return;
            }

            if (this.txtsize.Text.Trim() == "")
            {
                this.txtsize.Text = "0";
            }

            if (this.cboformato.SelectedIndex == -1)
            {
                MessageBox.Show("Por favor ingresar el Formato.");
                this.cbotipo.Focus();
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


             string tmp_formato = "";
             if (this.cboformato.SelectedItem.ToString() == "PERSONALIZADO")
             {
                 tmp_formato = this.txtformatopersonalizado.Text;
             }
             else
             {
                 if (this.cboformato.SelectedItem.ToString() == "NINGUNO")
                 {
                     tmp_formato = "";
                 }
                 else
                 {

                     tmp_formato = this.cboformato.SelectedItem.ToString();
                 }
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

             if (this.cboformato.SelectedItem == null) {
                 this.cboformato.SelectedIndex = 1;
             }
            

             switch (globales.Gcxconexiontipo)
             {
                 case "SQL":
                     tmp_grabar = cldatos_sql.insert_columnasimport_sql(cnsql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(), this.cbotipo.SelectedItem.ToString().Trim(),
                  Convert.ToInt32(this.txtsize.Text.Trim()), tmp_formato);
                     break;

                 case "Mysql":
                     tmp_grabar = cldatos.insert_columnasimport_mysql(cnmysql, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(), this.cbotipo.SelectedItem.ToString().Trim(),
                  Convert.ToInt32(this.txtsize.Text.Trim()), tmp_formato);
                     break;
             }

             if (!tmp_grabar) {
                 
                 string err = "";
                 switch (globales.Gcxconexiontipo)
                 {
                     case "SQL":
                        err= cldatos_sql.err;
                         break;

                     case "Mysql":
                        err= cldatos.err;
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
                MessageBox.Show("Por favor ingresar el nombre que se busca en XML.");
                this.txtnombrexml.Focus();
                return;
            }

            if (this.cbotipo.SelectedIndex==-1)
            {
                MessageBox.Show("Por favor ingresar el Tipo.");
                this.cbotipo.Focus();
                return;
            }

            if (this.txtsize.Text.Trim() == "")
            {
                this.txtsize.Text = "0";
            }

            if (this.cboformato.SelectedIndex == -1)
            {
                MessageBox.Show("Por favor ingresar el Formato.");
                this.cbotipo.Focus();
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

            string tmp_formato = "";
            if (this.cboformato.SelectedItem.ToString() == "PERSONALIZADO")
            {
                tmp_formato = this.txtformatopersonalizado.Text;
            }
            else
            {
                if (this.cboformato.SelectedItem.ToString() == "NINGUNO")
                {
                    tmp_formato = "";
                }
                else
                {

                    tmp_formato = this.cboformato.SelectedItem.ToString();
                }
            }

            bool tmp_actualizar = false;
           
            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    cldatos_sql.err = "";
                    break;

                case "Mysql":
                    cldatos.err = "";
                    break;
            }

            
            switch (globales.Gcxconexiontipo)
            {
                case "SQL":
                    tmp_actualizar = cldatos_sql.update_columnasimport_sql(cnsql, g_codigo, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(), this.cbotipo.SelectedItem.ToString().Trim(),
                  Convert.ToInt32(this.txtsize.Text.Trim()), tmp_formato);
                    break;

                case "Mysql":
                    tmp_actualizar = cldatos.update_columnasimport_mysql(cnmysql, g_codigo, this.txtnombre.Text.Trim(), this.txtnombrexml.Text.Trim(), this.cbotipo.SelectedItem.ToString().Trim(),
                  Convert.ToInt32(this.txtsize.Text.Trim()), tmp_formato);
                    break;
            }

            if (!tmp_actualizar)
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
            else {
                MessageBox.Show("Fue Actualizado Correctamente.");
                this.Close();
            }

        }

        private void cbotipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            //VarChar
            //Char
            //DateTime
            //Date
            //Time
            //Double
            //Bit
            //Int
            //Text
            this.txtformatopersonalizado.Visible = false;
            this.txtsize.ReadOnly = true;
            this.cboformato.Items.Clear();

            if (this.cbotipo.SelectedItem.ToString() == "Double" ||
                this.cbotipo.SelectedItem.ToString() == "VarChar")
            {
                this.txtsize.ReadOnly = false;
                this.txtsize.Text = "";
            }
            else
            {
                this.txtsize.ReadOnly = true;
                this.txtsize.Text = "";
            }

            if (this.cbotipo.SelectedItem.ToString() == "Double")
            {
                this.cboformato.Items.Add(".");
                this.cboformato.Items.Add(",");
                this.txtsize.ReadOnly = false;
                this.txtsize.Text = "";
            }

            if (this.cbotipo.SelectedItem.ToString() == "Date")
            {
                this.cboformato.Items.Add("yyyy-MM-dd");
                this.cboformato.Items.Add("yyyy/MM/dd");
                this.cboformato.Items.Add("dd/MM/yyyy");
                this.cboformato.Items.Add("PERSONALIZADO");
            }

            if (this.cbotipo.SelectedItem.ToString() == "DateTime")
            {
                this.cboformato.Items.Add("yyyy-MM-dd HH:mm:ss");
                this.cboformato.Items.Add("yyyy-MM-dd HH:mm");
                this.cboformato.Items.Add("yyyy/MM/dd HH:mm:ss");
                this.cboformato.Items.Add("yyyy/MM/dd HH:mm");
                this.cboformato.Items.Add("dd/MM/yyyy HH:mm:ss");
                this.cboformato.Items.Add("dd/MM/yyyy HH:mm");
                this.cboformato.Items.Add("PERSONALIZADO");
            }

            if (this.cbotipo.SelectedItem.ToString() == "Time")
            {
                this.cboformato.Items.Add("HH:mm:ss");
                this.cboformato.Items.Add("HH:mm");
                this.cboformato.Items.Add("PERSONALIZADO");
            }

            if (this.cbotipo.SelectedItem.ToString() == "VarChar" ||
                this.cbotipo.SelectedItem.ToString() == "Char" ||
                this.cbotipo.SelectedItem.ToString() == "Text" ||
                this.cbotipo.SelectedItem.ToString() == "Bit" ||
                this.cbotipo.SelectedItem.ToString() == "Int")
            {
                this.cboformato.Items.Add("NINGUNO");
            }





        }

        private void cboformato_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.cboformato.SelectedItem.ToString() == "PERSONALIZADO")
            {
                this.txtformatopersonalizado.Text = "";
                this.txtformatopersonalizado.Visible = true;

            }
            else
            {
                this.txtformatopersonalizado.Text = "";
                this.txtformatopersonalizado.Visible = false;
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
