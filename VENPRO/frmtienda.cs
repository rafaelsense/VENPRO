using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.IO;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;

namespace VENPRO
{
    public partial class frmtienda : Form
    {
        //public static string nombre;
        public static Boolean boolAgr = false;
        public static frmtienda f1;
        public frmtienda()            
        {
            InitializeComponent();
            frmtienda.f1 = this;
        }

        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();
        VENPRO.cllog cllog = new VENPRO.cllog();

        public  Int64 g_codigo = -1;

        private void frmAruta_Load(object sender, EventArgs e)
        {

            this.txtvisor.Text = "ftp://" + this.txtservidor.Text + "/" + globales.formatdata(this.txtruta.Text);

        }

        private void btnok_Click(object sender, EventArgs e)
        {
            //string Nomobj;
            try
            {

                if (this.txtcodtienda.Text.Trim() == "")
                {
                    MessageBox.Show("Por favor no ha ingresado el codigo de Tienda");
                    this.txtcodtienda.Focus();
                    return;
                }

                if (this.txtnombre.Text.Trim() == "")
                {
                    MessageBox.Show("Por favor no ha ingresado el nombre de la Tienda");
                    this.txtnombre.Focus();
                    return;
                }

                if (this.txtservidor.Text.Trim() == "")
                {
                    MessageBox.Show("Por favor no ha ingresado el servidor");
                    this.txtservidor.Focus();
                    return;
                }

              

                if (this.txtusuario.Text.Trim() == "")
                {
                    MessageBox.Show("Por favor ingrese un usuario.");
                    this.txtusuario.Focus();
                    return;
                }
                                

                if (MessageBox.Show("Desea Guardar?", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.Yes)
                {


                    //VENPRO BD------------------------

                    SqlConnection cnsql_venpro = new SqlConnection();
                    MySqlConnection cnmysql_venpro = new MySqlConnection();
                    switch (globales.Gcxconexiontipovenpro)
                    {
                        case "SQL":
                            //............                        
                            cnsql_venpro = new SqlConnection(clconexion.conexionvenpro);
                            if (cnsql_venpro.State != ConnectionState.Open)
                                cnsql_venpro.Open();
                            //...........
                            break;

                        case "Mysql":
                            //............                        
                            cnmysql_venpro = new MySqlConnection(clconexion.conexionvenpro);
                            if (cnmysql_venpro.State != ConnectionState.Open)
                                cnmysql_venpro.Open();
                            //...........
                            break;
                    }

                    //-----------------------------

                    if (g_codigo <= 0)
                    {
                        //GRABA...
                        bool tmp_grabar = false;
                        
                        switch (globales.Gcxconexiontipo)
                        {
                            case "SQL":
                                cldatos_sql.err = "";
                        tmp_grabar = cldatos_sql.insert_tienda_sql(cnsql_venpro, Convert.ToInt32(this.txtcodtienda.Text), this.txtnombre.Text.Trim(), this.txtservidor.Text.Trim(),
                                                        this.txtruta.Text.Trim(), this.txtusuario.Text.Trim(), this.txtpass.Text, this.chkActivar.Checked);
                                break;

                            case "Mysql":
                                cldatos.err = "";
                        tmp_grabar = cldatos.insert_tienda_mysql(cnmysql_venpro, Convert.ToInt32(this.txtcodtienda.Text), this.txtnombre.Text.Trim(), this.txtservidor.Text.Trim(),
                                                        this.txtruta.Text.Trim(), this.txtusuario.Text.Trim(), this.txtpass.Text, this.chkActivar.Checked);
                                break;
                        }

                        //Cerrar conexion....
                        if (cnmysql_venpro.State != ConnectionState.Closed)
                        {
                            cnmysql_venpro.Close();
                            cnmysql_venpro.ClearAllPoolsAsync();
                            cnmysql_venpro.Dispose();
                        }
                        //............

                        if (!tmp_grabar)
                        {
                            string err = "";

                            switch (globales.Gcxconexiontipo)
                            {
                                case "SQL":
                                    err=cldatos_sql.err;  
                                    break;

                                case "Mysql":
                                    err=cldatos.err; 
                                    break;
                            }

                            MessageBox.Show(err);
                        }
                        else
                        {
                            boolAgr = true;
                            MessageBox.Show("Fue Grabado Correctamente.");
                            this.Close();
                        }
                    }
                    else
                    {
                        //ACTUALIZA...
                        bool tmp_actualizar = false;
                        
                        switch (globales.Gcxconexiontipo)
                            {
                                case "SQL":
                                    cldatos_sql.err = "";
                        tmp_actualizar = cldatos_sql.update_tienda_sql(cnsql_venpro, Convert.ToInt32(this.txtcodtienda.Text), this.txtnombre.Text.Trim(), this.txtservidor.Text.Trim(),
                                                        this.txtruta.Text.Trim(), this.txtusuario.Text.Trim(), this.txtpass.Text, this.chkActivar.Checked);
                       
                                    break;

                                case "Mysql":
                                    cldatos.err = "";
                        tmp_actualizar = cldatos.update_tienda_mysql(cnmysql_venpro, Convert.ToInt32(this.txtcodtienda.Text), this.txtnombre.Text.Trim(), this.txtservidor.Text.Trim(),
                                                        this.txtruta.Text.Trim(), this.txtusuario.Text.Trim(), this.txtpass.Text, this.chkActivar.Checked);
                        
                                    break;
                            }

                        //Cerrar conexion....
                        if (cnmysql_venpro.State != ConnectionState.Closed)
                        {
                            cnmysql_venpro.Close();
                            cnmysql_venpro.ClearAllPoolsAsync();
                            cnmysql_venpro.Dispose();
                        }
                        //............

                        if (!tmp_actualizar)
                        {
                            string err = "";

                            switch (globales.Gcxconexiontipo)
                            {
                                case "SQL":
                                    err=cldatos_sql.err;  
                                    break;

                                case "Mysql":
                                    err=cldatos.err;  
                                    break;
                            }
                            MessageBox.Show(err);
                        }
                        else
                        {
                            boolAgr = true;
                            MessageBox.Show("Fue Actualizado Correctamente.");
                            this.Close();
                        }

                    }
                    

                }
            }
            catch(Exception ex)
            {
                //globales.escribirLOG("Error . " + ex.Message);
                MessageBox.Show("No hay comunicacion servidor . " + ex.Message);
            }

        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtruta_TextChanged(object sender, EventArgs e)
        {
            this.txtvisor.Text = "ftp://" + this.txtservidor.Text + "/" + globales.formatdata(this.txtruta.Text);

            //string[] Nompos;
            //if (this.txtruta.Text.Trim().IndexOf('/') != -1)
            //{
            //    Nompos = this.txtruta.Text.Trim().Split('/');
            //    if (Nompos[0].Trim() != "")
            //    {
            //        this.txtservidor.Text = Nompos[0].Trim();
            //    }
            //}
            //else
            //{
            //    this.txtservidor.Text = "";
            //}
            
        }


        private void txtruta_DragDrop(object sender, DragEventArgs e)
        {
            try
            {
                string[] paths = (string[])e.Data.GetData("FileName");

                string path = paths[0];
                System.IO.FileInfo fl = new System.IO.FileInfo(path);
                this.txtruta.Text = fl.FullName;
            }
            catch
            {

            }

        }

        private void txtruta_DragEnter(object sender, DragEventArgs e)
        {
            e.Effect = DragDropEffects.Copy;
        }

        private void btntest_Click(object sender, EventArgs e)
        {
            if (globales.StatusFTP(this.txtservidor.Text.Trim(), this.txtusuario.Text.Trim(), this.txtpass.Text.Trim()) != 1)
            {
                MessageBox.Show("Por favor verifique el servidor ftp, Usuario o Password.");
                return;
            }
            else {
                MessageBox.Show("Conexion OK");
                return;
            }

        }

        private void btnruta_Click(object sender, EventArgs e)
        {
            frmcreararchivo frm = new frmcreararchivo();
            frm.rs = false;
            frm.g_datoformat = this.txtruta.Text;
            frm.ShowDialog();
            if (frm.rs)
            {
                this.txtruta.Text = frm.g_datoformat;
            }
        }

       



    }
}