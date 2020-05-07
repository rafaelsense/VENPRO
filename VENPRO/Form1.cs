using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Net;
using System.Threading;
using System.IO;
using System.Xml;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Linq;

namespace VENPRO
{
    public partial class Form1 : Form
    {
        public static Form1 f1;
        public Form1()
        {
            Form1.f1 = this;
            InitializeComponent();
        }

        VENPRO.clconexion clconexion = new VENPRO.clconexion();
        VENPRO.cldatos_mysql cldatos = new VENPRO.cldatos_mysql();
        VENPRO.cldatos_sql cldatos_sql = new VENPRO.cldatos_sql();
        VENPRO.cllog cllog = new VENPRO.cllog();

        SqlConnection cnsql_bd = new SqlConnection();
        MySqlConnection cnmysql_bd = new MySqlConnection();
        //....
        SqlConnection cnsql_venpro = new SqlConnection();
        MySqlConnection cnmysql_venpro = new MySqlConnection();

        Object obj_cn_bd = new Object();
        Object obj_cn_venpro = new Object();

        private void Form1_Load(object sender, EventArgs e)
        {

               
            try
            {
                
                //globales.escribirLOG("OK:" +Directory.GetFiles(@"E:\VENPRO\VENPRO\bin\Debug\import\104\", "*.*", SearchOption.AllDirectories).Length.ToString());
            
                this.lblrutadescarga.Text = "";
                this.lbltiempo.Text = "";
                this.toolhora.Text = "";
                this.lblulttrataarchivo.Text = "";
                this.lblhoraserv.Text = "";
                //Creando configuracion..........
                if (System.IO.Directory.Exists(System.Environment.CurrentDirectory + "\\setting\\") == false)
                {
                    System.IO.Directory.CreateDirectory(System.Environment.CurrentDirectory + "\\setting\\");

                }
                globales.Grutaconfig = System.Environment.CurrentDirectory + "\\setting\\";
                globales.GrutaAplicacion = System.Environment.CurrentDirectory;

                if (System.IO.Directory.Exists(System.Environment.CurrentDirectory + "\\import\\") == false)
                {
                    System.IO.Directory.CreateDirectory(System.Environment.CurrentDirectory + "\\import\\");

                }

                if (System.IO.Directory.Exists(System.Environment.CurrentDirectory + "\\load\\") == false)
                {
                    System.IO.Directory.CreateDirectory(System.Environment.CurrentDirectory + "\\load\\");

                }

                globales.Grutadescarga = System.Environment.CurrentDirectory + "\\import\\";
                globales.Grutareproceso = System.Environment.CurrentDirectory + "\\reproceso\\";
                //..............................                
                VENPRO.cllog.rutaAplicacion = globales.GrutaAplicacion;

                if (System.IO.File.Exists(globales.Grutaconfig + "config.xml") == false)
                {
                    globales.CrearconfigXML();

                    leerconfig();
                    

                    this.lblrutadescarga.Text = globales.Grutadescarga;
                    this.lbltiempo.Text = globales.GtiempoMin.ToString();

                    if (globales.Gsolodescarga)
                    {
                        this.Text = this.Text + " *FUNCION SOLO DESCARGA*";
                        this.btnprocesar.Visible = false;
                    }
                    if (globales.Gsoloproceso)
                    {
                        this.Text = this.Text + " *FUNCION SOLO PROCESAR*";
                        this.btndescargar.Visible = false;
                    }
                    //return;
                    MessageBox.Show("Se creo el archivo de configuracion. Editar el archivo config.xml");
                    this.Close();
                    return;
                }
                else
                {
                    leerconfig();
                    Timer1.Interval = Convert.ToInt32(globales.GtiempoMin * 60000);
                    Timer1.Enabled = true;
                                        
                    if (globales.Gractreproceso)
                    {
                        globales.Grtimeserv = globales.Grfechareproceso;
                        globales.Grutadescarga = globales.Grutareproceso;
                        this.Text = "[MODO REPROCESO ARCHIVOS " + globales.Grfechareproceso.ToString("yyyy-MM-dd") + "]";
                    }
                    else
                    {
                        globales.Grtimeserv = DateTime.Now.AddDays(globales.Grdiaserv).AddHours(globales.Grhoraserv).AddMinutes(globales.Grminserv);

                    }

                    if (globales.Gsolodescarga)
                    {
                        this.Text = this.Text + " *FUNCION SOLO DESCARGA*";
                        this.btnprocesar.Visible = false;
                    }

                    if (globales.Gsoloproceso)
                    {
                        this.Text = this.Text + " *FUNCION SOLO PROCESAR*";
                        this.btndescargar.Visible = false;
                    }

                    this.lblhoraserv.Text = "[ " + globales.Grtimeserv.ToString("yyyy-MM-dd HH:mm:ss") + " ]";
                    //--------
                    lbltextotrata.Text = "Ult " + globales.Grtrataarchivo + " Arch:";
                    if (Timer1.Enabled)
                    {
                        this.tooltimeractivo.Enabled = true;
                        this.tooltimeractivo.Image = VENPRO.Properties.Resources.act;
                    }
                    else {
                        this.tooltimeractivo.Enabled = false;
                        this.tooltimeractivo.Image = VENPRO.Properties.Resources.desac;
                        this.toolhora.Text = "";
                    }
                    //if (globales.Gcxconexiontipo == "SQL")
                    //{
                    //CONEXION....
                    VENPRO.clconexion.con = globales.Gcxconexionstring;
                    VENPRO.clconexion.aplicarconexion();
                    VENPRO.clconexion.convenpro = globales.Gcxconexionstringvenpro;
                    VENPRO.clconexion.aplicarconexionvenpro();
                    //......
                    //}

                    
                    this.lblrutadescarga.Text = globales.Grutadescarga;
                    this.lbltiempo.Text = globales.GtiempoMin.ToString();


                    //Cargar Graficos-------------------------------
                    //dt = new DataSet();
                    //DataTable dt = new DataTable();
                    DataColumn[] clkey = new DataColumn[1];

                    //DataColumn dtc = new DataColumn();
                    //dtc.DataType=System.Type.GetType("System.String");
                    //dtc.ColumnName = "Min";
                   globales.gdtatable.Columns.Add("Min");
                   globales.gdtatable.Columns.Add("cant");

                   clkey[0] = globales.gdtatable.Columns[0];
                   globales.gdtatable.PrimaryKey = clkey;

                    DataView data;
                    //ver por Minuto.........

                    string tmp_min = DateTime.Now.ToString("mm");
                    int tmp_cant = 0;
                    globales.gdtatable.TableName = "registro";

                    globales.gdtatable.Rows.Add(tmp_min, tmp_cant);
                    if (globales.gdtatable.Rows.Count > 12)
                    {
                        globales.gdtatable.Rows.RemoveAt(0);
                    }

                    if (globales.gdtatable.Rows.Count >= 0)
                    {
                        data = new DataView(globales.gdtatable);
                        this.chart1.Series["Series1"].Points.DataBind(data, "Min", "Cant", "");
                        
                    }

                    //---------------------
                    //dt = new DataSet();
                    //DataTable dt = new DataTable();
                    DataColumn[] clkey2 = new DataColumn[1];
                    clkey2 = new DataColumn[1];
                    //DataColumn dtc = new DataColumn();
                    //dtc.DataType=System.Type.GetType("System.String");
                    //dtc.ColumnName = "Min";
                    globales.gdtatabledescarga.Columns.Add("Min");
                    globales.gdtatabledescarga.Columns.Add("cant");

                    clkey2[0] = globales.gdtatabledescarga.Columns[0];
                    globales.gdtatabledescarga.PrimaryKey = clkey2;

                    DataView data2;
                    //ver por Minuto.........

                    //string tmp_min2 = DateTime.Now.ToString("mm");
                    string tmp_min2 = tmp_min;
                    int tmp_cant2 = 0;
                     globales.gdtatabledescarga.TableName = "registro";

                     globales.gdtatabledescarga.Rows.Add(tmp_min2, tmp_cant2);
                     if (globales.gdtatabledescarga.Rows.Count > 12)
                    {
                        globales.gdtatabledescarga.Rows.RemoveAt(0);
                    }

                     if (globales.gdtatabledescarga.Rows.Count >= 0)
                    {
                        data2 = new DataView(globales.gdtatabledescarga);
                        this.chart1.Series["Series2"].Points.DataBind(data2, "Min", "Cant", "");

                    }

                    //.........................................


                    //CONEXION BD VENTAS------------------------

                    //SqlConnection cnsql_bd = new SqlConnection();
                    //MySqlConnection cnmysql_bd = new MySqlConnection();
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

                    //conexion VENPRO........
                    //SqlConnection cnsql_venpro = new SqlConnection();
                    //MySqlConnection cnmysql_venpro = new MySqlConnection();
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
                    //....................

                    //MessageBox.Show("conexvenpro:" + clconexion.conexionvenpro);
                    //MessageBox.Show("conex:" + clconexion.conexion);

                    switch (globales.Gcxconexiontipovenpro)
                    {
                        case "SQL":
                            //Cargar cargar tablas...                    
                            globales.Gedsejecutartabladel = cldatos_sql.cargar_tabla_colum_delete_sql(cnsql_venpro);
                            globales.Gedsejecutartablaimport = cldatos_sql.cargar_tablaxml_import_sql(cnsql_venpro);
                            globales.Gedsejecutatiendas = cldatos_sql.cargar_tienda_sql(cnsql_venpro);
                            break;

                        case "Mysql":
                            //Cargar cargar tablas...                    
                            globales.Gedsejecutartabladel = cldatos.cargar_tabla_colum_delete_mysql(cnmysql_venpro);
                            globales.Gedsejecutartablaimport = cldatos.cargar_tablaxml_import_mysql(cnmysql_venpro);
                            globales.Gedsejecutatiendas = cldatos.cargar_tienda_mysql(cnmysql_venpro);
                            break;
                    }
                    
                    //-------------------------


                    //Actualizar tiendas thread para descargas_archivos().....
                    DataSet dstiendas = globales.Gedsejecutatiendas;
                    globales.Gedejecutarthread_tienda = new Thread[dstiendas.Tables[0].Rows.Count];
                    globales.Gedejecutarthread_archivo = new Thread[dstiendas.Tables[0].Rows.Count];

                    if (dstiendas.Tables[0].Rows.Count > 0)
                    {
                        //Descarga.....
                        for (int i = 0; i < globales.Gedejecutarthread_tienda.Length; i++)
                        {
                            string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                            globales.Gedejecutarthread_tienda[i] = new Thread(delegate()
                            {
                                Boolean tmp_bool = true;
                            });
                            globales.Gedejecutarthread_tienda[i].Name = t_codtienda;
                            globales.Gedejecutarthread_tienda[i].IsBackground = true;
                        }
                        //.........
                        //Procesar archivos...
                        for (int i = 0; i < globales.Gedejecutarthread_archivo.Length; i++)
                        {
                            string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                            globales.Gedejecutarthread_archivo[i] = new Thread(delegate()
                            {
                                Boolean tmp_bool = true;
                            });
                            globales.Gedejecutarthread_archivo[i].Name = t_codtienda;
                            globales.Gedejecutarthread_archivo[i].IsBackground = true;
                        }
                        //........


                    }
                    //...............



                }

                //Escribiendo Log.......
                globales.escribirLOG("VENPRO iniciado");
                //fin Log...............

                //procesarxml("", "");

            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Aplicacion Cargar VENPRO. " + ex.ToString());
            }

        }

        delegate void ModesribirmensajeformCallBack(string texto);
        public void Modesribirmensajeform(string texto)
        {
            try
            {
                if (Form1.f1.txtmensaje.InvokeRequired)
                {
                    ModesribirmensajeformCallBack d = new ModesribirmensajeformCallBack(Modesribirmensajeform);
                    this.Invoke(d, new object[] { texto });

                }
                else
                {
                    string result = "";
                    if (texto.Trim() == "clear")
                    {
                        Form1.f1.txtmensaje.ScrollToCaret();
                        Form1.f1.txtmensaje.Text = "";
                    }
                    else
                    {
                        result = Form1.f1.txtmensaje.Text;
                        result = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " : " + texto + "\r\n" + result;

                        Form1.f1.txtmensaje.ScrollToCaret();
                        Form1.f1.txtmensaje.Text = result;
                    }
                    


                }
            }
            catch (System.Exception ex)
            {
                try
                {
                    cllog.escribirLOG("Error aplicacion Modesribirmensajeform().[ " + ex.ToString() + " ]");
                    Thread.CurrentThread.Abort();
                }
                catch { }
            }
        }

        delegate void ModitemchartCallBack(int item1, int item2);
        public void Moditemchart(int item1, int item2)
        {
            try
            {
                if (Form1.f1.txtmensaje.InvokeRequired)
                {
                    ModitemchartCallBack d = new ModitemchartCallBack(Moditemchart);
                    this.Invoke(d, new object[] {item1, item2 });

                }
                else
                {

                    //Cargar Graficos-------------------------------
                    //dt = new DataSet();
                    //DataTable dt = new DataTable();
                    //dt.Columns.Add("Min");
                    //dt.Columns.Add("cant");

                    DataView data;
                    //ver por Minuto.........

                    string tmp_min = DateTime.Now.ToString("mm");
                    //int tmp_cant = Convert.ToInt32(DateTime.Now.ToString("ss"));
                    //dt.TableName = "registro";
                    //for (int i = 0; i < this.dtg.Rows.Count; i++) {
                    //}

                    //-------
                    if (!globales.gdtatable.Rows.Contains(tmp_min))
                    {
                        globales.gdtatable.Rows.Add(tmp_min, item1);
                        if (globales.gdtatable.Rows.Count > 12)
                        {
                            globales.gdtatable.Rows.RemoveAt(0);
                        }

                        if (globales.gdtatable.Rows.Count >= 0)
                        {
                            data = new DataView(globales.gdtatable);
                            this.chart1.Series["Series1"].Points.DataBind(data, "Min", "Cant", "");
                        }

                    }
                    else {
                        for (int i = 0; i < globales.gdtatable.Rows.Count; i++)
                        {
                            if (globales.gdtatable.Rows[i][0].ToString() == tmp_min) {
                                globales.gdtatable.Rows.RemoveAt(i);
                            }
                        }

                        globales.gdtatable.Rows.Add(tmp_min, item1);
                        if (globales.gdtatable.Rows.Count > 12)
                        {
                            globales.gdtatable.Rows.RemoveAt(0);
                        }

                        if (globales.gdtatable.Rows.Count >= 0)
                        {
                            data = new DataView(globales.gdtatable);
                            this.chart1.Series["Series1"].Points.DataBind(data, "Min", "Cant", "");
                        }

                        //globales.gdtatable.Rows.(tmp_min, item1);
                    }
                    //----------

                    //ITEM2-------
                    if (!globales.gdtatabledescarga.Rows.Contains(tmp_min))
                    {
                        globales.gdtatabledescarga.Rows.Add(tmp_min, item2);
                        if (globales.gdtatabledescarga.Rows.Count > 12)
                        {
                            globales.gdtatabledescarga.Rows.RemoveAt(0);
                        }

                        if (globales.gdtatabledescarga.Rows.Count >= 0)
                        {
                            data = new DataView(globales.gdtatabledescarga);
                            this.chart1.Series["Series2"].Points.DataBind(data, "Min", "Cant", "");
                        }

                    }
                    else
                    {
                        for (int i = 0; i < globales.gdtatabledescarga.Rows.Count; i++)
                        {
                            if (globales.gdtatabledescarga.Rows[i][0].ToString() == tmp_min)
                            {
                                globales.gdtatabledescarga.Rows.RemoveAt(i);
                            }
                        }

                        globales.gdtatabledescarga.Rows.Add(tmp_min, item2);
                        if (globales.gdtatabledescarga.Rows.Count > 12)
                        {
                            globales.gdtatabledescarga.Rows.RemoveAt(0);
                        }

                        if (globales.gdtatabledescarga.Rows.Count >= 0)
                        {
                            data = new DataView(globales.gdtatabledescarga);
                            this.chart1.Series["Series2"].Points.DataBind(data, "Min", "Cant", "");
                        }

                        //globales.gdtatabledescarga.Rows.(tmp_min, item2);
                    }
                    //----------


                    //.........................................


                }
            }
            catch (System.Exception ex)
            {
                try
                {
                    cllog.escribirLOG("Error aplicacion Moditemchart().[ " + ex.ToString() + " ]");
                    Thread.CurrentThread.Abort();
                }
                catch { }
            }
        }


        private void leerconfig()
        {

            try
            {


                XmlDocument arbol;
                arbol = new XmlDocument();
                try
                {
                    arbol.Load(globales.Grutaconfig + "config.xml");
                }
                catch (Exception exx)
                {
                    //Escribiendo Log.......
                    globales.escribirLOG("Error leerconfig.cargarxml(). " + exx.ToString());
                    //fin Log...............
                }


                XmlNodeList nodolist;
                int tot;

                nodolist = arbol.SelectNodes("/objeto");


                foreach (XmlNode nodo in nodolist)
                {

                    //tot = nodo.ChildNodes.Count;

                    //if (tot == 1)
                    //{
                    //    globales.Gnomobj = new string[tot];
                    //    globales.Gpos = new string[tot];
                    //    globales.Gruta = new string[tot];
                    //    globales.Guser = new string[tot];
                    //    globales.Gpass = new string[tot];
                    //    globales.Gnombre = new string[tot];
                    //    globales.Gsobreescribir = new bool[tot];
                    //    globales.Gnompos = new string[tot];
                    //    globales.Gubicacion = new string[tot];
                    //    globales.Gmostrarpor = new string[tot];
                    //    globales.Gactivarpos = new bool[tot];

                    //}
                    //else
                    //{
                    //    if (tot == 0)
                    //    {
                    //        globales.Gnomobj = new string[tot];
                    //        globales.Gpos = new string[tot];
                    //        globales.Gruta = new string[tot];
                    //        globales.Guser = new string[tot];
                    //        globales.Gpass = new string[tot];
                    //        globales.Gnombre = new string[tot];
                    //        globales.Gsobreescribir = new bool[tot];
                    //        globales.Gnompos = new string[tot];
                    //        globales.Gubicacion = new string[tot];
                    //        globales.Gmostrarpor = new string[tot];
                    //        globales.Gactivarpos = new bool[tot];
                    //    }
                    //    else
                    //    {
                    //        globales.Gnomobj = new string[tot - 1];
                    //        globales.Gpos = new string[tot - 1];
                    //        globales.Gruta = new string[tot - 1];
                    //        globales.Guser = new string[tot - 1];
                    //        globales.Gpass = new string[tot - 1];
                    //        globales.Gnombre = new string[tot - 1];
                    //        globales.Gsobreescribir = new bool[tot - 1];
                    //        globales.Gnompos = new string[tot - 1];
                    //        globales.Gubicacion = new string[tot - 1];
                    //        globales.Gmostrarpor = new string[tot - 1];
                    //        globales.Gactivarpos = new bool[tot - 1];
                    //    }

                    //}


                    for (int i = 0; i <= nodo.ChildNodes.Count - 1; i++)
                    {

                        if (nodo.ChildNodes[i].Name == "tiempo")
                        {
                            globales.GtiempoMin = Convert.ToDecimal(nodo.ChildNodes[i].Attributes[0].InnerText);
                            globales.Greintento = Convert.ToDecimal(nodo.ChildNodes[i].Attributes[1].InnerText);

                        }


                        if (nodo.ChildNodes[i].Name == "CORREO")
                        {
                            globales.GcActivarAlerta = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[0].InnerText);
                            globales.Gcservidor = nodo.ChildNodes[i].Attributes[1].InnerText;
                            globales.GcEnableSsl = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[2].InnerText);
                            globales.Gcpuerto = Int32.Parse(nodo.ChildNodes[i].Attributes[3].InnerText);
                            globales.GcEstCredencial = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[4].InnerText);
                            globales.GcUsuario = nodo.ChildNodes[i].Attributes[5].InnerText;
                            globales.Gcpass = nodo.ChildNodes[i].Attributes[6].InnerText;
                            globales.GcNomMostrar = nodo.ChildNodes[i].Attributes[7].InnerText;
                            globales.GcDe = nodo.ChildNodes[i].Attributes[8].InnerText;
                            globales.GcTo = nodo.ChildNodes[i].Attributes[9].InnerText;
                            globales.GcCC = nodo.ChildNodes[i].Attributes[10].InnerText;
                            globales.GcCCO = nodo.ChildNodes[i].Attributes[11].InnerText;
                            globales.Gcasunto = nodo.ChildNodes[i].Attributes[12].InnerText;
                            globales.Gccontenido = nodo.ChildNodes[i].Attributes[13].InnerText;
                            globales.GcAdjunto = nodo.ChildNodes[i].Attributes[14].InnerText;

                        }

                        if (nodo.ChildNodes[i].Name == "conexion")
                        {
                            globales.Gcxconexionstring = nodo.ChildNodes[i].Attributes[0].InnerText;
                            globales.Gcxconexiontipo = nodo.ChildNodes[i].Attributes[1].InnerText;

                        }

                        if (nodo.ChildNodes[i].Name == "conexionvenpro")
                        {
                            globales.Gcxconexionstringvenpro = nodo.ChildNodes[i].Attributes[0].InnerText;
                            globales.Gcxconexiontipovenpro = nodo.ChildNodes[i].Attributes[1].InnerText;

                        }

                        if (nodo.ChildNodes[i].Name == "configuracion")
                        {
                            globales.Grutadescarga= nodo.ChildNodes[i].Attributes[0].InnerText;
                            globales.Grtrataarchivo = nodo.ChildNodes[i].Attributes[1].InnerText;
                            globales.Grhoratrata = Convert.ToDateTime(nodo.ChildNodes[i].Attributes[2].InnerText);

                            globales.Grdiaserv = Int32.Parse(nodo.ChildNodes[i].Attributes[3].InnerText);
                            globales.Grhoraserv = Int32.Parse(nodo.ChildNodes[i].Attributes[4].InnerText);
                            globales.Grminserv = Int32.Parse(nodo.ChildNodes[i].Attributes[5].InnerText);
                            globales.Gractbusqtag = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[6].InnerText);
                            globales.Gralertabusqtag = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[7].InnerText);
                            globales.Grhoraalertadiariatag = Convert.ToDateTime(nodo.ChildNodes[i].Attributes[8].InnerText);
                            globales.Grperiodominalerta = Int32.Parse(nodo.ChildNodes[i].Attributes[9].InnerText);
                            globales.Grarchivopermitido = nodo.ChildNodes[i].Attributes[10].InnerText;
                            globales.Grextensionpermitido = nodo.ChildNodes[i].Attributes[11].InnerText;
                            globales.Gsolodescarga = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[12].InnerText);
                            globales.Gsoloproceso = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[13].InnerText);
                            globales.Gcantarchivoprocesaporminuto = Int32.Parse(nodo.ChildNodes[i].Attributes[14].InnerText);

                        }

                        if (nodo.ChildNodes[i].Name == "reproceso")
                        {
                            globales.Gractreproceso = Convert.ToBoolean(nodo.ChildNodes[i].Attributes[0].InnerText);
                            globales.Grfechareproceso = DateTime.ParseExact(nodo.ChildNodes[i].Attributes[1].InnerText, "yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);                            
                            globales.Grutareproceso = nodo.ChildNodes[i].Attributes[2].InnerText;

                        }



                    }

                }


                //---------------------------------------------------------------------------------

            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                globales.escribirLOG("Error leerconfig(). " + ex.ToString());
                //fin Log...............
                MessageBox.Show("Error leerconfig(). hay un Problema con el archivo de configuracion config.xml. El formato no es el correcto. " + ex.Message);
            }


        }

        private string procesarxml_Mysql(string fecha_venpro,  Int64 codtienda, string ruta, string arch)
        { 
        
            string result="1";
            //DataSet dscolumnas;
            string tmp_fecharegistro = fecha_venpro;
            Int64 tmp_codtienda_venpro = codtienda;
            VENPRO.cldatos_mysql cldatos_tmp = new VENPRO.cldatos_mysql();
            int cont_err = 0;
            //'..........................................................
            //    Dim m_xmld As New XmlDocument
            //    Dim m_nodelist As XmlNodeList
            //    Dim m_node As XmlNode

            string tmp_arch=ruta + "\\" + arch;
            //string tmp_arch = @"E:\VENPRO\VENPRO\bin\Debug\import" + "\\" + "TRPER20140717A1361.XML";
                //"TRPER20140717A1066.XML";

             XmlDocument arbol;
                arbol = new XmlDocument();
                StreamReader leer_archivo;
            DataRow[] rwcolumnas;
            //string tmp_fecharegistro = globales.Grtimeserv.ToString("yyyy-MM-dd");
                leer_archivo = null;

                try
                {
                    
                    leer_archivo = File.OpenText(tmp_arch);
                    String readfile = leer_archivo.ReadToEnd();
                    arbol.LoadXml("<?xml version='1.0' encoding='ISO-8859-1'?>" + readfile);
                    leer_archivo.Close();
                    leer_archivo.Dispose();
                    //arbol.Load(tmp_arch);
                }
                catch (Exception exx)
                {
                    //Escribiendo Log.......
                    globales.escribirLOG("Error al cargar XML procesarxml(). " + "[" + ruta + "\\" + arch + "]" + exx.ToString());
                    //fin Log...............
                    
                    try {
                        leer_archivo.Close();
                        leer_archivo.Dispose();
                    }
                    catch { 
                    
                    }

                    return result;

                }


                XmlNodeList nodolist;
                //int tot;

                //cllog.escribirLOG(arbol.ChildNodes.Count.ToString() + " ." + ruta + " " + arch);
                //if (arbol.ChildNodes.Count > 0) { 
                
                //}

                nodolist = arbol.SelectNodes("/Root");


                String tmp_tag1 = "";
                String tmp_tag2 = "";
                String tmp_tabla = "";
                String tmp_columna = "";
                String tmp_columna_valor = "";

                Int64 t_codtabla = -1;
                string t_nomtabla = "";
                Boolean t_estadoactivo = false;
                //Int64 t_codconexionbd = -1;
                //string t_nomconexion = "";
                //string t_conexion = "";
                //string t_nomtipoconexion = "";
                //Int64 t_codtipoconexion = -1;
                string t_modoactualizacion = "";
                int t_columnaupdate = 0;
                int t_columnaupdate1 = 0;
                int t_columnaupdate2 = 0;
                int t_columnaupdate3 = 0;
                int t_columnaupdate4 = 0;
                int t_columnaupdate5 = 0;
                int t_columnaupdate6 = 0;
                int t_columnaupdate7 = 0;


            try{

                try
                {
                    globales.Gcontprocesadosxml = globales.Gcontprocesadosxml + 1;
                }
                catch { }


                //CONEXION BD VENTAS------------------------

                //SqlConnection cnSql_BD = new SqlConnection();
                //MySqlConnection cnMysql_BD = new MySqlConnection();
                //switch (globales.Gcxconexiontipo)
                //{
                //    case "SQL":
                //        //............                        
                //        cnSql_BD = new SqlConnection(clconexion.conexion);
                //        if (cnSql_BD.State != ConnectionState.Open)
                //            cnSql_BD.Open();
                //        //...........
                //        break;

                //    case "Mysql":
                //        //............                        
                //        cnMysql_BD = new MySqlConnection(clconexion.conexion);
                //        if (cnMysql_BD.State != ConnectionState.Open)
                //            cnMysql_BD.Open();
                //        //...........
                //        break;
                //}
                //---------------------------------------

                using (MySqlConnection cnMysql_BD = new MySqlConnection(clconexion.conexion))
                {
                    if (cnMysql_BD.State != ConnectionState.Open)
                        cnMysql_BD.Open();
                    //-------------------------------




                    ////Abrir conexion....
                    //if (cnMysql_BD.State != ConnectionState.Open)
                    //{
                    //    cnMysql_BD.Open();
                    //}
                    ////............


                    if (nodolist[0].ChildNodes.Count > 0)
                    {
                        ////string tt_tienda = "";
                        ////string tt_fecha = "";
                        //List<string> fecha_tabla_tiendadel = new List<string>();
                        //List<string> tablaxmldel = new List<string>();
                        //for (int i = 0; i < nodolist[0].ChildNodes.Count; i++)
                        //{
                        //    //PUEDE SER: /Root/Ticket
                        //    //PUEDE SER: /Root/Events

                        //    tmp_tag1 = "";
                        //    tmp_tag2 = "";
                        //    tmp_tabla = "";
                        //    tmp_columna = "";
                        //    tmp_columna_valor = "";

                        //    tmp_tag1 = nodolist[0].Name;
                        //    tmp_tag2 = nodolist[0].ChildNodes[i].Name;

                        //    for (int k = 0; k < nodolist[0].ChildNodes[i].ChildNodes.Count; k++)
                        //    {
                        //        //tt_tienda = "";
                        //        //tt_fecha = "";
                        //        //SON TABLAS......
                        //        //PUEDE SER: /Root/Ticket/Frame
                        //        //PUEDE SER: /Root/Ticket/PLU
                        //        //PUEDE SER: /Root/Ticket/Discount
                        //        //PUEDE SER: /Root/Ticket/InfoSPF
                        //        //PUEDE SER: /Root/Ticket/Total
                        //        //PUEDE SER: /Root/Events/Q-Length
                        //        //PUEDE SER: /Root/Events/Enter_Secure

                        //        //CARGAR COLUMNAS DE LA TABLA-----------------------------------
                        //        tmp_tag1 = "";
                        //        tmp_tag2 = "";
                        //        tmp_tabla = "";
                        //        tmp_columna = "";
                        //        tmp_columna_valor = "";

                        //        tmp_tag1 = nodolist[0].Name;
                        //        tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                        //        tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;

                        //        //string v_codtabla = "";
                        //        //string v_tabla = "";
                        //        //string v_tablaxml = "";
                        //        //string v_columfecha = "";
                        //        //string v_columfechaxml = "";
                        //        //string v_columtienda = "";
                        //        //string v_columtiendaxml = "";

                        //        //bool existe_tablaxml = false;
                        //        //for (int y = 0; y < fecha_tabla_tiendadel.Count; y++)
                        //        //{
                        //        //    //MessageBox.Show(fecha_tabla_tiendadel[y]);
                        //        //    //continue;

                        //        //    //String[] tmp_fecha_tabla_tiendadel;
                        //        //    //tmp_fecha_tabla_tiendadel = fecha_tabla_tiendadel[y].Split('|');
                        //        //    //string tp_fecha_val = tmp_fecha_tabla_tiendadel[0];
                        //        //    //string tp_tablaxml = tmp_fecha_tabla_tiendadel[1];

                        //        //    string tp_tablaxml = fecha_tabla_tiendadel[y];

                        //        //    if (tp_tablaxml.ToUpper() == tmp_tabla.ToUpper())
                        //        //    {
                        //        //        existe_tablaxml = true;
                        //        //        break;
                        //        //    }
                        //        //}
                        //        //if (existe_tablaxml)
                        //        //{
                        //        //    continue;
                        //        //}

                        //        //DataRow[] rwtabladel = globales.Gedsejecutartabladel.Tables[0].Select("nomtablaxml='" + tmp_tabla + "'");
                        //        //if (rwtabladel.Length > 0)
                        //        //{
                        //        //    v_codtabla = rwtabladel[0]["codtabla"].ToString();
                        //        //    v_tabla = rwtabladel[0]["nomtabla"].ToString();
                        //        //    v_tablaxml = rwtabladel[0]["nomtablaxml"].ToString();
                        //        //    //v_columfecha = rwtabladel[0]["nomcolum1"].ToString();
                        //        //    //v_columfechaxml = rwtabladel[0]["nomcolumxml1"].ToString();
                        //        //    //v_columtienda = rwtabladel[0]["nomcolum2"].ToString();
                        //        //    //v_columtiendaxml = rwtabladel[0]["nomcolumxml2"].ToString();
                        //        //}
                        //        //else
                        //        //{
                        //        //    continue;
                        //        //}

                        //        ////COLUMNAS....

                        //        //for (int p = 0; p < nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count; p++)
                        //        //{
                        //        //    //SON COLUMNAS......
                        //        //    //PUEDE SER: /Root/Ticket/Frame.Tr_Frame
                        //        //    //PUEDE SER: /Root/Ticket/Frame.Tail_Fecha 
                        //        //    //PUEDE SER: /Root/Ticket/Frame.Tail_NumPOS

                        //        //    //----------------------------------
                        //        //    tmp_tag1 = "";
                        //        //    tmp_tag2 = "";
                        //        //    tmp_tabla = "";
                        //        //    tmp_columna = "";
                        //        //    tmp_columna_valor = "";

                        //        //    tmp_tag1 = nodolist[0].Name;
                        //        //    tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                        //        //    tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;
                        //        //    tmp_columna = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Name;
                        //        //    tmp_columna_valor = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Value;

                        //        //    if (v_columfechaxml.ToUpper() == tmp_columna.ToUpper())
                        //        //    {
                        //        //        tt_fecha = tmp_columna_valor;
                        //        //    }
                        //        //    else
                        //        //    {

                        //        //        if (v_columtiendaxml.ToUpper() == tmp_columna.ToUpper())
                        //        //        {
                        //        //            tt_tienda = tmp_columna_valor;
                        //        //        }
                        //        //        else
                        //        //        {
                        //        //            continue;
                        //        //        }
                        //        //    }


                        //        //}

                        //        //Registrar fecha y tienda a Eliminar..................
                        //        //if (tt_tienda == "" || tt_fecha == "")
                        //        //{
                        //        //    cllog.escribirLOG("Error procesarxml().Eliminar. No se encuentra fecha y codtienda para eliminar, revisar el xml : " +
                        //        //        "[" + tmp_tabla + "][columfecha:" + v_columfechaxml + "]" + "[columtienda:" + v_columtiendaxml + "]" +
                        //        //        "Archivo: [" + tmp_arch + "]");
                        //        //    result = "Error procesarxml().Eliminar. No se encuentra fecha y codtienda para eliminar, revisar el xml : " +
                        //        //        "[" + tmp_tabla + "][columfecha:" + v_columfechaxml + "]" + "[columtienda:" + v_columtiendaxml + "]" +
                        //        //        "Archivo: [" + tmp_arch + "]";
                        //        //    return result;
                        //        //}

                        //        //string comp_fechatablatienda = tt_fecha + "|" + tmp_tabla + "|" + tt_tienda;

                        //        string comp_fechatablatienda = tmp_tabla;
                        //        bool tmp_fecha_tabla_tiendadel_exist = false;
                        //        for (int y = 0; y < fecha_tabla_tiendadel.Count; y++)
                        //        {
                        //            if (fecha_tabla_tiendadel[y].ToUpper() == comp_fechatablatienda.ToUpper())
                        //            {
                        //                tmp_fecha_tabla_tiendadel_exist = true;
                        //            }
                        //        }
                        //        if (!tmp_fecha_tabla_tiendadel_exist)
                        //        {
                        //            fecha_tabla_tiendadel.Add(comp_fechatablatienda);
                        //        }
                        //        //........................................................




                        //    }

                        //    //---------------------------------------


                        //}




                        ////Eliminar registros------------------


                        //for (int y = 0; y < fecha_tabla_tiendadel.Count; y++)
                        //{
                        //    //MessageBox.Show(fecha_tabla_tiendadel[y]);
                        //    //continue;
                        //    //String[] tmp_fecha_tabla_tiendadel;

                        //    //tmp_fecha_tabla_tiendadel = fecha_tabla_tiendadel[y].Split('|');
                        //    //string tp_fecha_val = tmp_fecha_tabla_tiendadel[0];
                        //    //string tp_tablaxml = tmp_fecha_tabla_tiendadel[1];
                        //    //Int64 tp_codtienda_val = Convert.ToInt64(tmp_fecha_tabla_tiendadel[2]);
                             
                        //    string tp_tablaxml = fecha_tabla_tiendadel[y];
                        //    DataRow[] rwtabladel = globales.Gedsejecutartabladel.Tables[0].Select("nomtablaxml='" + tp_tablaxml + "'");
                        //    if (rwtabladel.Length > 0)
                        //    {
                        //        string v_codtabla = rwtabladel[0]["codtabla"].ToString();
                        //        string v_tabla = rwtabladel[0]["nomtabla"].ToString();
                        //        string v_tablaxml = rwtabladel[0]["nomtablaxml"].ToString();

                        //        //string tmp_delete_tabla = "";
                        //        //tmp_delete_tabla = cldatos.delete_archivoimport_mysql(cnMysql_BD, v_tabla, "fecha_venpro", tmp_fecharegistro,
                        //        //     "codtienda_venpro", tmp_codtienda_venpro, "archivo_venpro", arch);

                        //        string tmp_delete_tabla = "1";
                        //        if (tmp_delete_tabla == "1")
                        //        {
                        //            ////tabladel.Add(v_tabla);
                        //            //tablaxmldel.Add(tmp_tabla);
                        //        }
                        //        else
                        //        {
                        //            result = tmp_delete_tabla;
                        //            Modesribirmensajeform(tmp_delete_tabla);
                        //            return result;
                        //        }
                        //    }

                        //}
                        //--------------------------


                        bool tmp_elim_archiv_err = false;
                        //INSERTAR------
                        for (int i = 0; i < nodolist[0].ChildNodes.Count; i++)
                        {
                            //PUEDE SER: /Root/Ticket
                            //PUEDE SER: /Root/Events

                            //XmlNode nodo = nodolist[i];
                            //MessageBox.Show("Nodo:" + nodolist[0].ChildNodes[i].Name );

                            tmp_tag1 = "";
                            tmp_tag2 = "";
                            tmp_tabla = "";
                            tmp_columna = "";
                            tmp_columna_valor = "";

                            tmp_tag1 = nodolist[0].Name;
                            tmp_tag2 = nodolist[0].ChildNodes[i].Name;

                            for (int k = 0; k < nodolist[0].ChildNodes[i].ChildNodes.Count; k++)
                            {
                                //SON TABLAS......
                                //PUEDE SER: /Root/Ticket/Frame
                                //PUEDE SER: /Root/Ticket/PLU
                                //PUEDE SER: /Root/Ticket/Discount
                                //PUEDE SER: /Root/Ticket/InfoSPF
                                //PUEDE SER: /Root/Ticket/Total
                                //PUEDE SER: /Root/Events/Q-Length
                                //PUEDE SER: /Root/Events/Enter_Secure



                                //CARGAR COLUMNAS DE LA TABLA-----------------------------------
                                tmp_tag1 = "";
                                tmp_tag2 = "";
                                tmp_tabla = "";
                                tmp_columna = "";
                                tmp_columna_valor = "";

                                tmp_tag1 = nodolist[0].Name;
                                tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                                tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;


                                //VERIFICAR SI EXISTE TABLA-----------------
                                bool tmp_existe_tabla = false;
                                for (int x = 0; x < globales.Gedsejecutartabladel.Tables[0].Rows.Count; x++)
                                {
                                    string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["codtabla"].ToString();
                                    string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtabla"].ToString();
                                    string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtablaxml"].ToString(); // compara valor tablaxml

                                    //cllog.escribirLOG("Error procesarxml(). No se encontro la tabla: " + "[bd:{" + v_tabla + "} - XML:{"+ tmp_tabla + "} ] Archivo: [" + tmp_arch + "]");

                                    if (v_tablaxml.ToUpper() == tmp_tabla.ToUpper())
                                    {
                                        tmp_existe_tabla = true;
                                    }

                                }

                                if (!tmp_existe_tabla)
                                {

                                    if (globales.Gractbusqtag)
                                    {
                                        cllog.escribirLOG("Error procesarxml_Mysql(). No se encontro la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");

                                        cldatos_tmp.insert_validacionxml_mysql(cnmysql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, "");
                                    }
                                    continue;
                                }
                                //-------------------------------------------

                                List<String> v_columnaxFila = new List<String>();
                                List<String> v_valorxFila = new List<String>();
                                string tmp_valorFila = "";
                                //dscolumnas = new DataSet();
                                rwcolumnas = null;
                                rwcolumnas = globales.Gedsejecutartablaimport.Tables[0].Select("nomtablaxml='" + tmp_tabla + "'");

                                //MessageBox.Show("Tabla:" + tmp_tabla + " colum" + rwcolumnas.Length.ToString() +
                                //    " Primer:" + rwcolumnas[0]["nomcolumna"].ToString() + " Primer posi:" + rwcolumnas[0]["posicioncolum"].ToString());
                                ////continue;
                                //rowregla[i]["PRMCODUSR"].ToString();
                                if (rwcolumnas.Length <= 0)
                                {

                                    continue;
                                }
                                else
                                {


                                    //valorxFila = new string[nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count];
                                    //columnaxFila = new string[nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count];

                                    t_codtabla = -1;
                                    t_estadoactivo = false;
                                    t_modoactualizacion = "";
                                    t_columnaupdate = 0;
                                    t_columnaupdate1 = 0;
                                    t_columnaupdate2 = 0;
                                    t_columnaupdate3 = 0;
                                    t_columnaupdate4 = 0;
                                    t_columnaupdate5 = 0;
                                    t_columnaupdate6 = 0;
                                    t_columnaupdate7 = 0;

                                    t_estadoactivo = Convert.ToBoolean(Convert.ToInt32(rwcolumnas[0]["estadoactivo"]));

                                    if (t_estadoactivo == false)
                                    {
                                        continue;
                                    }

                                    t_codtabla = Convert.ToInt64(rwcolumnas[0]["codtabla"].ToString());
                                    t_nomtabla = rwcolumnas[0]["nomtabla"].ToString(); //Carga nombre tabla BD
                                    t_modoactualizacion = rwcolumnas[0]["modoactualizacion"].ToString();

                                    if (rwcolumnas[0]["col_posicion_update"].ToString() == "")
                                    {
                                        t_columnaupdate = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate = Convert.ToInt32(rwcolumnas[0]["col_posicion_update"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update1"].ToString() == "")
                                    {
                                        t_columnaupdate1 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate1 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update1"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update2"].ToString() == "")
                                    {
                                        t_columnaupdate2 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate2 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update2"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update3"].ToString() == "")
                                    {
                                        t_columnaupdate3 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate3 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update3"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update4"].ToString() == "")
                                    {
                                        t_columnaupdate4 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate4 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update4"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update5"].ToString() == "")
                                    {
                                        t_columnaupdate5 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate5 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update5"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update6"].ToString() == "")
                                    {
                                        t_columnaupdate6 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate6 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update6"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update7"].ToString() == "")
                                    {
                                        t_columnaupdate7 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate7 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update7"].ToString());
                                    }




                                }
                                //----------------------------------

                                //COLUMNAS....

                                for (int p = 0; p < nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count; p++)
                                {
                                    //SON COLUMNAS......
                                    //PUEDE SER: /Root/Ticket/Frame.Tr_Frame
                                    //PUEDE SER: /Root/Ticket/Frame.Tail_Fecha 
                                    //PUEDE SER: /Root/Ticket/Frame.Tail_NumPOS

                                    //nodolist[i].ParentNode.Value;

                                    bool c_validacion_colum = false;
                                    //----------------------------------
                                    tmp_tag1 = "";
                                    tmp_tag2 = "";
                                    tmp_tabla = "";
                                    tmp_columna = "";
                                    tmp_columna_valor = "";

                                    tmp_tag1 = nodolist[0].Name;
                                    tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                                    tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;
                                    tmp_columna = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Name;
                                    tmp_columna_valor = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Value.Trim();


                                    //if rwcolumnas.Count <= 0)
                                    //{
                                    //    //cllog.escribirLOG("Error procesarxml(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");
                                    //    result = "Error procesarxml(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]";

                                    //    cldatos.insert_validacionxml_mysql(cnmysql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, tmp_columna);
                                    //    break;
                                    //}
                                    //-------------------------------------


                                    for (int m = 0; m < rwcolumnas.Length; m++)
                                    {
                                        string col_nomcolumnaxml = rwcolumnas[m]["nomcolumnaxml"].ToString(); // se compara columnaxml

                                        if (col_nomcolumnaxml.ToUpper() != tmp_columna.ToUpper())
                                        {
                                            continue;
                                        }

                                        int col_posicion = col_posicion = Convert.ToInt32(rwcolumnas[m]["posicioncolum"].ToString());
                                        string col_tipocolumna = rwcolumnas[m]["tipocolumna"].ToString();
                                        string col_formato = rwcolumnas[m]["formato"].ToString();
                                        string t_valorFila = tmp_columna_valor;
                                        string t_columnaFila = rwcolumnas[m]["nomcolumna"].ToString(); //nombre bd

                                        //VarChar
                                        //Char
                                        //DateTime
                                        //Date
                                        //Time
                                        //Double
                                        //Bit
                                        //Int
                                        //Text

                                        //codtabla
                                        //nomtabla
                                        //col_posicion_update
                                        //codtabla
                                        //codcolumna
                                        //posicion
                                        //codcolumna
                                        //nomcolumna
                                        //tipocolumna
                                        //size
                                        //formato


                                        //CONCATENA LA FILA-------------
                                        if (m == 0)
                                        {
                                            tmp_valorFila = t_valorFila;
                                        }
                                        else
                                        {
                                            tmp_valorFila = tmp_valorFila + ", " + t_valorFila;
                                        }
                                        //-----------------------

                                        if (col_tipocolumna == "Double")
                                        {
                                            char t_formatocultura = Convert.ToChar(col_formato);
                                            t_valorFila = Convert.ToDouble(globales.convertformatodecimal(t_formatocultura, t_valorFila)).ToString();
                                        }

                                        if (col_tipocolumna == "Date")
                                        {

                                            DateTime datTime;
                                            if (DateTime.TryParse(t_valorFila, out datTime))
                                            {
                                                DateTime tmpfecha = new DateTime();
                                                tmpfecha = DateTime.ParseExact(t_valorFila, col_formato, System.Globalization.CultureInfo.InvariantCulture);
                                                //tmpfecha = Convert.ToDateTime(t_valorFila);
                                                t_valorFila = tmpfecha.ToString("yyyy-MM-dd");
                                            }
                                        }

                                        if (col_tipocolumna == "DateTime" || col_tipocolumna == "Time")
                                        {

                                            DateTime datTime;
                                            if (DateTime.TryParse(t_valorFila, out datTime))
                                            {
                                                DateTime tmpfecha = new DateTime();
                                                tmpfecha = DateTime.ParseExact(t_valorFila, col_formato, System.Globalization.CultureInfo.InvariantCulture);
                                                //tmpfecha = Convert.ToDateTime(t_valorFila);
                                                t_valorFila = tmpfecha.ToString(col_formato);
                                            }
                                        }

                                        //Agregar columna y valor......
                                        v_columnaxFila.Add(t_columnaFila); //Se agrega la el nombre de la columna de la BD, no el del xml.
                                        v_valorxFila.Add(t_valorFila);
                                        //......................

                                        c_validacion_colum = true;

                                        break;
                                    }

                                    //VALIDACION--------
                                    if (!c_validacion_colum)
                                    {
                                        if (globales.Gractbusqtag)
                                        {
                                            cllog.escribirLOG("Inf procesarxml_Mysql(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");
                                            cldatos_tmp.insert_validacionxml_mysql(cnmysql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, tmp_columna);
                                        }
                                    }
                                    //------------------

                                }

                                //INSERTAR------------

                                //if (v_columnaxFila.Count == rwcolumnas.Length && rwcolumnas.Length >= 0)
                                //{
                                string tmp_insert = "";
                                tmp_insert = cldatos_tmp.insert_archivoimport_Mysql(cnMysql_BD, tmp_fecharegistro, tmp_codtienda_venpro, arch, t_codtabla, t_nomtabla, t_modoactualizacion, t_columnaupdate, t_columnaupdate1, t_columnaupdate2,
                                      t_columnaupdate3, t_columnaupdate4, t_columnaupdate5, t_columnaupdate6, t_columnaupdate7, rwcolumnas,
                                      v_columnaxFila, v_valorxFila);

                               

                                if (tmp_insert != "1")
                                {
                                    result = result + "[" + tmp_insert + "]";

                                    cont_err = cont_err + 1;

                                    if (cont_err >= 1) {
                                        result = result + "[procesarxml_Mysql(). Se interrumpio la lectura del archivo XML " + arch +" por mas de 1 errores consecutivos.]";

                                        cllog.escribirLOG("Error procesarxml_Mysql(). Se interrumpio la lectura del archivo XML por mas de 1 errores consecutivos. [" + ruta + "]" + "[" + tmp_arch + "] [" +
                                          "tag1: " + tmp_tag1 + "\r\n" +
                                          "tag2: " + tmp_tag2 + "\r\n" +
                                          "tag3_tabla: " + tmp_tabla + "\r\n" +
                                          "tag4_columna: " + tmp_columna + "\r\n" +
                                          "tag4_columna_valor: " + tmp_columna_valor + "\r\n" );

                                        break;
                                    }
                                    //tmp_elim_archiv_err = false;
                                    //if (tmp_insert.ToUpper().Contains("PRIMARY"))
                                    //{//Se indentifico que la informacion PRYMARY existe pero esta en otra fecha_venpro.
                                        
                                    //    try
                                    //    {
                                    //        if (!Directory.Exists(ruta + "\\old\\"))
                                    //            Directory.CreateDirectory(ruta + "\\old\\");

                                    //        //File.Delete(tmp_arch);
                                    //        File.Move(ruta + "\\" + arch, ruta + "\\old\\" + arch);

                                    //        cllog.escribirLOG("procesarxml().movió a carpeta OLD el Archivo por PRIMARY.[" + tmp_arch + "] ");
                                    //        tmp_elim_archiv_err = true;
                                    //        break;

                                    //    }
                                    //    catch (Exception exx)
                                    //    {
                                    //        //result = false;
                                    //        //Escribiendo Log.......
                                    //        cllog.escribirLOG("Error procesarxml.moverArchivo_OLD(). No se pudo Mover.[" + tmp_arch + "] " + exx.ToString());
                                    //        //fin Log...............

                                    //        try
                                    //        {
                                    //            File.Delete(tmp_arch);
                                    //            cllog.escribirLOG("procesarxml().se eliminó el Archivo por PRIMARY.[" + tmp_arch + "] ");
                                    //            tmp_elim_archiv_err = true;
                                    //            break;
                                    //        }
                                    //        catch (Exception exxx)
                                    //        {
                                    //            //result = false;
                                    //            //Escribiendo Log.......
                                    //            cllog.escribirLOG("Error procesarxml.eliminarArchivo(). No se pudo Mover.[" + tmp_arch + "] " + exxx.ToString());
                                    //            //fin Log...............
                                    //        }
                                    //    }
                                    //}

                                   
                                    
                                    //if (tmp_insert.ToUpper().Contains("TIMEOUT"))
                                    //{//Lock wait timeout exceeded; try restarting transaction: 
                                    //    //Se esta Realizando consulta y se ha bloqueado las tablas, 
                                    //    //se debe volver a ejecutar otra vez la consulta.
                                    //    try
                                    //    {
                                    //        //File.Delete(tmp_arch);
                                    //        //cllog.escribirLOG("procesarxml().Se elimino Archivo.[" + tmp_arch + "] ");
                                    //        result = result + "["+ tmp_insert + "]";
                                    //        //tmp_elim_archiv_err = true;
                                    //        break;

                                    //    }
                                    //    catch (Exception exx)
                                    //    {
                                    //        //result = false;
                                    //        //Escribiendo Log.......
                                    //        cllog.escribirLOG("Error procesarxml.TIMEOUT().[" + tmp_arch + "] " + exx.ToString());
                                    //        //fin Log...............
                                    //    }                                        

                                    //}

                                    //if (tmp_elim_archiv_err)
                                    //{
                                    //    Modesribirmensajeform(tmp_insert);
                                    //}


                                }
                                //}
                                //else { 
                                //cllog.escribirLOG("No cargo filascargadas:" + v_columnaxFila.Count.ToString() + " filas: " + rwcolumnas.Count.ToString() );
                                //}


                                //--------------------


                            }

                            if (cont_err >= 1) {
                                break;
                            }
                        }

                        

                    }


                }
                ////Cerrar conexion....
                //if (cnMysql_BD.State != ConnectionState.Closed)
                //{
                //    cnMysql_BD.Close();
                //    cnMysql_BD.ClearAllPoolsAsync();
                //    //MySqlConnection.ClearPool(cnMysql_BD);
                //    cnMysql_BD.Dispose();
                //}
                ////............


                //---------------------------------------------------------------------------------
                //try
                //{
                //    arbol = new XmlDocument();
                //}
                //catch
                //{

                //}
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error procesarxml_Mysql(). [" + ruta + "]" + "[" + tmp_arch + "] [" +
                      "tag1: " + tmp_tag1 + "\r\n" +
                      "tag2: " + tmp_tag2 + "\r\n" +
                      "tag3_tabla: " + tmp_tabla + "\r\n" +
                      "tag4_columna: " + tmp_columna + "\r\n" +
                      "tag4_columna_valor: " + tmp_columna_valor + "\r\n" +
                     ex.ToString());
                //fin Log...............

                result = "Error procesarxml_Mysql(). [" + ruta + "]" + "[" + tmp_arch + "] [" +
                      "tag1: " + tmp_tag1 + "\r\n" +
                      "tag2: " + tmp_tag2 + "\r\n" +
                      "tag3_tabla: " + tmp_tabla + "\r\n" +
                      "tag4_columna: " + tmp_columna + "\r\n" +
                      "tag4_columna_valor: " + tmp_columna_valor + "\r\n" +
                     ex.ToString();
                
            }
             //cllog.escribirLOG("procesarxml(). Procesado. [" + ruta + "][" + arch +"]" );
            return result;

        }

        private string procesarxml_sql(string fecha_venpro, Int64 codtienda, string ruta, string arch)
        {

            string result = "1";
            //DataSet dscolumnas;
            string tmp_fecharegistro = fecha_venpro;
            Int64 tmp_codtienda_venpro = codtienda;
            VENPRO.cldatos_sql cldatos_tmp = new VENPRO.cldatos_sql();
            int cont_err = 0;
            //'..........................................................
            //    Dim m_xmld As New XmlDocument
            //    Dim m_nodelist As XmlNodeList
            //    Dim m_node As XmlNode

            string tmp_arch = ruta + "\\" + arch;
            //string tmp_arch = @"E:\VENPRO\VENPRO\bin\Debug\import" + "\\" + "TRPER20140717A1361.XML";
            //"TRPER20140717A1066.XML";

            XmlDocument arbol;
            arbol = new XmlDocument();
            StreamReader leer_archivo;
            DataRow[] rwcolumnas;
            //string tmp_fecharegistro = globales.Grtimeserv.ToString("yyyy-MM-dd");
            leer_archivo = null;

            try
            {

                leer_archivo = File.OpenText(tmp_arch);
                String readfile = leer_archivo.ReadToEnd();
                arbol.LoadXml("<?xml version='1.0' encoding='ISO-8859-1'?>" + readfile);
                leer_archivo.Close();
                leer_archivo.Dispose();
                //arbol.Load(tmp_arch);
            }
            catch (Exception exx)
            {
                //Escribiendo Log.......
                globales.escribirLOG("Error al cargar XML procesarxml_sql(). " + "[" + ruta + "\\" + arch + "]" + exx.ToString());
                //fin Log...............

                try
                {
                    leer_archivo.Close();
                    leer_archivo.Dispose();
                }
                catch
                {

                }

                return result;

            }


            XmlNodeList nodolist;
            //int tot;

            //cllog.escribirLOG(arbol.ChildNodes.Count.ToString() + " ." + ruta + " " + arch);
            //if (arbol.ChildNodes.Count > 0) { 

            //}

            nodolist = arbol.SelectNodes("/Root");


            String tmp_tag1 = "";
            String tmp_tag2 = "";
            String tmp_tabla = "";
            String tmp_columna = "";
            String tmp_columna_valor = "";

            Int64 t_codtabla = -1;
            string t_nomtabla = "";
            Boolean t_estadoactivo = false;
            //Int64 t_codconexionbd = -1;
            //string t_nomconexion = "";
            //string t_conexion = "";
            //string t_nomtipoconexion = "";
            //Int64 t_codtipoconexion = -1;
            string t_modoactualizacion = "";
            int t_columnaupdate = 0;
            int t_columnaupdate1 = 0;
            int t_columnaupdate2 = 0;
            int t_columnaupdate3 = 0;
            int t_columnaupdate4 = 0;
            int t_columnaupdate5 = 0;
            int t_columnaupdate6 = 0;
            int t_columnaupdate7 = 0;


            try
            {

                try
                {
                    globales.Gcontprocesadosxml = globales.Gcontprocesadosxml + 1;
                }
                catch { }


                //CONEXION BD VENTAS------------------------

                //SqlConnection cnSql_BD = new SqlConnection();
                //MySqlConnection cnMysql_BD = new MySqlConnection();
                //switch (globales.Gcxconexiontipo)
                //{
                //    case "SQL":
                //        //............                        
                //        cnSql_BD = new SqlConnection(clconexion.conexion);
                //        if (cnSql_BD.State != ConnectionState.Open)
                //            cnSql_BD.Open();
                //        //...........
                //        break;

                //    case "Mysql":
                //        //............                        
                //        cnMysql_BD = new MySqlConnection(clconexion.conexion);
                //        if (cnMysql_BD.State != ConnectionState.Open)
                //            cnMysql_BD.Open();
                //        //...........
                //        break;
                //}
                //---------------------------------------

                using (SqlConnection cnsql_BD = new SqlConnection(clconexion.conexion))
                {
                    if (cnsql_BD.State != ConnectionState.Open)
                        cnsql_BD.Open();
                    //-------------------------------




                    ////Abrir conexion....
                    //if (cnMysql_BD.State != ConnectionState.Open)
                    //{
                    //    cnMysql_BD.Open();
                    //}
                    ////............


                    if (nodolist[0].ChildNodes.Count > 0)
                    {
                        ////string tt_tienda = "";
                        ////string tt_fecha = "";
                        //List<string> fecha_tabla_tiendadel = new List<string>();
                        //List<string> tablaxmldel = new List<string>();
                        //for (int i = 0; i < nodolist[0].ChildNodes.Count; i++)
                        //{
                        //    //PUEDE SER: /Root/Ticket
                        //    //PUEDE SER: /Root/Events

                        //    tmp_tag1 = "";
                        //    tmp_tag2 = "";
                        //    tmp_tabla = "";
                        //    tmp_columna = "";
                        //    tmp_columna_valor = "";

                        //    tmp_tag1 = nodolist[0].Name;
                        //    tmp_tag2 = nodolist[0].ChildNodes[i].Name;

                        //    for (int k = 0; k < nodolist[0].ChildNodes[i].ChildNodes.Count; k++)
                        //    {
                        //        //tt_tienda = "";
                        //        //tt_fecha = "";
                        //        //SON TABLAS......
                        //        //PUEDE SER: /Root/Ticket/Frame
                        //        //PUEDE SER: /Root/Ticket/PLU
                        //        //PUEDE SER: /Root/Ticket/Discount
                        //        //PUEDE SER: /Root/Ticket/InfoSPF
                        //        //PUEDE SER: /Root/Ticket/Total
                        //        //PUEDE SER: /Root/Events/Q-Length
                        //        //PUEDE SER: /Root/Events/Enter_Secure

                        //        //CARGAR COLUMNAS DE LA TABLA-----------------------------------
                        //        tmp_tag1 = "";
                        //        tmp_tag2 = "";
                        //        tmp_tabla = "";
                        //        tmp_columna = "";
                        //        tmp_columna_valor = "";

                        //        tmp_tag1 = nodolist[0].Name;
                        //        tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                        //        tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;

                        //        //string v_codtabla = "";
                        //        //string v_tabla = "";
                        //        //string v_tablaxml = "";
                        //        //string v_columfecha = "";
                        //        //string v_columfechaxml = "";
                        //        //string v_columtienda = "";
                        //        //string v_columtiendaxml = "";

                        //        //bool existe_tablaxml = false;
                        //        //for (int y = 0; y < fecha_tabla_tiendadel.Count; y++)
                        //        //{
                        //        //    //MessageBox.Show(fecha_tabla_tiendadel[y]);
                        //        //    //continue;

                        //        //    //String[] tmp_fecha_tabla_tiendadel;
                        //        //    //tmp_fecha_tabla_tiendadel = fecha_tabla_tiendadel[y].Split('|');
                        //        //    //string tp_fecha_val = tmp_fecha_tabla_tiendadel[0];
                        //        //    //string tp_tablaxml = tmp_fecha_tabla_tiendadel[1];

                        //        //    string tp_tablaxml = fecha_tabla_tiendadel[y];

                        //        //    if (tp_tablaxml.ToUpper() == tmp_tabla.ToUpper())
                        //        //    {
                        //        //        existe_tablaxml = true;
                        //        //        break;
                        //        //    }
                        //        //}
                        //        //if (existe_tablaxml)
                        //        //{
                        //        //    continue;
                        //        //}

                        //        //DataRow[] rwtabladel = globales.Gedsejecutartabladel.Tables[0].Select("nomtablaxml='" + tmp_tabla + "'");
                        //        //if (rwtabladel.Length > 0)
                        //        //{
                        //        //    v_codtabla = rwtabladel[0]["codtabla"].ToString();
                        //        //    v_tabla = rwtabladel[0]["nomtabla"].ToString();
                        //        //    v_tablaxml = rwtabladel[0]["nomtablaxml"].ToString();
                        //        //    //v_columfecha = rwtabladel[0]["nomcolum1"].ToString();
                        //        //    //v_columfechaxml = rwtabladel[0]["nomcolumxml1"].ToString();
                        //        //    //v_columtienda = rwtabladel[0]["nomcolum2"].ToString();
                        //        //    //v_columtiendaxml = rwtabladel[0]["nomcolumxml2"].ToString();
                        //        //}
                        //        //else
                        //        //{
                        //        //    continue;
                        //        //}

                        //        ////COLUMNAS....

                        //        //for (int p = 0; p < nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count; p++)
                        //        //{
                        //        //    //SON COLUMNAS......
                        //        //    //PUEDE SER: /Root/Ticket/Frame.Tr_Frame
                        //        //    //PUEDE SER: /Root/Ticket/Frame.Tail_Fecha 
                        //        //    //PUEDE SER: /Root/Ticket/Frame.Tail_NumPOS

                        //        //    //----------------------------------
                        //        //    tmp_tag1 = "";
                        //        //    tmp_tag2 = "";
                        //        //    tmp_tabla = "";
                        //        //    tmp_columna = "";
                        //        //    tmp_columna_valor = "";

                        //        //    tmp_tag1 = nodolist[0].Name;
                        //        //    tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                        //        //    tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;
                        //        //    tmp_columna = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Name;
                        //        //    tmp_columna_valor = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Value;

                        //        //    if (v_columfechaxml.ToUpper() == tmp_columna.ToUpper())
                        //        //    {
                        //        //        tt_fecha = tmp_columna_valor;
                        //        //    }
                        //        //    else
                        //        //    {

                        //        //        if (v_columtiendaxml.ToUpper() == tmp_columna.ToUpper())
                        //        //        {
                        //        //            tt_tienda = tmp_columna_valor;
                        //        //        }
                        //        //        else
                        //        //        {
                        //        //            continue;
                        //        //        }
                        //        //    }


                        //        //}

                        //        //Registrar fecha y tienda a Eliminar..................
                        //        //if (tt_tienda == "" || tt_fecha == "")
                        //        //{
                        //        //    cllog.escribirLOG("Error procesarxml().Eliminar. No se encuentra fecha y codtienda para eliminar, revisar el xml : " +
                        //        //        "[" + tmp_tabla + "][columfecha:" + v_columfechaxml + "]" + "[columtienda:" + v_columtiendaxml + "]" +
                        //        //        "Archivo: [" + tmp_arch + "]");
                        //        //    result = "Error procesarxml().Eliminar. No se encuentra fecha y codtienda para eliminar, revisar el xml : " +
                        //        //        "[" + tmp_tabla + "][columfecha:" + v_columfechaxml + "]" + "[columtienda:" + v_columtiendaxml + "]" +
                        //        //        "Archivo: [" + tmp_arch + "]";
                        //        //    return result;
                        //        //}

                        //        //string comp_fechatablatienda = tt_fecha + "|" + tmp_tabla + "|" + tt_tienda;

                        //        string comp_fechatablatienda = tmp_tabla;
                        //        bool tmp_fecha_tabla_tiendadel_exist = false;
                        //        for (int y = 0; y < fecha_tabla_tiendadel.Count; y++)
                        //        {
                        //            if (fecha_tabla_tiendadel[y].ToUpper() == comp_fechatablatienda.ToUpper())
                        //            {
                        //                tmp_fecha_tabla_tiendadel_exist = true;
                        //            }
                        //        }
                        //        if (!tmp_fecha_tabla_tiendadel_exist)
                        //        {
                        //            fecha_tabla_tiendadel.Add(comp_fechatablatienda);
                        //        }
                        //        //........................................................




                        //    }

                        //    //---------------------------------------


                        //}




                        ////Eliminar registros------------------


                        //for (int y = 0; y < fecha_tabla_tiendadel.Count; y++)
                        //{
                        //    //MessageBox.Show(fecha_tabla_tiendadel[y]);
                        //    //continue;
                        //    //String[] tmp_fecha_tabla_tiendadel;

                        //    //tmp_fecha_tabla_tiendadel = fecha_tabla_tiendadel[y].Split('|');
                        //    //string tp_fecha_val = tmp_fecha_tabla_tiendadel[0];
                        //    //string tp_tablaxml = tmp_fecha_tabla_tiendadel[1];
                        //    //Int64 tp_codtienda_val = Convert.ToInt64(tmp_fecha_tabla_tiendadel[2]);

                        //    string tp_tablaxml = fecha_tabla_tiendadel[y];
                        //    DataRow[] rwtabladel = globales.Gedsejecutartabladel.Tables[0].Select("nomtablaxml='" + tp_tablaxml + "'");
                        //    if (rwtabladel.Length > 0)
                        //    {
                        //        string v_codtabla = rwtabladel[0]["codtabla"].ToString();
                        //        string v_tabla = rwtabladel[0]["nomtabla"].ToString();
                        //        string v_tablaxml = rwtabladel[0]["nomtablaxml"].ToString();

                        //        //string tmp_delete_tabla = "";
                        //        //tmp_delete_tabla = cldatos.delete_archivoimport_mysql(cnMysql_BD, v_tabla, "fecha_venpro", tmp_fecharegistro,
                        //        //     "codtienda_venpro", tmp_codtienda_venpro, "archivo_venpro", arch);

                        //        string tmp_delete_tabla = "1";
                        //        if (tmp_delete_tabla == "1")
                        //        {
                        //            ////tabladel.Add(v_tabla);
                        //            //tablaxmldel.Add(tmp_tabla);
                        //        }
                        //        else
                        //        {
                        //            result = tmp_delete_tabla;
                        //            Modesribirmensajeform(tmp_delete_tabla);
                        //            return result;
                        //        }
                        //    }

                        //}
                        //--------------------------


                        bool tmp_elim_archiv_err = false;
                        //INSERTAR------
                        for (int i = 0; i < nodolist[0].ChildNodes.Count; i++)
                        {
                            //PUEDE SER: /Root/Ticket
                            //PUEDE SER: /Root/Events

                            //XmlNode nodo = nodolist[i];
                            //MessageBox.Show("Nodo:" + nodolist[0].ChildNodes[i].Name );

                            tmp_tag1 = "";
                            tmp_tag2 = "";
                            tmp_tabla = "";
                            tmp_columna = "";
                            tmp_columna_valor = "";

                            tmp_tag1 = nodolist[0].Name;
                            tmp_tag2 = nodolist[0].ChildNodes[i].Name;

                            for (int k = 0; k < nodolist[0].ChildNodes[i].ChildNodes.Count; k++)
                            {
                                //SON TABLAS......
                                //PUEDE SER: /Root/Ticket/Frame
                                //PUEDE SER: /Root/Ticket/PLU
                                //PUEDE SER: /Root/Ticket/Discount
                                //PUEDE SER: /Root/Ticket/InfoSPF
                                //PUEDE SER: /Root/Ticket/Total
                                //PUEDE SER: /Root/Events/Q-Length
                                //PUEDE SER: /Root/Events/Enter_Secure



                                //CARGAR COLUMNAS DE LA TABLA-----------------------------------
                                tmp_tag1 = "";
                                tmp_tag2 = "";
                                tmp_tabla = "";
                                tmp_columna = "";
                                tmp_columna_valor = "";

                                tmp_tag1 = nodolist[0].Name;
                                tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                                tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;


                                //VERIFICAR SI EXISTE TABLA-----------------
                                bool tmp_existe_tabla = false;
                                for (int x = 0; x < globales.Gedsejecutartabladel.Tables[0].Rows.Count; x++)
                                {
                                    string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["codtabla"].ToString();
                                    string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtabla"].ToString();
                                    string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtablaxml"].ToString(); // compara valor tablaxml

                                    //cllog.escribirLOG("Error procesarxml(). No se encontro la tabla: " + "[bd:{" + v_tabla + "} - XML:{"+ tmp_tabla + "} ] Archivo: [" + tmp_arch + "]");

                                    if (v_tablaxml.ToUpper() == tmp_tabla.ToUpper())
                                    {
                                        tmp_existe_tabla = true;
                                    }

                                }

                                if (!tmp_existe_tabla)
                                {

                                    if (globales.Gractbusqtag)
                                    {
                                        cllog.escribirLOG("Error procesarxml_sql(). No se encontro la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");

                                        cldatos_tmp.insert_validacionxml_sql(cnsql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, "");
                                    }
                                    continue;
                                }
                                //-------------------------------------------

                                List<String> v_columnaxFila = new List<String>();
                                List<String> v_valorxFila = new List<String>();
                                string tmp_valorFila = "";
                                //dscolumnas = new DataSet();
                                rwcolumnas = null;
                                rwcolumnas = globales.Gedsejecutartablaimport.Tables[0].Select("nomtablaxml='" + tmp_tabla + "'");

                                //MessageBox.Show("Tabla:" + tmp_tabla + " colum" + rwcolumnas.Length.ToString() +
                                //    " Primer:" + rwcolumnas[0]["nomcolumna"].ToString() + " Primer posi:" + rwcolumnas[0]["posicioncolum"].ToString());
                                ////continue;
                                //rowregla[i]["PRMCODUSR"].ToString();
                                if (rwcolumnas.Length <= 0)
                                {

                                    continue;
                                }
                                else
                                {


                                    //valorxFila = new string[nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count];
                                    //columnaxFila = new string[nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count];

                                    t_codtabla = -1;
                                    t_estadoactivo = false;
                                    t_modoactualizacion = "";
                                    t_columnaupdate = 0;
                                    t_columnaupdate1 = 0;
                                    t_columnaupdate2 = 0;
                                    t_columnaupdate3 = 0;
                                    t_columnaupdate4 = 0;
                                    t_columnaupdate5 = 0;
                                    t_columnaupdate6 = 0;
                                    t_columnaupdate7 = 0;

                                    t_estadoactivo = Convert.ToBoolean(Convert.ToInt32(rwcolumnas[0]["estadoactivo"]));

                                    if (t_estadoactivo == false)
                                    {
                                        continue;
                                    }

                                    t_codtabla = Convert.ToInt64(rwcolumnas[0]["codtabla"].ToString());
                                    t_nomtabla = rwcolumnas[0]["nomtabla"].ToString(); //Carga nombre tabla BD
                                    t_modoactualizacion = rwcolumnas[0]["modoactualizacion"].ToString();

                                    if (rwcolumnas[0]["col_posicion_update"].ToString() == "")
                                    {
                                        t_columnaupdate = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate = Convert.ToInt32(rwcolumnas[0]["col_posicion_update"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update1"].ToString() == "")
                                    {
                                        t_columnaupdate1 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate1 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update1"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update2"].ToString() == "")
                                    {
                                        t_columnaupdate2 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate2 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update2"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update3"].ToString() == "")
                                    {
                                        t_columnaupdate3 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate3 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update3"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update4"].ToString() == "")
                                    {
                                        t_columnaupdate4 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate4 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update4"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update5"].ToString() == "")
                                    {
                                        t_columnaupdate5 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate5 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update5"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update6"].ToString() == "")
                                    {
                                        t_columnaupdate6 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate6 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update6"].ToString());
                                    }

                                    if (rwcolumnas[0]["col_posicion_update7"].ToString() == "")
                                    {
                                        t_columnaupdate7 = 0;
                                    }
                                    else
                                    {
                                        t_columnaupdate7 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update7"].ToString());
                                    }




                                }
                                //----------------------------------

                                //COLUMNAS....

                                for (int p = 0; p < nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count; p++)
                                {
                                    //SON COLUMNAS......
                                    //PUEDE SER: /Root/Ticket/Frame.Tr_Frame
                                    //PUEDE SER: /Root/Ticket/Frame.Tail_Fecha 
                                    //PUEDE SER: /Root/Ticket/Frame.Tail_NumPOS

                                    //nodolist[i].ParentNode.Value;

                                    bool c_validacion_colum = false;
                                    //----------------------------------
                                    tmp_tag1 = "";
                                    tmp_tag2 = "";
                                    tmp_tabla = "";
                                    tmp_columna = "";
                                    tmp_columna_valor = "";

                                    tmp_tag1 = nodolist[0].Name;
                                    tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                                    tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;
                                    tmp_columna = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Name;
                                    tmp_columna_valor = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Value.Trim();


                                    //if rwcolumnas.Count <= 0)
                                    //{
                                    //    //cllog.escribirLOG("Error procesarxml(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");
                                    //    result = "Error procesarxml(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]";

                                    //    cldatos.insert_validacionxml_mysql(cnmysql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, tmp_columna);
                                    //    break;
                                    //}
                                    //-------------------------------------


                                    for (int m = 0; m < rwcolumnas.Length; m++)
                                    {
                                        string col_nomcolumnaxml = rwcolumnas[m]["nomcolumnaxml"].ToString(); // se compara columnaxml

                                        if (col_nomcolumnaxml.ToUpper() != tmp_columna.ToUpper())
                                        {
                                            continue;
                                        }

                                        int col_posicion = col_posicion = Convert.ToInt32(rwcolumnas[m]["posicioncolum"].ToString());
                                        string col_tipocolumna = rwcolumnas[m]["tipocolumna"].ToString();
                                        string col_formato = rwcolumnas[m]["formato"].ToString();
                                        string t_valorFila = tmp_columna_valor;
                                        string t_columnaFila = rwcolumnas[m]["nomcolumna"].ToString(); //nombre bd

                                        //VarChar
                                        //Char
                                        //DateTime
                                        //Date
                                        //Time
                                        //Double
                                        //Bit
                                        //Int
                                        //Text

                                        //codtabla
                                        //nomtabla
                                        //col_posicion_update
                                        //codtabla
                                        //codcolumna
                                        //posicion
                                        //codcolumna
                                        //nomcolumna
                                        //tipocolumna
                                        //size
                                        //formato


                                        //CONCATENA LA FILA-------------
                                        if (m == 0)
                                        {
                                            tmp_valorFila = t_valorFila;
                                        }
                                        else
                                        {
                                            tmp_valorFila = tmp_valorFila + ", " + t_valorFila;
                                        }
                                        //-----------------------

                                        if (col_tipocolumna == "Double")
                                        {
                                            char t_formatocultura = Convert.ToChar(col_formato);
                                            t_valorFila = Convert.ToDouble(globales.convertformatodecimal(t_formatocultura, t_valorFila)).ToString();
                                        }

                                        if (col_tipocolumna == "Date")
                                        {

                                            DateTime datTime;
                                            if (DateTime.TryParse(t_valorFila, out datTime))
                                            {
                                                DateTime tmpfecha = new DateTime();
                                                tmpfecha = DateTime.ParseExact(t_valorFila, col_formato, System.Globalization.CultureInfo.InvariantCulture);
                                                //tmpfecha = Convert.ToDateTime(t_valorFila);
                                                t_valorFila = tmpfecha.ToString("yyyy-MM-dd");
                                            }
                                        }

                                        if (col_tipocolumna == "DateTime" || col_tipocolumna == "Time")
                                        {

                                            DateTime datTime;
                                            if (DateTime.TryParse(t_valorFila, out datTime))
                                            {
                                                DateTime tmpfecha = new DateTime();
                                                tmpfecha = DateTime.ParseExact(t_valorFila, col_formato, System.Globalization.CultureInfo.InvariantCulture);
                                                //tmpfecha = Convert.ToDateTime(t_valorFila);
                                                t_valorFila = tmpfecha.ToString(col_formato);
                                            }
                                        }

                                        //Agregar columna y valor......
                                        v_columnaxFila.Add(t_columnaFila); //Se agrega la el nombre de la columna de la BD, no el del xml.
                                        v_valorxFila.Add(t_valorFila);
                                        //......................

                                        c_validacion_colum = true;

                                        break;
                                    }

                                    //VALIDACION--------
                                    if (!c_validacion_colum)
                                    {
                                        if (globales.Gractbusqtag)
                                        {
                                            cllog.escribirLOG("Inf procesarxml_sql(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");
                                            cldatos_tmp.insert_validacionxml_sql(cnsql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, tmp_columna);
                                        }
                                    }
                                    //------------------

                                }

                                //INSERTAR------------

                                //if (v_columnaxFila.Count == rwcolumnas.Length && rwcolumnas.Length >= 0)
                                //{
                                string tmp_insert = "";
                                tmp_insert = cldatos_tmp.insert_archivoimport_sql(cnsql_BD, tmp_fecharegistro, tmp_codtienda_venpro, arch, t_codtabla, t_nomtabla, t_modoactualizacion, t_columnaupdate, t_columnaupdate1, t_columnaupdate2,
                                      t_columnaupdate3, t_columnaupdate4, t_columnaupdate5, t_columnaupdate6, t_columnaupdate7, rwcolumnas,
                                      v_columnaxFila, v_valorxFila);



                                if (tmp_insert != "1")
                                {
                                    result = result + "[" + tmp_insert + "]";

                                    cont_err = cont_err + 1;

                                    if (cont_err >= 1)
                                    {
                                        result = result + "[procesarxml_sql(). Se interrumpio la lectura del archivo XML " + arch + " por mas de 1 errores consecutivos.]";

                                        cllog.escribirLOG("Error procesarxml_sql(). Se interrumpio la lectura del archivo XML por mas de 1 errores consecutivos. [" + ruta + "]" + "[" + tmp_arch + "] [" +
                                          "tag1: " + tmp_tag1 + "\r\n" +
                                          "tag2: " + tmp_tag2 + "\r\n" +
                                          "tag3_tabla: " + tmp_tabla + "\r\n" +
                                          "tag4_columna: " + tmp_columna + "\r\n" +
                                          "tag4_columna_valor: " + tmp_columna_valor + "\r\n");

                                        break;
                                    }
                                    //tmp_elim_archiv_err = false;
                                    //if (tmp_insert.ToUpper().Contains("PRIMARY"))
                                    //{//Se indentifico que la informacion PRYMARY existe pero esta en otra fecha_venpro.

                                    //    try
                                    //    {
                                    //        if (!Directory.Exists(ruta + "\\old\\"))
                                    //            Directory.CreateDirectory(ruta + "\\old\\");

                                    //        //File.Delete(tmp_arch);
                                    //        File.Move(ruta + "\\" + arch, ruta + "\\old\\" + arch);

                                    //        cllog.escribirLOG("procesarxml().movió a carpeta OLD el Archivo por PRIMARY.[" + tmp_arch + "] ");
                                    //        tmp_elim_archiv_err = true;
                                    //        break;

                                    //    }
                                    //    catch (Exception exx)
                                    //    {
                                    //        //result = false;
                                    //        //Escribiendo Log.......
                                    //        cllog.escribirLOG("Error procesarxml.moverArchivo_OLD(). No se pudo Mover.[" + tmp_arch + "] " + exx.ToString());
                                    //        //fin Log...............

                                    //        try
                                    //        {
                                    //            File.Delete(tmp_arch);
                                    //            cllog.escribirLOG("procesarxml().se eliminó el Archivo por PRIMARY.[" + tmp_arch + "] ");
                                    //            tmp_elim_archiv_err = true;
                                    //            break;
                                    //        }
                                    //        catch (Exception exxx)
                                    //        {
                                    //            //result = false;
                                    //            //Escribiendo Log.......
                                    //            cllog.escribirLOG("Error procesarxml.eliminarArchivo(). No se pudo Mover.[" + tmp_arch + "] " + exxx.ToString());
                                    //            //fin Log...............
                                    //        }
                                    //    }
                                    //}



                                    //if (tmp_insert.ToUpper().Contains("TIMEOUT"))
                                    //{//Lock wait timeout exceeded; try restarting transaction: 
                                    //    //Se esta Realizando consulta y se ha bloqueado las tablas, 
                                    //    //se debe volver a ejecutar otra vez la consulta.
                                    //    try
                                    //    {
                                    //        //File.Delete(tmp_arch);
                                    //        //cllog.escribirLOG("procesarxml().Se elimino Archivo.[" + tmp_arch + "] ");
                                    //        result = result + "["+ tmp_insert + "]";
                                    //        //tmp_elim_archiv_err = true;
                                    //        break;

                                    //    }
                                    //    catch (Exception exx)
                                    //    {
                                    //        //result = false;
                                    //        //Escribiendo Log.......
                                    //        cllog.escribirLOG("Error procesarxml.TIMEOUT().[" + tmp_arch + "] " + exx.ToString());
                                    //        //fin Log...............
                                    //    }                                        

                                    //}

                                    //if (tmp_elim_archiv_err)
                                    //{
                                    //    Modesribirmensajeform(tmp_insert);
                                    //}


                                }
                                //}
                                //else { 
                                //cllog.escribirLOG("No cargo filascargadas:" + v_columnaxFila.Count.ToString() + " filas: " + rwcolumnas.Count.ToString() );
                                //}


                                //--------------------


                            }

                            if (cont_err >= 1)
                            {
                                break;
                            }
                        }



                    }


                }
                ////Cerrar conexion....
                //if (cnMysql_BD.State != ConnectionState.Closed)
                //{
                //    cnMysql_BD.Close();
                //    cnMysql_BD.ClearAllPoolsAsync();
                //    //MySqlConnection.ClearPool(cnMysql_BD);
                //    cnMysql_BD.Dispose();
                //}
                ////............


                //---------------------------------------------------------------------------------
                //try
                //{
                //    arbol = new XmlDocument();
                //}
                //catch
                //{

                //}
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error procesarxml_sql(). [" + ruta + "]" + "[" + tmp_arch + "] [" +
                      "tag1: " + tmp_tag1 + "\r\n" +
                      "tag2: " + tmp_tag2 + "\r\n" +
                      "tag3_tabla: " + tmp_tabla + "\r\n" +
                      "tag4_columna: " + tmp_columna + "\r\n" +
                      "tag4_columna_valor: " + tmp_columna_valor + "\r\n" +
                     ex.ToString());
                //fin Log...............

                result = "Error procesarxml_sql(). [" + ruta + "]" + "[" + tmp_arch + "] [" +
                      "tag1: " + tmp_tag1 + "\r\n" +
                      "tag2: " + tmp_tag2 + "\r\n" +
                      "tag3_tabla: " + tmp_tabla + "\r\n" +
                      "tag4_columna: " + tmp_columna + "\r\n" +
                      "tag4_columna_valor: " + tmp_columna_valor + "\r\n" +
                     ex.ToString();

            }
            //cllog.escribirLOG("procesarxml(). Procesado. [" + ruta + "][" + arch +"]" );
            return result;

        }

        private string procesarxml_csv(string fecha_venpro, Int64 codtienda, string ruta, string rutatienda, string arch, string fechahoraload)
        {

            string result = "1";
            //DataSet dscolumnas;
            string tmp_fecharegistro = fecha_venpro;
            Int64 tmp_codtienda_venpro = codtienda;
            string delimiter = ";";
            string extension = ".csv";
            HashSet<string> list_archivosload = new HashSet<string>(); //Guarda lista No repetida.
            Dictionary<string, string> tablasList = new Dictionary<string, string>();

            VENPRO.cldatos_mysql cldatos_tmp = new VENPRO.cldatos_mysql();
            int cont_err = 0;

            //....................

            //'..........................................................
            //    Dim m_xmld As New XmlDocument
            //    Dim m_nodelist As XmlNodeList
            //    Dim m_node As XmlNode

            string tmp_arch = ruta + "\\" + arch;
            //string tmp_arch = @"E:\VENPRO\VENPRO\bin\Debug\import" + "\\" + "TRPER20140717A1361.XML";
            //"TRPER20140717A1066.XML";

            XmlDocument arbol;
            arbol = new XmlDocument();
            StreamReader leer_archivo;
            DataRow[] rwcolumnas;
            //string tmp_fecharegistro = globales.Grtimeserv.ToString("yyyy-MM-dd");
            leer_archivo = null;

            try
            {
                leer_archivo = File.OpenText(tmp_arch);
                String readfile = leer_archivo.ReadToEnd();
                arbol.LoadXml("<?xml version='1.0' encoding='ISO-8859-1'?>" + readfile);
                leer_archivo.Close();
                leer_archivo.Dispose();
                //arbol.Load(tmp_arch);
            }
            catch (Exception exx)
            {
                //Escribiendo Log.......
                globales.escribirLOG("Error al cargar XML procesarxml_csv(). " + "[" + ruta + "\\" + arch + "]" + exx.ToString());
                //fin Log...............

                try
                {
                    leer_archivo.Close();
                    leer_archivo.Dispose();
                }
                catch
                {

                }

                return result;

            }


            XmlNodeList nodolist;
            //int tot;

            //cllog.escribirLOG(arbol.ChildNodes.Count.ToString() + " ." + ruta + " " + arch);
            //if (arbol.ChildNodes.Count > 0) { 

            //}

            nodolist = arbol.SelectNodes("/Root");


            String tmp_tag1 = "";
            String tmp_tag2 = "";
            String tmp_tabla = "";
            String tmp_columna = "";
            String tmp_columna_valor = "";

            Int64 t_codtabla = -1;
            string t_nomtabla = "";
            Boolean t_estadoactivo = false;
            //Int64 t_codconexionbd = -1;
            //string t_nomconexion = "";
            //string t_conexion = "";
            //string t_nomtipoconexion = "";
            //Int64 t_codtipoconexion = -1;
            string t_modoactualizacion = "";
            int t_columnaupdate = 0;
            int t_columnaupdate1 = 0;
            int t_columnaupdate2 = 0;
            int t_columnaupdate3 = 0;
            int t_columnaupdate4 = 0;
            int t_columnaupdate5 = 0;
            int t_columnaupdate6 = 0;
            int t_columnaupdate7 = 0;


            try
            {

                try
                {
                    globales.Gcontprocesadosxml = globales.Gcontprocesadosxml + 1;
                }
                catch { }






                if (nodolist[0].ChildNodes.Count > 0)
                {
                    


                    bool tmp_elim_archiv_err = false;
                    //INSERTAR------
                    for (int i = 0; i < nodolist[0].ChildNodes.Count; i++)
                    {
                        //PUEDE SER: /Root/Ticket
                        //PUEDE SER: /Root/Events

                        //XmlNode nodo = nodolist[i];
                        //MessageBox.Show("Nodo:" + nodolist[0].ChildNodes[i].Name );

                        tmp_tag1 = "";
                        tmp_tag2 = "";
                        tmp_tabla = "";
                        tmp_columna = "";
                        tmp_columna_valor = "";

                        tmp_tag1 = nodolist[0].Name;
                        tmp_tag2 = nodolist[0].ChildNodes[i].Name;

                        for (int k = 0; k < nodolist[0].ChildNodes[i].ChildNodes.Count; k++)
                        {
                            //SON TABLAS......
                            //PUEDE SER: /Root/Ticket/Frame
                            //PUEDE SER: /Root/Ticket/PLU
                            //PUEDE SER: /Root/Ticket/Discount
                            //PUEDE SER: /Root/Ticket/InfoSPF
                            //PUEDE SER: /Root/Ticket/Total
                            //PUEDE SER: /Root/Events/Q-Length
                            //PUEDE SER: /Root/Events/Enter_Secure



                            //CARGAR COLUMNAS DE LA TABLA-----------------------------------
                            tmp_tag1 = "";
                            tmp_tag2 = "";
                            tmp_tabla = "";
                            tmp_columna = "";
                            tmp_columna_valor = "";

                            tmp_tag1 = nodolist[0].Name;
                            tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                            tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;


                            //VERIFICAR SI EXISTE TABLA-----------------
                            bool tmp_existe_tabla = false;
                            for (int x = 0; x < globales.Gedsejecutartabladel.Tables[0].Rows.Count; x++)
                            {
                                string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["codtabla"].ToString();
                                string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtabla"].ToString();
                                string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtablaxml"].ToString(); // compara valor tablaxml

                                //cllog.escribirLOG("Error procesarxml(). No se encontro la tabla: " + "[bd:{" + v_tabla + "} - XML:{"+ tmp_tabla + "} ] Archivo: [" + tmp_arch + "]");

                                if (v_tablaxml.ToUpper() == tmp_tabla.ToUpper())
                                {
                                    tmp_existe_tabla = true;
                                }

                            }

                            if (!tmp_existe_tabla)
                            {

                                if (globales.Gractbusqtag)
                                {
                                    cllog.escribirLOG("Error procesarxml_csv(). No se encontro la tabla: " + "[" + tmp_tabla + "] Archivo: [" + tmp_arch + "]");

                                    cldatos_tmp.insert_validacionxml_mysql(cnmysql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, "");
                                }
                                continue;
                            }
                            //-------------------------------------------

                            List<String> v_columnaxFila = new List<String>();
                            List<String> v_valorxFila = new List<String>();
                            //string tmp_valorFila = "";
                            //dscolumnas = new DataSet();
                            rwcolumnas = null;
                            rwcolumnas = globales.Gedsejecutartablaimport.Tables[0].Select("nomtablaxml='" + tmp_tabla + "'");

                            //MessageBox.Show("Tabla:" + tmp_tabla + " colum" + rwcolumnas.Length.ToString() +
                            //    " Primer:" + rwcolumnas[0]["nomcolumna"].ToString() + " Primer posi:" + rwcolumnas[0]["posicioncolum"].ToString());
                            ////continue;
                            //rowregla[i]["PRMCODUSR"].ToString();
                            if (rwcolumnas.Length <= 0)
                            {

                                continue;
                            }
                            else
                            {


                                //valorxFila = new string[nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count];
                                //columnaxFila = new string[nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count];

                                t_codtabla = -1;
                                t_estadoactivo = false;
                                t_modoactualizacion = "";
                                t_columnaupdate = 0;
                                t_columnaupdate1 = 0;
                                t_columnaupdate2 = 0;
                                t_columnaupdate3 = 0;
                                t_columnaupdate4 = 0;
                                t_columnaupdate5 = 0;
                                t_columnaupdate6 = 0;
                                t_columnaupdate7 = 0;

                                t_estadoactivo = Convert.ToBoolean(Convert.ToInt32(rwcolumnas[0]["estadoactivo"]));

                                if (t_estadoactivo == false)
                                {
                                    continue;
                                }

                                t_codtabla = Convert.ToInt64(rwcolumnas[0]["codtabla"].ToString());
                                t_nomtabla = rwcolumnas[0]["nomtabla"].ToString(); //Carga nombre tabla BD
                                t_modoactualizacion = rwcolumnas[0]["modoactualizacion"].ToString();

                                if (rwcolumnas[0]["col_posicion_update"].ToString() == "")
                                {
                                    t_columnaupdate = 0;
                                }
                                else
                                {
                                    t_columnaupdate = Convert.ToInt32(rwcolumnas[0]["col_posicion_update"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update1"].ToString() == "")
                                {
                                    t_columnaupdate1 = 0;
                                }
                                else
                                {
                                    t_columnaupdate1 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update1"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update2"].ToString() == "")
                                {
                                    t_columnaupdate2 = 0;
                                }
                                else
                                {
                                    t_columnaupdate2 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update2"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update3"].ToString() == "")
                                {
                                    t_columnaupdate3 = 0;
                                }
                                else
                                {
                                    t_columnaupdate3 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update3"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update4"].ToString() == "")
                                {
                                    t_columnaupdate4 = 0;
                                }
                                else
                                {
                                    t_columnaupdate4 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update4"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update5"].ToString() == "")
                                {
                                    t_columnaupdate5 = 0;
                                }
                                else
                                {
                                    t_columnaupdate5 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update5"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update6"].ToString() == "")
                                {
                                    t_columnaupdate6 = 0;
                                }
                                else
                                {
                                    t_columnaupdate6 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update6"].ToString());
                                }

                                if (rwcolumnas[0]["col_posicion_update7"].ToString() == "")
                                {
                                    t_columnaupdate7 = 0;
                                }
                                else
                                {
                                    t_columnaupdate7 = Convert.ToInt32(rwcolumnas[0]["col_posicion_update7"].ToString());
                                }




                            }
                            //----------------------------------

                            //COLUMNAS....

                            for (int m = 0; m < rwcolumnas.Length; m++)
                            {
                                string col_nomcolumnaxml = rwcolumnas[m]["nomcolumnaxml"].ToString(); // se compara columnaxml

                                int col_posicion = col_posicion = Convert.ToInt32(rwcolumnas[m]["posicioncolum"].ToString());
                                string col_tipocolumna = rwcolumnas[m]["tipocolumna"].ToString();
                                string col_formato = rwcolumnas[m]["formato"].ToString();
                                string t_columnaFila = rwcolumnas[m]["nomcolumna"].ToString(); //nombre bd
                                string t_valorFila = "";

                                bool c_validacion_colum = false;
                                for (int p = 0; p < nodolist[0].ChildNodes[i].ChildNodes[k].Attributes.Count; p++)
                                {
                                    //SON COLUMNAS......
                                    //PUEDE SER: /Root/Ticket/Frame.Tr_Frame
                                    //PUEDE SER: /Root/Ticket/Frame.Tail_Fecha 
                                    //PUEDE SER: /Root/Ticket/Frame.Tail_NumPOS

                                    //nodolist[i].ParentNode.Value;
                                    //----------------------------------
                                    tmp_tag1 = "";
                                    tmp_tag2 = "";
                                    tmp_tabla = "";
                                    tmp_columna = "";
                                    tmp_columna_valor = "";

                                    tmp_tag1 = nodolist[0].Name;
                                    tmp_tag2 = nodolist[0].ChildNodes[i].Name;
                                    tmp_tabla = nodolist[0].ChildNodes[i].ChildNodes[k].Name;
                                    tmp_columna = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Name;

                                    if (col_nomcolumnaxml.ToUpper() != tmp_columna.ToUpper())
                                    {
                                        continue;
                                    }

                                    tmp_columna_valor = nodolist[0].ChildNodes[i].ChildNodes[k].Attributes[p].Value.Trim();
                                    t_valorFila = tmp_columna_valor;
                                    c_validacion_colum = true;
                                    break;
                                }

                                //VALIDACION--------
                                if (c_validacion_colum)
                                {
                                    //Agregar columna y valor......
                                    v_columnaxFila.Add(t_columnaFila); //Se agrega la el nombre de la columna de la BD, no el del xml.
                                    v_valorxFila.Add(t_valorFila);
                                    //......................

                                }
                                else
                                {
                                    //Agregar columna y valor......
                                    v_columnaxFila.Add(t_columnaFila); //Se agrega la el nombre de la columna de la BD, no el del xml.
                                    v_valorxFila.Add("");
                                    //......................

                                    ////Registrar solo una vez si no encuentra, no una por cada registro.
                                    //if (globales.Gractbusqtag)
                                    //{
                                    //    cllog.escribirLOG("Inf procesarxml_csv(). No se encontro datos de columna en la tabla: " + "[" + tmp_tabla + "]" + " Columna: [" + t_columnaFila + "]" + "Archivo: [" + tmp_arch + "]");
                                    //    //cldatos_tmp.insert_validacionxml_mysql(cnmysql_venpro, tmp_fecharegistro, ruta, arch, tmp_tag1, tmp_tag2, tmp_tabla, t_columnaFila);
                                    //}


                                }
                                //------------------

                            }

                            //INSERTAR------------



                            //string tmp_insert = "";
                            //tmp_insert = cldatos_tmp.insert_archivoimport_Mysql(cnMysql_BD, tmp_fecharegistro, tmp_codtienda_venpro, arch, t_codtabla, t_nomtabla, t_modoactualizacion, t_columnaupdate, t_columnaupdate1, t_columnaupdate2,
                            //      t_columnaupdate3, t_columnaupdate4, t_columnaupdate5, t_columnaupdate6, t_columnaupdate7, rwcolumnas,
                            //      v_columnaxFila, v_valorxFila);

                            //string t_col = "archivo_venpro" + delimiter + "fecha_venpro" + delimiter + "fechaprocesamiento_venpro" + delimiter + "codtienda_venpro" + delimiter  + string.Join(delimiter, v_columnaxFila.ToArray());
                            string t_col_val = arch + delimiter + fecha_venpro + delimiter + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + delimiter + codtienda.ToString() + delimiter + string.Join(delimiter, v_valorxFila.ToArray()) + "\r\n";
                            // tmp_insert = cllog.escribirscv(rutatienda + "\\load\\", "tmp_"+ codtienda.ToString() + "_" + arch.Replace(".", "") + "_" + t_nomtabla + extension, t_col_val);

                            if (!tablasList.ContainsKey(t_nomtabla))
                            {
                                tablasList[t_nomtabla] = t_col_val;
                            }
                            else
                            {
                                tablasList[t_nomtabla] += t_col_val;
                            }

                            //if (tmp_insert == "1") {
                            //    list_archivosload.Add(codtienda.ToString() + "_" + arch.Replace(".", "") + "_" + t_nomtabla + extension);
                            //}else{
                            //    result = result + "[" + tmp_insert + "]";

                            //    cont_err = cont_err + 1;

                            //    if (cont_err >= 1)
                            //    {
                            //        result = result + "[procesarxml_csv(). Se interrumpio la lectura del archivo XML " + arch + " por mas de 1 errores consecutivos.]";

                            //        cllog.escribirLOG("Error procesarxml_csv(). Se interrumpio la lectura del archivo XML por mas de 1 errores consecutivos. [" + ruta + "]" + "[" + tmp_arch + "] [" +
                            //          "tag1: " + tmp_tag1 + "\r\n" +
                            //          "tag2: " + tmp_tag2 + "\r\n" +
                            //          "tag3_tabla: " + tmp_tabla + "\r\n" +
                            //          "tag4_columna: " + tmp_columna + "\r\n" +
                            //          "tag4_columna_valor: " + tmp_columna_valor + "\r\n");

                            //        break;
                            //    }


                            //}

                            //--------------------


                        }

                        //if (cont_err >= 1)
                        //{
                        //    break;
                        //}
                    }

                    //if (cont_err == 0) {
                    //}
                    foreach (var tablalist in tablasList)
                    {
                        //string file_origen = rutatienda + "\\load\\" + "tmp_" + codtienda.ToString() + "_" + arch.Replace(".", "") + "_" + tablalist.Key + extension;
                        string file_origen = rutatienda + "\\load\\" + "tmp_" + codtienda.ToString() + "_" + fechahoraload + "_" + tablalist.Key + extension;
                        string file_destino = rutatienda + "\\load\\" + codtienda.ToString() + "_" + fechahoraload + "_" + tablalist.Key + extension;
                        //cllog.escribirLOG("ORIGEN:" + file_origen);
                        //cllog.escribirLOG("DESTINO:" + file_destino);
                        //File.WriteAllText(file_origen, tablalist.Value);

                        //Write File...
                        //System.IO.StreamWriter sw = new StreamWriter(file_origen, true);
                        //sw.WriteLine(tablalist.Value);
                        //sw.Close();
                        File.AppendAllText(file_origen, tablalist.Value);
                        //...
                        //cllog.escribirLOG("CREANDO ARCHIVO.. " + file_origen);
                        //if (File.Exists(file_destino))
                        //    File.Delete(file_destino);
                        //File.Move(file_origen, file_destino);
                    }

                    

                    //else{
                    //    File.Delete(rutatienda + "\\load\\" + "tmp_"+ codtienda.ToString() + "_" + arch.Replace(".", "") + "_" + t_nomtabla + extension);
                    //}


                }


                
               
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error procesarxml_csv(). [" + ruta + "]" + "[" + tmp_arch + "] [" +
                      "tag1: " + tmp_tag1 + "\r\n" +
                      "tag2: " + tmp_tag2 + "\r\n" +
                      "tag3_tabla: " + tmp_tabla + "\r\n" +
                      "tag4_columna: " + tmp_columna + "\r\n" +
                      "tag4_columna_valor: " + tmp_columna_valor + "\r\n" +
                     ex.ToString());
                //fin Log...............

                result = "Error procesarxml_csv(). [" + ruta + "]" + "[" + tmp_arch + "] [" +
                      "tag1: " + tmp_tag1 + "\r\n" +
                      "tag2: " + tmp_tag2 + "\r\n" +
                      "tag3_tabla: " + tmp_tabla + "\r\n" +
                      "tag4_columna: " + tmp_columna + "\r\n" +
                      "tag4_columna_valor: " + tmp_columna_valor + "\r\n" +
                     ex.ToString();

            }
            //cllog.escribirLOG("procesarxml(). Procesado. [" + ruta + "][" + arch +"]" );
            return result;

        }

        private void import_archivo( Object param)
        {

        //            private bool import_archivo( string fecha_venpro, Int64 codtienda, string ruta)
        //{


            List<String> param_obj = param as List<String>;

            string fecha_venpro = param_obj[0];
            Int64 codtienda = Convert.ToInt64(param_obj[1]);
            string ruta = param_obj[2];
            string fechahoraload = param_obj[3];


            //bool result = true;
            globales.Gedarchivo_ejecucion.Add(ruta);
            globales.Gmensajeperiodicoerr = "";
            //....
            
            string rutaImport = ruta;
            string[] Rutatmp;
            string filetemp = "";
            string rutafile = "";
            string pathfile = "";
            string[] extensionpermitido = { ".xml", ".XML" };
            string archivopermitido = globales.Grarchivopermitido;
            int tmp_cantarchivoprocesaporminuto = globales.Gcantarchivoprocesaporminuto;
            int tmp_cantarchivoporprocesar = 0;

            //-----------------
            //int contador_joinarchivos = 0;
            //int cant_importarchivosparalelo = globales.Gcantarchivoprocesadoparalelo;
            //Thread[] ejecutarthread_importarchivo;
            //ejecutarthread_importarchivo = new Thread[cant_importarchivosparalelo];
            //-----------------

            

            try
            {
                if (globales.Gsolodescarga)
                {
                    return ;
                }
                ////Cargar los archivos Permitidos......
                //if (tipoarchivo_soportado.IndexOf(',') != -1)
                //{
                //    extensionpermitido = tipoarchivo_soportado.Split(',');
                //}
                //else
                //{
                //    extensionpermitido = new string[1];
                //    extensionpermitido[0] = tipoarchivo_soportado;
                //}
                //Valida y crea carpeta si no existe por tienda.
                //if (!Directory.Exists(path_tienda + "\\load\\old\\"))
                //    Directory.CreateDirectory(path_tienda + "\\load\\old\\");
                //....
                ////......................
                if (System.IO.Directory.Exists(rutaImport + "\\old\\") == false)
                {
                    System.IO.Directory.CreateDirectory(rutaImport + "\\old\\");

                }
                if (System.IO.Directory.Exists(rutaImport + "\\load\\old\\") == false)
                {
                    System.IO.Directory.CreateDirectory(rutaImport + "\\load\\old\\");

                }
                //.........
                Application.DoEvents();
                if (!Directory.Exists(rutaImport + "\\tmp\\"))
                    Directory.CreateDirectory(rutaImport + "\\tmp\\");

                if (Directory.GetFiles(rutaImport + "\\tmp\\", "*.*").Length > 0)
                {
                    Rutatmp = Directory.GetFiles(rutaImport + "\\tmp\\", "*.*");

                    for (int i = 0; i < Rutatmp.Length; i++)
                    {
                        pathfile = Rutatmp[i];
                        filetemp = Path.GetFileName(Rutatmp[i]);//Nombre archivo                        
                        rutafile = Path.GetDirectoryName(Rutatmp[i]);// Ruta del Archivo.

                        try
                        {
                            ////Escribiendo Log.......
                            //cllog.escribirLOG("ok import_archivo.Movetmp-rutaorigen(). mover  ORIGEN:[" + pathfile + "].DESTINO:[" + rutaImport + "\\" + filetemp + "] ");
                            ////fin Log...............
                            File.Move(pathfile, rutaImport + "\\" + filetemp);
                        }
                        catch (Exception ex)
                        {
                            //result = false;
                            //Escribiendo Log.......
                            //cllog.escribirLOG("Error import_archivo.Movetmp-rutaorigen(). No se pudo mover  ORIGEN:[" + pathfile + "].DESTINO:[" + rutaImport + "\\" + filetemp + "] " + ex.ToString());
                            //fin Log...............
                        }
                    }
                }

                // ELIMINAR ARCHIVO SI EXISTE EN LOAD PARA NO AGREGAR DATOS y repetir-----
                if (Directory.GetFiles(rutaImport + "\\load\\", "tmp_" + codtienda.ToString() + "_*").Length > 0)
                {
                    string[] TRutatmp = Directory.GetFiles(rutaImport + "\\load\\", "tmp_" + codtienda.ToString() + "_*");

                    for (int x = 0; x < TRutatmp.Length; x++)
                    {
                        string Tpathfile = TRutatmp[x];
                        string Tfiletemp = Path.GetFileName(TRutatmp[x]);//Nombre archivo                        
                        string Trutafile = Path.GetDirectoryName(TRutatmp[x]);// Ruta del Archivo.

                        if (System.IO.File.Exists(Tpathfile) == true)
                        {
                            System.IO.File.Delete(Tpathfile);
                        }
                    }

                }

                //--------------------------

                Rutatmp = new string[1];
                pathfile = "";
                filetemp = "";
                rutafile = "";

                if (Directory.GetFiles(rutaImport, archivopermitido + "*.*",SearchOption.TopDirectoryOnly).Length > 0)
                {
                    Rutatmp = Directory.GetFiles(rutaImport, archivopermitido + "*.*", SearchOption.TopDirectoryOnly);

                    List<String> archivos_procesar = new List<String>();  
                    for (int i = 0; i < Rutatmp.Length; i++)
                    {
                        pathfile = Rutatmp[i];
                        filetemp = Path.GetFileName(Rutatmp[i]);//Nombre archivo                        
                        rutafile = Path.GetDirectoryName(Rutatmp[i]);// Ruta del Archivo.

                        //Validar Extensiones permitidas.......
                        bool existe_extensionpermitido = false;
                        for (int k = 0; k < extensionpermitido.Length; k++)
                        {

                            if (extensionpermitido[k] == Path.GetExtension(pathfile))
                            {
                                existe_extensionpermitido = true;
                                break;
                            }
                        }
                        //cllog.escribirLOG("i:" + i.ToString() + " de Total de:" + Rutatmp.Length + " Extesionpemitido: " + existe_extensionpermitido.ToString() + " "+ filetemp + " .File:" + Path.GetExtension(pathfile));
                        if (!existe_extensionpermitido)
                        {
                            continue;
                        }
                        //....................................

                        //............
                        if (!File.Exists(pathfile))
                        {
                            //Escribiendo Log.......
                            cllog.escribirLOG("Observacion.import_archivo. No se encontro el archivo [Thread: " + Thread.CurrentThread.Name + "][tienda: " + codtienda + "][" + pathfile + " ]");
                            //fin Log...............
                            continue;
                        }
                        //............

                        // ENVIANDO PARA PROCESAR ................

                        //Moviendo archivos a carpeta tmp...............
                        tmp_cantarchivoporprocesar = tmp_cantarchivoporprocesar + 1;
                        //Moviendo a la carpeta IMPORTANDO... 
                        // string pathfile_tmp = "";
                        File.Move(pathfile, rutafile + "\\tmp\\" + filetemp);
                        //pathfile_tmp = rutafile + "\\tmp\\" + filetemp;
                        //...........................
                        archivos_procesar.Add(filetemp);
                        //................................

                        //Escribiendo Log.......
                        //cllog.escribirLOG("Importando Import_tablaimport_RPE_bd. [" + pathfile + " ]...");
                        //fin Log...............
                       
                        //filetemp = Path.GetFileName(pathfile);
                        //rutafile = Path.GetDirectoryName(pathfile);
                        //.......




                        if (tmp_cantarchivoporprocesar >= tmp_cantarchivoprocesaporminuto)
                        {//tmp_cantarchivoprocesaporminuto= procesa 20 XML por minuto (ejemplo)
                            break;
                        }
                        


                    }


                    List<String> parametro = new List<String>();
                    parametro.Add(fecha_venpro);
                    parametro.Add(codtienda.ToString());
                    parametro.Add(rutaImport + "\\tmp\\");//ruta_archivo
                    parametro.Add(String.Join(",",archivos_procesar.ToArray()));//archivos
                    parametro.Add(rutaImport); //ruta_tienda
                    parametro.Add(fechahoraload);

                    procesar_thread_XML(parametro);

                    //---------------------------------------------------------
    
                }

            }
            catch (Exception ex)
            {
                //result = false;
                //Escribiendo Log.......
                cllog.escribirLOG("Error import_archivo(). [" + pathfile + "]. " + ex.ToString());
                //fin Log...............
                Modesribirmensajeform("Error import_archivo(). [" + pathfile + "]. "  + ex.Message);

                //if (globales.GcActivarAlerta)
                //{
                //    string tmp_contenidoMail = globales.Gccontenido + "<BR>" + "Error. No se logro importar tablaimport_RPE_bd. [" + pathfile +
                //            @"] [EVENTO:" + codevento + " - " + nomevento + "] [TABLA:" + tabla + @"] [" + nomconexion + "]"
                //                        + "<BR><BR><BR>" + "Por favor no responder este mensaje, puesto que es originado de forma automatica."
                //                        + "<BR>" + "Atte. SoporteRPE";
                //    globales.NewMail(globales.GcNomMostrar, globales.GcDe, globales.GcTo, globales.GcCC, globales.GcCCO,
                //     globales.Gcasunto, tmp_contenidoMail, globales.GcAdjunto);
                //}

            }

            //try
            //{
            //    if (globales.Gedarchivo_ejecucion.Exists(x => x.EndsWith(Thread.CurrentThread.Name.ToString())))
            //    {
            //        //------------
            //        if (globales.Gedarchivo_ejecucion.Remove(Thread.CurrentThread.Name.ToString()))
            //        {
            //            //cllog.escribirLOG("import_archivo(). Termino el proceso, eliminado [" + Thread.CurrentThread.Name.ToString() + "]");
            //        }
            //        else
            //        {
            //            cllog.escribirLOG("Error. import_archivo(). No termino el proceso, no se pudo eliminar [" + Thread.CurrentThread.Name.ToString() + "]");

            //        };
            //        //------------
            //    }
            //}
            //catch (Exception ex)
            //{
            //    try
            //    {
            //        if (globales.Gedarchivo_ejecucion.Exists(x => x.EndsWith(ruta)))
            //        {
            //            //------------
            //            if (globales.Gedarchivo_ejecucion.Remove(ruta))
            //            {
            //                //cllog.escribirLOG("import_archivo(). Termino el proceso, eliminado [" + Thread.CurrentThread.Name.ToString() + "]");
            //            }
            //            else
            //            {
            //                cllog.escribirLOG("Error. import_archivoGedarchivo_ejecucion.catch(). No termino el proceso, no se pudo eliminar [" + ruta + "]");

            //            };
            //            //------------
            //        }
            //    }
            //    catch 
            //    { }

            //    result = false;
            //    //Escribiendo Log.......
            //    cllog.escribirLOG("Error import_archivo.Gedarchivo_ejecucion(). [" + pathfile + "]. " + ex.ToString());
            //    //fin Log...............
            //    Modesribirmensajeform("Error import_archivo.Gedarchivo_ejecucion(). [" + pathfile + "]. " + ex.Message);


            //}

            //return result;

        }

        private void procesar_thread_XML(Object param)
        {
            
            List<String> param_obj = param as List<String>;

            string fecha_venpro=param_obj[0];
            Int64 codtienda=Convert.ToInt64(param_obj[1]);
            string ruta=param_obj[2];

            string[] t_archivos = param_obj[3].Split(','); // Call Split method
            List<string> list_archivos = new List<string>(t_archivos); //            

            //string arch=param_obj[3];
            string path_tienda = param_obj[4];
            string fechahoraload = param_obj[5];

            List<string> list_archivos_procesados = new List<string>();
            List<string> list_archivos_noprocesados = new List<string>();

           // string tmp_archivo = ruta + "\\" + arch;

            ////Escribiendo Log.......
            //cllog.escribirLOG("procesar_thread_XML().procesando [" + Thread.CurrentThread.Name.ToString() + "][" + ruta + "]. " + arch);
            ////fin Log...............

            string tmp_result = "1";
            //tmp_result = procesarxml(cnMysql_BD, fecha_venpro, codtienda, Path.GetDirectoryName(pathfile), filetemp);
            

            //switch (globales.Gcxconexiontipovenpro)
            //{
            //    case "SQL":
            //        tmp_result = procesarxml_sql(fecha_venpro, codtienda, ruta, arch);
            //        break;

            //    case "Mysql":
            //        tmp_result = procesarxml_Mysql(fecha_venpro, codtienda, ruta, arch);
            //        break;
            //}
                    

            
            try
            {
               

                for (int i = 0; i < list_archivos.Count; i++)
                {
                    String t_archivo = list_archivos[i];
                    tmp_result = procesarxml_csv(fecha_venpro, codtienda, ruta, path_tienda, t_archivo, fechahoraload);
                    if (tmp_result == "1")
                    {
                        list_archivos_procesados.Add(t_archivo);
                        ////Escribiendo Log.......
                        //cllog.escribirLOG("procesar_thread_XML(). Procesado Ok:[" + t_archivo + "]");
                        ////fin Log...............
                    }
                    else
                    {
                        list_archivos_noprocesados.Add(t_archivo);
                    }
                }

                  

                //Finalizando archivo procesado tmp*.csv ............
                for (int x = 0; x < globales.Gedsejecutartabladel.Tables[0].Rows.Count; x++)
                {
                    string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["codtabla"].ToString();
                    string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtabla"].ToString();
                    //string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtablaxml"].ToString(); // compara valor tablaxml
                    string file_origen = path_tienda + "\\load\\" + "tmp_" + codtienda.ToString() + "_" + fechahoraload + "_" + v_tabla + ".csv";
                    string file_destino = path_tienda + "\\load\\" + codtienda.ToString() + "_" + fechahoraload + "_" + v_tabla + ".csv";
                    
                    if (File.Exists(file_origen)) {
                        if (File.Exists(file_destino))
                            File.Delete(file_destino);
                        File.Move(file_origen, file_destino);
                    }                    

                }

                //MOVER LOS ARCHIVOS PROCESADOS............
                for (int i = 0; i < list_archivos_procesados.Count; i++)
                {
                    String t_archivo = list_archivos_procesados[i];


                    try
                    {
                        File.Move(ruta + "\\" + t_archivo, path_tienda + "\\old\\" + t_archivo);
                    }
                    catch (Exception ex)
                    {
                        //result = false;
                        //Escribiendo Log.......
                        cllog.escribirLOG("Error procesar_thread_XML.MoveOld(). No se pudo mover  ORIGEN:[" + ruta + "\\" + t_archivo + "].DESTINO:[" + ruta + "\\old\\" + t_archivo + "] " + ex.ToString());
                        //fin Log...............

                        try
                        {
                            File.Delete(ruta + "\\" + t_archivo);
                        }
                        catch (Exception exx)
                        {
                            //result = false;
                            //Escribiendo Log.......
                            cllog.escribirLOG("Error procesar_thread_XML.MoveOld.ERR(). No se pudo Eliminar.[" + ruta + "\\" + t_archivo + "] " + exx.ToString());
                            //fin Log...............


                        }
                    }
                }

                //MOVER LOS ARCHIVOS NO PROCESADOS A SU RAIZ TIENDA ............
                for (int i = 0; i < list_archivos_noprocesados.Count; i++)
                {
                    String t_archivo = list_archivos_noprocesados[i];

                    try
                    {
                        File.Move(ruta + "\\" + t_archivo, path_tienda + "\\" + t_archivo);
                    }
                    catch (Exception ex)
                    {
                        //result = false;
                        //Escribiendo Log.......
                        cllog.escribirLOG("Error procesar_thread_XML.(). ERROR AL MOVER ARCHIVO NO PROCESADO A SU RAIZ:[" + ruta + "\\" + t_archivo + "].DESTINO:[" + ruta + "\\" + t_archivo + "] " + ex.ToString());
                        //fin Log...............

                        try
                        {
                            File.Delete(ruta + "\\" + t_archivo);
                        }
                        catch (Exception exx)
                        {
                            //result = false;
                            //Escribiendo Log.......
                            cllog.escribirLOG("Error procesar_thread_XML.MoveOld.ERR(). No se pudo Eliminar ARCHIVO NO PROCESADO.[" + ruta + "\\" + t_archivo + "] " + exx.ToString());
                            //fin Log...............


                        }
                    }
                }

                //if (tmp_result == "1")
                //{
                //    if (!Directory.Exists(path_tienda + "\\old\\"))
                //        Directory.CreateDirectory(path_tienda + "\\old\\");

                //    //File.Copy(pathfile, rutafile + "\\old\\" + filetemp, true);
                //    try
                //    {
                //        File.Move(tmp_archivo, path_tienda + "\\old\\" + arch);
                //    }
                //    catch (Exception ex)
                //    {
                //        //result = false;
                //        //Escribiendo Log.......
                //        cllog.escribirLOG("Error procesar_thread_XML.MoveOld(). No se pudo mover  ORIGEN:[" + tmp_archivo + "].DESTINO:[" + ruta + "\\old\\" + arch + "] " + ex.ToString());
                //        //fin Log...............

                //        try
                //        {
                //            File.Delete(tmp_archivo);
                //        }
                //        catch (Exception exx)
                //        {
                //            //result = false;
                //            //Escribiendo Log.......
                //            cllog.escribirLOG("Error procesar_thread_XML.MoveOld.ERR(). No se pudo Eliminar.[" + tmp_archivo + "] " + exx.ToString());
                //            //fin Log...............


                //        }
                //    }
                //    //Eliminar..
                //    //if (File.Exists(pathfile))
                //    //    File.Delete(pathfile);
                //    //Escribiendo Log.......
                //    //cllog.escribirLOG("import_archivo OK. [" + rutafile + "\\old\\" + filetemp + @"]");
                //    //fin Log...............
                //    //tmp_cantarchivoprocesado = tmp_cantarchivoprocesado + 1;


                //}
                //else
                //{

                //    if (tmp_result.ToUpper().Contains("PRIMARY"))
                //    {//Se indentifico que la informacion PRYMARY existe pero esta en otra fecha_venpro.

                //        try
                //        {
                //            if (!Directory.Exists(path_tienda + "\\old\\"))
                //                Directory.CreateDirectory(path_tienda + "\\old\\");

                //            //File.Delete(pathfile);
                //            File.Move(tmp_archivo, path_tienda + "\\old\\" + arch);

                //            cllog.escribirLOG("procesar_thread_XML().se movió a carpeta OLD el Archivo por PRIMARY.[" + tmp_archivo + "] ");
                //            //tmp_elim_archiv_err = true;
                //            //break;

                //        }
                //        catch (Exception exx)
                //        {
                //            //result = false;
                //            //Escribiendo Log.......
                //            cllog.escribirLOG("Error procesar_thread_XML.moverArchivo_OLD(). No se pudo Mover.[" + tmp_archivo + "] " + exx.ToString());
                //            //fin Log...............

                //            try
                //            {
                //                File.Delete(tmp_archivo);
                //                cllog.escribirLOG("procesar_thread_XML().se eliminó el Archivo por PRIMARY.[" + tmp_archivo + "] ");
                //                //tmp_elim_archiv_err = true;
                //                //break;
                //            }
                //            catch (Exception exxx)
                //            {
                //                //result = false;
                //                //Escribiendo Log.......
                //                cllog.escribirLOG("Error procesar_thread_XML.eliminarArchivo(). No se pudo Mover.[" + tmp_archivo + "] " + exxx.ToString());
                //                //fin Log...............
                //            }
                //        }
                //    }
                //    else
                //    {
                //        //Escribiendo Log.......
                //        cllog.escribirLOG("Error. No se logro importar procesar_thread_XML(). [" + tmp_archivo + @"] ");
                //        //fin Log...............
                //        globales.Gmensajeperiodicoerr = "Error. No se logro importar procesar_thread_XML(). [" + tmp_archivo + @"]" + "\r\n" + tmp_result;

                //        //if (globales.GcActivarAlerta)
                //        //{
                //        //    string tmp_contenidoMail = globales.Gccontenido + "<BR>" + "Error. No se logro importar tablaimport_RPE_bd. [" + pathfile +
                //        //@"] [EVENTO:" + codevento + " - " + nomevento + "] [TABLA:" + tabla + @"] [" + nomconexion + "]"
                //        //            + "<BR><BR><BR>" + "Por favor no responder este mensaje, puesto que es originado de forma automatica."
                //        //            + "<BR>" + "Atte. SoporteRPE";
                //        //    globales.NewMail(globales.GcNomMostrar, globales.GcDe, globales.GcTo, globales.GcCC, globales.GcCCO,
                //        //     globales.Gcasunto, tmp_contenidoMail, globales.GcAdjunto);
                //        //}

                //        try
                //        {
                //            File.Move(tmp_archivo, path_tienda + "\\" + arch);
                //        }
                //        catch (Exception ex)
                //        {
                //            //result = false;
                //            //Escribiendo Log.......
                //            cllog.escribirLOG("Error procesar_thread_XML.Move(). No se pudo mover  ORIGEN:[" + tmp_archivo + "].DESTINO:[" + path_tienda + "\\" + arch + "] " + ex.ToString());
                //            //fin Log...............
                //        }


                //    }

                //    //  Modesribirmensajeform("Error import_archivo.Resultado(). " + tmp_result);

                //    //result = false;



                //}


            }
            catch (Exception ex)
            {

                //Escribiendo Log.......
                cllog.escribirLOG("Error procesar_thread_XML(). [" + path_tienda + "]. " + ex.ToString());
                //fin Log...............

            }












        }
        
        private void loadarchivos()
        {

            //            private bool import_archivo( string fecha_venpro, Int64 codtienda, string ruta)
            //{


            List<String> lista_archivos_input_leeidos =  new List<String>();
            List<String> lista_archivos_input_paraold = new List<String>();
            string fechahoraload = DateTime.Now.ToString("yyyyMMddHHmmss");
            List<String> lista_tablas_out = new List<String>();
            //Int64 codtienda = Convert.ToInt64(param_obj[1]);
            //string ruta = param_obj[2];
           

            string[] Rutatmp;
            string pathfile = "";

            string extension = ".csv";
            string delimiter =";";

            //bool result = true;
            //globales.Gedarchivo_ejecucion.Add(ruta);
            //globales.Gmensajeperiodicoerr = "";
            //....

            //string rutaImport = ruta;
            
            string filetemp = "";
            string rutafile = "";
            
            //string[] extensionpermitido = { ".xml", ".XML" };
            //int tmp_cantarchivoprocesado = 0;
            //int tmp_cantarchivoporprocesar = 0;

            ////-----------------
            //int contador_joinarchivos = 0;
            //int cant_importarchivosparalelo = globales.Gcantarchivoprocesadoparalelo;
            //Thread[] ejecutarthread_importarchivo;
            //ejecutarthread_importarchivo = new Thread[cant_importarchivosparalelo];
            ////-----------------



            try
            {
                if (globales.Gsolodescarga)
                {
                    return;
                }
                //......................

                DataSet dstiendasload = globales.Gedsejecutatiendas;
                Dictionary<string, string> tablasList = new Dictionary<string, string>();

                //..LIMPIAR ARCHIVOS NO PROCESADOS LOAD GENERAL...
                if (Directory.GetFiles(globales.GrutaAplicacion + "\\load\\", "*.*").Length > 0)
                {
                    string[] tRutatmp = Directory.GetFiles(globales.GrutaAplicacion + "\\load\\", "*.*");
                    for (int i = 0; i < tRutatmp.Length; i++)
                    {
                        string tpathfile = tRutatmp[i];

                        if (File.Exists(tpathfile))
                            File.Delete(tpathfile);

                    }
                }
                //...................

                for (int p = 0; p < dstiendasload.Tables[0].Rows.Count; p++)
                {
                    string t_codtienda = dstiendasload.Tables[0].Rows[p]["codtienda"].ToString();
                    string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda + "\\";
                    string t_rutalocalload = globales.Grutadescarga + "\\" + t_codtienda + "\\load\\";

                    string t_rutalocalload_old = globales.Grutadescarga + "\\" + t_codtienda + "\\load\\old\\";
                    if (System.IO.Directory.Exists(t_rutalocalload_old) == false)
                    {
                        System.IO.Directory.CreateDirectory(t_rutalocalload_old);
                    }

                    for (int x = 0; x < globales.Gedsejecutartabladel.Tables[0].Rows.Count; x++)
                    {
                        string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["codtabla"].ToString();
                        string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtabla"].ToString();
                        //string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtablaxml"].ToString(); // compara valor tablaxml

                        //  codtienda.ToString() + "_" + arch.Replace(".", "") + "_" + t_nomtabla + extension 
                        if (Directory.GetFiles(t_rutalocalload, t_codtienda + "_*" + v_tabla + extension).Length > 0)
                        {
                            Rutatmp = Directory.GetFiles(t_rutalocalload, t_codtienda + "_*" + v_tabla + extension);
                            for (int i = 0; i < Rutatmp.Length; i++)
                            {
                                pathfile = Rutatmp[i];
                                filetemp = Path.GetFileName(Rutatmp[i]);//Nombre archivo                        
                                rutafile = Path.GetDirectoryName(Rutatmp[i]);// Ruta del Archivo.

                                string textoarchivo = File.ReadAllText(pathfile);//cada archivo tiene un enter: "\r\n"

                                if (!tablasList.ContainsKey(v_tabla))
                                {
                                    tablasList[v_tabla] = textoarchivo;
                                }
                                else {
                                    tablasList[v_tabla] += textoarchivo;
                                }                                
                                lista_archivos_input_leeidos.Add(pathfile);
                                lista_archivos_input_paraold.Add(rutafile + "\\old\\" + filetemp);

                            }
                        }

                    }

                    // Fin carga archivo tienda....
                    cllog.escribirLOG("loadarchivos(). Tienda: [" + t_codtienda + "]. Cargado." );
                    //..............  


                }

                //CREAR ARCHIVO CONCATENADO ............
                bool si_error_concat = false;
                for (int x = 0; x < globales.Gedsejecutartabladel.Tables[0].Rows.Count; x++)
                {
                    string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["codtabla"].ToString();
                    string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtabla"].ToString();
                    //string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[x]["nomtablaxml"].ToString(); // compara valor tablaxml

                     string t_rutaload = globales.GrutaAplicacion +  "\\load\\";
                    string t_archivo = "tmp_" + v_tabla + "_" + fechahoraload + extension;
                    
                     try
                     {
                         if (tablasList.ContainsKey(v_tabla)) {
                             //remplaza dos enter por archivo.
                             File.WriteAllText(t_rutaload + "\\" + t_archivo, tablasList[v_tabla]);
                             lista_tablas_out.Add(v_tabla);
                         }
                         
                     }
                     catch (Exception e)
                     {
                         si_error_concat = true;
                         cllog.escribirLOG("Error loadarchivos(). Error grabar archivo concatenado: [" + t_rutaload + "\\" + v_tabla + extension + "]." + e.Message);
                        // break;
                     }                     

                }

                //// Fin carga archivo general....
                //cllog.escribirLOG("loadarchivos(). Ruta CSV: [" + globales.GrutaAplicacion + "\\load\\" + "]. Archivos .csv creados.");
                ////.............. 

                //.....................


                // MOVER OLD ARCHIVOS LEIDOS....
                if (!si_error_concat)
                {
                    bool error_carga = false;
                    foreach (string tablaload in lista_tablas_out)
                    {
                        string file_origen = globales.GrutaAplicacion + "\\load\\" + "tmp_" + tablaload + "_" + fechahoraload + extension;
                        string file_destino = globales.GrutaAplicacion + "\\load\\" + tablaload + "_" + fechahoraload + extension;
                        string file_old_destino = globales.GrutaAplicacion + "\\load\\old\\" + tablaload + "_" + fechahoraload + extension;
                        //cllog.escribirLOG("ORIGEN:" + file_origen);
                        //cllog.escribirLOG("DESTINO:" + file_destino);
                       


                        //INSERTAR A BD.............
                        for (int p = 0; p < globales.Gedsejecutartabladel.Tables[0].Rows.Count; p++)
                        {
                            string v_codtabla = globales.Gedsejecutartabladel.Tables[0].Rows[p]["codtabla"].ToString();
                            string v_tabla = globales.Gedsejecutartabladel.Tables[0].Rows[p]["nomtabla"].ToString();
                            string v_tablaxml = globales.Gedsejecutartabladel.Tables[0].Rows[p]["nomtablaxml"].ToString(); // compara valor tablaxml

                            //Valida si existe la archivo(tabla) para cargar en la tabla.
                            if (v_tabla != tablaload)
                            {
                                //cllog.escribirLOG("loadarchivos()." + v_tabla);
                                continue;
                            }

                            DataRow[] rwcolumnas;
                            rwcolumnas = null;
                            rwcolumnas = globales.Gedsejecutartablaimport.Tables[0].Select("nomtablaxml='" + v_tablaxml + "'");

                            List<string> columnas = new List<string>();
                            columnas.Add("archivo_venpro");
                            columnas.Add("fecha_venpro");
                            columnas.Add("fechaprocesamiento_venpro");
                            columnas.Add("codtienda_venpro");
                            //"archivo_venpro" + delimiter + "fecha_venpro" + delimiter + "fechaprocesamiento_venpro" + delimiter + "codtienda_venpro"
                            for (int m = 0; m < rwcolumnas.Length; m++)
                            {
                                string col_nomcolumnaxml = rwcolumnas[m]["nomcolumnaxml"].ToString(); // se compara columnaxml

                                //if (col_nomcolumnaxml.ToUpper() != tmp_columna.ToUpper())
                                //{
                                //    continue;
                                //}

                                int col_posicion = col_posicion = Convert.ToInt32(rwcolumnas[m]["posicioncolum"].ToString());
                                string col_tipocolumna = rwcolumnas[m]["tipocolumna"].ToString();
                                string col_formato = rwcolumnas[m]["formato"].ToString();
                                string t_columnaFila = rwcolumnas[m]["nomcolumna"].ToString(); //nombre bd
                                columnas.Add(t_columnaFila);
                            }

                            string rs = "";
                           rs= cldatos.loadfile_Mysql(file_origen, v_tabla, columnas, delimiter);
                           if (rs != "1") {
                               error_carga = true;
                           }

                        }                      

                        //.........................

                        if (!error_carga)
                        {
                            if (File.Exists(file_destino))
                                File.Delete(file_destino);
                            File.Move(file_origen, file_destino);


                        }
                        

                    }

                    //.....................................
                    //MOVER A OLD SI NO HAY ERRORES...
                    if (!error_carga)
                    {
                        for (int y = 0; y < lista_archivos_input_leeidos.Count; y++)
                        {
                            if (File.Exists(lista_archivos_input_paraold[y]))
                                File.Delete(lista_archivos_input_paraold[y]);

                            if (File.Exists(lista_archivos_input_leeidos[y]))
                                File.Move(lista_archivos_input_leeidos[y], lista_archivos_input_paraold[y]);
                        }

                        foreach (string tablaload in lista_tablas_out)
                        {
                            string tfile_destino = globales.GrutaAplicacion + "\\load\\" + tablaload + "_" + fechahoraload + extension;
                            string tfile_old_destino = globales.GrutaAplicacion + "\\load\\old\\" + tablaload + "_" + fechahoraload + extension;

                            if (!Directory.Exists(globales.GrutaAplicacion + "\\load\\old\\"))
                            {
                                Directory.CreateDirectory(globales.GrutaAplicacion + "\\load\\old\\");
                            }
                            if (File.Exists(tfile_old_destino))
                                File.Delete(tfile_old_destino);
                            File.Move(tfile_destino, tfile_old_destino);

                        }

                    }

                    
                    
                }
                //...............................
                // Fin carga archivo general....
                cllog.escribirLOG("loadarchivos(). CSV PROCESADOS: [" + globales.GrutaAplicacion + "\\load\\old\\" + "]. Archivos .csv procesados");
                //.............. 
             

            }
            catch (Exception ex)
            {
                //result = false;
                //Escribiendo Log.......
                cllog.escribirLOG("Error loadarchivos(). [" + pathfile + "]. " + ex.ToString());
                //fin Log...............
                Modesribirmensajeform("Error loadarchivos(). [" + pathfile + "]. " + ex.Message);


            }
           

        }
        
        private void descargar_archivos(Object param)
        {

        //            private string descargar_archivos(string fecha_venpro,  string codtienda, string nomtienda, string servidor,
            //string rutalocal, string rutasvr, string usuario, string pass)
        //{

            List<String> param_obj = param as List<String>;

            string fecha_venpro = param_obj[0];
            string codtienda = param_obj[1];
            string nomtienda = param_obj[2];
            string servidor = param_obj[3];
            string rutalocal = param_obj[4];
            string rutasvr = param_obj[5];
            string usuario = param_obj[6];
            string pass = param_obj[7];

            //cllog.escribirLOG("fecha_venpro: " + fecha_venpro + " codtienda:" + codtienda + " nomtienda:" + nomtienda + " nomtienda:" + nomtienda
            //    + " servidor:" + servidor + " rutalocal:" + rutalocal + " rutasvr:" + rutasvr 
            //    + " usuario:" + usuario + " pass:" + pass
            //    );

            //string result = "1";
            //globales.Gedtiendas_ejecucion.Add(codtienda.ToString());
            string rutaservidor= servidor + "/"+ rutasvr;
            Int64 tmp_codtienda = Convert.ToInt64(codtienda);
            string rutaImport = rutalocal + "\\";            
            string[] Rutatmp;
            string filetemp = "";
            string rutafile = "";
            string pathfile = "";
            //string[] extensionpermitido = { ".xml", ".XML" };
            String[] extensionpermitido = globales.Grextensionpermitido.Split(';');
            
            //string[] archsvrpermitidos = { "TRPER"};
            String[] archsvrpermitidos = globales.Grarchivopermitido.Split(';');
            //int tmp_cantarchivoprocesado = 0;
            //int tmp_cantarchivoporprocesar = 0;
            

            List<String> listarchivoslocal = new List<String>();
            //List<String> lista = new List<String>();
            List<String> listarchivosvr = new List<String>();
            try{

                if (!Directory.Exists(rutalocal)) {
                    Directory.CreateDirectory(rutalocal);
                }

                if (!Directory.Exists(rutaImport))
                {
                    Directory.CreateDirectory(rutaImport);
                }


                if (!globales.Gsoloproceso)
                {
                   // cllog.escribirLOG("Inicia lista fecha_venpro: " + fecha_venpro + " codtienda:" + codtienda);
                    listarchivosvr = globales.GetFileList(rutaservidor, usuario, pass);
                   // cllog.escribirLOG("Finaliza lista fecha_venpro: " + fecha_venpro + " codtienda:" + codtienda);
                    //listalocal = (from item in lista where lista.Contains("") select item).ToList();
                    //cllog.escribirLOG("Encontrados:" +  listarchivosvr.Count.ToString() + " codtienda:" +codtienda );

                    //cllog.escribirLOG("ext: " + extensionpermitido[0] + " Archiv:" + archsvrpermitidos[0]);
                    if (listarchivosvr.Count == 0)
                    {
                        Modesribirmensajeform(globales.GetFileList_err);                        
                    }

                    if (listarchivosvr.Count > 0)
                    {
                        //VERIFICANDO CARPETA
                        if (Directory.GetFiles(rutaImport, "*.*", SearchOption.AllDirectories).Length > 0)
                        {
                            Rutatmp = Directory.GetFiles(rutaImport, "*.*", SearchOption.AllDirectories);

                            //MessageBox.Show(Rutatmp.Length.ToString());
                            //return result;
                            for (int i = 0; i < Rutatmp.Length; i++)
                            {
                                pathfile = Rutatmp[i];
                                filetemp = Path.GetFileName(Rutatmp[i]);//Nombre archivo                        
                                rutafile = Path.GetDirectoryName(Rutatmp[i]);// Ruta del Archivo.

                                //Validar Extensiones permitidas.......
                                bool existe_extensionpermitido = false;
                                for (int k = 0; k < extensionpermitido.Length; k++)
                                {

                                    if (extensionpermitido[k].ToUpper() == Path.GetExtension(pathfile).ToUpper())
                                    {
                                        existe_extensionpermitido = true;
                                        break;
                                    }
                                }
                                //cllog.escribirLOG("i:" + i.ToString() + " de Total de:" + Rutatmp.Length + " Extesionpemitido: " + existe_extensionpermitido.ToString() + " "+ filetemp + " .File:" + Path.GetExtension(pathfile));
                                if (!existe_extensionpermitido)
                                {
                                    continue;
                                }
                                //....................................


                                ////............
                                //if (!File.Exists(pathfile))
                                //{
                                //    //Escribiendo Log.......
                                //    cllog.escribirLOG("Observacion.descargar_archivos. No se encontro el archivo [Thread: " + Thread.CurrentThread.Name + "][tienda: " + codtienda + "][" + pathfile + " ]");
                                //    //fin Log...............
                                //    //continue;
                                //}
                                ////............
                                //cllog.escribirLOG("Descarga archivo: archivo: " + filetemp.ToUpper());

                                listarchivoslocal.Add(filetemp.ToUpper());

                            }

                        }


                        //cllog.escribirLOG("COD TIENDA:" + codtienda + "  Archivos SVR:" + listarchivosvr.Count.ToString() + " Archivos Local:" + listarchivoslocal.Count.ToString());
                        for (int i = 0; i < listarchivosvr.Count; i++)
                        {
                            //Validar Extensiones permitidas.......
                            bool existe_extensionpermitido = false;

                            if(listarchivosvr[i].LastIndexOf('.')==-1){
                                //Omitir carpeta y archivos sin extension.
                                continue;
                            }
                            

                            string extensionsvr = listarchivosvr[i].Substring(listarchivosvr[i].LastIndexOf('.')).ToUpper();
                            for (int m = 0; m < extensionpermitido.Length; m++)
                            {
                                
                                if (extensionpermitido[m].ToUpper() == extensionsvr)
                                {
                                    existe_extensionpermitido = true;
                                    break;
                                }
                            }
                            //cllog.escribirLOG("i:" + i.ToString() + " de Total de:" + listarchivosvr.Count + " Extesionpemitido: " + extensionpermitido[0] + " " + listarchivosvr[i] + " .File:" + extensionsvr);
                            if (!existe_extensionpermitido)
                            {
                                continue;
                            }
                            //....................................

                            //Validar Archivos permitidos.......
                            bool existe_archivosvrpermitido = false;
                            for (int k = 0; k < archsvrpermitidos.Length; k++)
                            {

                                if (listarchivosvr[i].LastIndexOf(archsvrpermitidos[k].ToUpper()) >= 0)
                                {
                                    existe_archivosvrpermitido = true;
                                    break;
                                }
                            }
                            //cllog.escribirLOG("i:" + i.ToString() + " de Total de:" + listarchivosvr.Count.ToString() +
                            //    " Archivopemitido: " + listarchivosvr[i].LastIndexOf(archsvrpermitidos[0]).ToString() + 
                            //    " " + listarchivosvr[i].ToString());
                            if (!existe_archivosvrpermitido)
                            {
                                continue;
                            }
                            //....................................
                            bool existe_archivolocal = false;
                            for (int j = 0; j < listarchivoslocal.Count; j++)
                            {
                                if (listarchivoslocal[j].ToUpper() == listarchivosvr[i].ToUpper())
                                {
                                    existe_archivolocal = true;
                                    break;
                                }
                            }

                            if (existe_archivolocal)
                            {
                                continue;
                            }

                            Application.DoEvents();
                            string tmp_archivolocal = listarchivosvr[i].ToString();

                            bool result_download = false;
                            result_download = globales.download(rutaservidor, usuario, pass,rutalocal, tmp_archivolocal, listarchivosvr[i]);

                            if (!result_download)
                            {
                                //result = "Error descargar_archivo(). No se pudo descargar el archivo[" + listarchivosvr[i] + "]" +
                                //    "[TIENDA: " + codtienda.ToString() + "-" + nomtienda + "]";

                                cllog.escribirLOG("Error descargar_archivo(). No se pudo descargar el archivo[" + listarchivosvr[i] + "]" +
                                    "[TIENDA: " + codtienda.ToString() + "-" + nomtienda + "]");

                                Modesribirmensajeform("Error descargar_archivo(). No se pudo descargar el archivo[" + listarchivosvr[i] + "]" +
                                    "[TIENDA: " + codtienda.ToString() + "-" + nomtienda + "]");
                            }
                            else
                            {
                                globales.Gcontdescargadossxml = globales.Gcontdescargadossxml + 1;
                                //if (Directory.GetFiles(rutaImport, "*.*").Length > 15)
                                //{
                                //    //Procesar Tiendas.........
                                //    bool tmp_existe_tienda_ejecucion = false;
                                //    for (int k = 0; k < globales.Gedejecutarthread_archivo.Length; k++)
                                //    {
                                //        if (globales.Gedejecutarthread_archivo[k].Name == codtienda)
                                //        {
                                //            //cllog.escribirLOG("pru." + codtienda + ". " + globales.Gedejecutarthread_archivo[k].IsAlive.ToString());
                                //            tmp_existe_tienda_ejecucion = globales.Gedejecutarthread_archivo[k].IsAlive;

                                //            if (!tmp_existe_tienda_ejecucion)
                                //            {
                                //                try
                                //                {


                                //                    //globales.Gedejecutarthread_archivo = new Thread[1];
                                //                    //globales.Gedejecutarthread_archivo[k] = new Thread(delegate()
                                //                    //{
                                //                    //    //import_archivo(t_cnmysql_bd, fecha_venpro, tmp_codtienda, rutalocal);
                                //                    //    import_archivo(fecha_venpro, tmp_codtienda, rutalocal);

                                //                    //});
                                //                    //---------------------------------
                                //                    List<String> parametro = new List<String>();
                                //                    parametro.Add(fecha_venpro);
                                //                    parametro.Add(tmp_codtienda.ToString());
                                //                    parametro.Add(rutalocal);

                                //                    globales.Gedejecutarthread_archivo[k] = new Thread(import_archivo);
                                //                    globales.Gedejecutarthread_archivo[k].Name = codtienda.ToString();
                                //                    globales.Gedejecutarthread_archivo[k].IsBackground = true;
                                //                    globales.Gedejecutarthread_archivo[k].Start(parametro);


                                //                }
                                //                catch (Exception ex)
                                //                {
                                //                    //Escribiendo Log.......
                                //                    cllog.escribirLOG("Error descargar_archivo.import_archivo().Thread.[" + codtienda + "]" + "[" + nomtienda + "] [" +
                                //                          "servidor: " + servidor + "\r\n" +
                                //                          "rutasvr: " + rutasvr + "\r\n" +
                                //                          "rutalocal: " + rutalocal + "\r\n" +
                                //                         ex.ToString());
                                //                    //fin Log...............
                                //                }
                                //            }

                                //            break;
                                //        }




                                //    }
                                //    //............................

                                //}


                            }
                        }



                    }

                }
                             
                //............................



            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error descargar_archivo(). [" + codtienda + "]" + "[" + nomtienda + "] [" +
                      "servidor: " + servidor + "\r\n" +
                      "rutasvr: " + rutasvr + "\r\n" +
                      "rutalocal: " + rutalocal + "\r\n" +
                     ex.ToString());
                //fin Log...............

                //result = "Error descargar_archivo(). [" + codtienda + "]" + "[" + nomtienda + "] [" +
                //      "servidor: " + servidor + "\r\n" +
                //      "rutasvr: " + rutasvr + "\r\n" +
                //      "rutalocal: " + rutalocal + "\r\n" +
                //     ex.ToString();

            }

            
            

           // return result;
        }

        private void abortar_thread_tienda() {

            try
            {
                for (int i = 0; i < globales.Gedejecutarthread_tienda.Length; i++)
                {
                    globales.Gedejecutarthread_tienda[i].Abort();
                    //string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();

                    //if (globales.Gedejecutarthread_tienda[i].Name == t_codtienda)
                    //{
                    //    //Modesribirmensajeform("Ok." + t_codtienda.ToString());
                    //    cllog.escribirLOG("pru." + t_codtienda + ". " + globales.Gedejecutarthread_tienda[0].IsAlive.ToString());
                    //    if (globales.Gedejecutarthread_tienda[0].IsAlive)
                    //    {

                    //    }
                    //}
                }
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error abortar_thread_tienda(). " + ex.ToString());
                //fin Log...............
            }

        }

        private void abortar_thread_procesararchivo()
        {
            try
            {

                for (int i = 0; i < globales.Gedejecutarthread_archivo.Length; i++)
                {
                    globales.Gedejecutarthread_archivo[i].Abort();
                    //string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();

                    //if (globales.Gedejecutarthread_tienda[i].Name == t_codtienda)
                    //{
                    //    //Modesribirmensajeform("Ok." + t_codtienda.ToString());
                    //    cllog.escribirLOG("pru." + t_codtienda + ". " + globales.Gedejecutarthread_tienda[0].IsAlive.ToString());
                    //    if (globales.Gedejecutarthread_tienda[0].IsAlive)
                    //    {

                    //    }
                    //}
                }

            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error abortar_thread_procesararchivo(). " + ex.ToString());
                //fin Log...............
            }

        }

        private void Timer1_Tick(object sender, EventArgs e)
        {
            this.toolhora.Text = "[ " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ]";

            try
            {

                DataSet dstiendas = globales.Gedsejecutatiendas;
                //globales.Gedejecutarthread_tienda = new Thread[dstiendas.Tables[0].Rows.Count];
                string tmp_fecha_venpro = globales.Grtimeserv.ToString("yyyy-MM-dd");
                Modesribirmensajeform("clear");

                for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
                {
                    string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                    string t_nomtienda = dstiendas.Tables[0].Rows[i]["nomtienda"].ToString();
                    string t_servidor = dstiendas.Tables[0].Rows[i]["servidor"].ToString();
                    string t_ruta = globales.formatdata(dstiendas.Tables[0].Rows[i]["ruta"].ToString());
                    string t_usuario = dstiendas.Tables[0].Rows[i]["usuario"].ToString();
                    string t_password = dstiendas.Tables[0].Rows[i]["password"].ToString();
                    string t_estado = dstiendas.Tables[0].Rows[i]["estado"].ToString();

                    string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda;
                    //string t_rutalsvr= t_servidor + "\\"+ t_ruta;

                    ////Descargar Tiendas.........
                    //bool existe_tienda_ejecucion = false;
                    //for (int m = 0; m < globales.Gedtiendas_ejecucion.Count; m++)
                    //{
                    //    //cllog.escribirLOG("Gedimport_ejecucion: m" + m.ToString() + ":" + globales.Gedimport_ejecucion[m]);
                    //    if (globales.Gedtiendas_ejecucion[m] == t_codtienda.ToString())
                    //    {
                    //        existe_tienda_ejecucion = true;
                    //        break;
                    //    }
                    //}
                    ////--------

                    bool existe_tienda_ejecucion = false;
                    for (int k = 0; k < globales.Gedejecutarthread_tienda.Length; k++)
                    {
                        if (globales.Gedejecutarthread_tienda[k].Name == t_codtienda)
                        {
                            //cllog.escribirLOG("pru.descarga" + t_codtienda + ". " + globales.Gedejecutarthread_tienda[k].IsAlive.ToString());
                            existe_tienda_ejecucion = globales.Gedejecutarthread_tienda[k].IsAlive;                             
                            break;
                        }
                    }

                    if (!existe_tienda_ejecucion)
                    {

                        //---------------------------------
                        List<String> parametro = new List<String>();
                        parametro.Add(tmp_fecha_venpro);
                        parametro.Add(t_codtienda);
                        parametro.Add(t_nomtienda);
                        parametro.Add(t_servidor);
                        parametro.Add(t_rutalocal);
                        parametro.Add(t_ruta);
                        parametro.Add(t_usuario);
                        parametro.Add(t_password); 


                        //globales.Gedejecutarthread_tienda[i] = new Thread(delegate()
                        //{
                        //    descargar_archivos(tmp_fecha_venpro,t_codtienda, t_nomtienda, t_servidor, t_rutalocal, t_ruta, t_usuario, t_password);
                        //});
                        globales.Gedejecutarthread_tienda[i] = new Thread(descargar_archivos);
                        globales.Gedejecutarthread_tienda[i].Name = t_codtienda.ToString();
                        globales.Gedejecutarthread_tienda[i].IsBackground = true;
                        globales.Gedejecutarthread_tienda[i].Start(parametro);

                    }
                    //............................


                    


                }


                //PROCESAR-------------------

                Thread.Sleep(15000);

                for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
                {
                    string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                    string t_nomtienda = dstiendas.Tables[0].Rows[i]["nomtienda"].ToString();
                    string t_servidor = dstiendas.Tables[0].Rows[i]["servidor"].ToString();
                    string t_ruta = globales.formatdata(dstiendas.Tables[0].Rows[i]["ruta"].ToString());
                    string t_usuario = dstiendas.Tables[0].Rows[i]["usuario"].ToString();
                    string t_password = dstiendas.Tables[0].Rows[i]["password"].ToString();
                    string t_estado = dstiendas.Tables[0].Rows[i]["estado"].ToString();

                    string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda;
                    string t_fechahoraload = DateTime.Now.ToString("yyyyMMddHHmmss");
                    ////Procesar Tiendas.........
                    //bool existe_archivo_ejecucion = false;
                    //for (int m = 0; m < globales.Gedarchivo_ejecucion.Count; m++)
                    //{
                    //    //cllog.escribirLOG("Gedimport_ejecucion: m" + m.ToString() + ":" + globales.Gedimport_ejecucion[m]);
                    //    if (globales.Gedarchivo_ejecucion[m] == t_rutalocal.ToString())
                    //    {
                    //        existe_archivo_ejecucion = true;
                    //        break;
                    //    }
                    //}
                    ////--------

                    //Procesar Tiendas.........
                    bool existe_archivo_ejecucion = false;
                    for (int k = 0; k < globales.Gedejecutarthread_archivo.Length; k++)
                    {
                        if (globales.Gedejecutarthread_archivo[k].Name == t_codtienda)
                        {
                            cllog.escribirLOG("pru." + t_codtienda + ". " + globales.Gedejecutarthread_archivo[k].IsAlive.ToString());
                            existe_archivo_ejecucion = globales.Gedejecutarthread_archivo[k].IsAlive;
                            break;
                        }
                    }
                    //............................

                    if (!existe_archivo_ejecucion)
                    {
                       
                        //---------------------------------
                        List<String> parametro = new List<String>();
                        parametro.Add(tmp_fecha_venpro);
                        parametro.Add(t_codtienda);
                        parametro.Add(t_rutalocal);
                        parametro.Add(t_fechahoraload);

                        //globales.Gedejecutarthread_archivo[i] = new Thread(import_archivo);
                        //globales.Gedejecutarthread_archivo[i].Name = t_codtienda.ToString();
                        //globales.Gedejecutarthread_archivo[i].IsBackground = true;
                        //globales.Gedejecutarthread_archivo[i].Start(parametro);

                        if (globales.Gedejecutarthread_concatload != null)
                        {
                            //cllog.escribirLOG("LOADGENERAL." + globales.Gedejecutarthread_concatload.IsAlive.ToString());
                            if (!globales.Gedejecutarthread_concatload.IsAlive)
                            {
                                globales.Gedejecutarthread_archivo[i] = new Thread(import_archivo);
                                globales.Gedejecutarthread_archivo[i].Name = t_codtienda.ToString();
                                globales.Gedejecutarthread_archivo[i].IsBackground = true;
                                globales.Gedejecutarthread_archivo[i].Start(parametro);
                            }
                        }
                        else
                        {
                            globales.Gedejecutarthread_archivo[i] = new Thread(import_archivo);
                            globales.Gedejecutarthread_archivo[i].Name = t_codtienda.ToString();
                            globales.Gedejecutarthread_archivo[i].IsBackground = true;
                            globales.Gedejecutarthread_archivo[i].Start(parametro);
                        }

                    }
                    //............................
                }
                

                //CONCAT LOAD........
                if (globales.Gedejecutarthread_concatload != null)
                {
                    cllog.escribirLOG("LOADGENERAL."  + globales.Gedejecutarthread_concatload.IsAlive.ToString());
                    if (!globales.Gedejecutarthread_concatload.IsAlive)
                    {
                        globales.Gedejecutarthread_concatload = new Thread(loadarchivos);
                        globales.Gedejecutarthread_concatload.Name = "load";
                        globales.Gedejecutarthread_concatload.IsBackground = true;
                        globales.Gedejecutarthread_concatload.Start();
                    }
                }
                else {
                    globales.Gedejecutarthread_concatload = new Thread(loadarchivos);
                    globales.Gedejecutarthread_concatload.Name = "load";
                    globales.Gedejecutarthread_concatload.IsBackground = true;
                    globales.Gedejecutarthread_concatload.Start();
                }
                //....................


                



            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error Timer.DescargaTienda_procesa(). " + ex.ToString());
                //fin Log...............


            }


            //----------------------

           

        }

        private string trataarchivo() {
           globales.Gedtrataarchivo_activo = true;
            string result = "1";

            try
            {
                System.Threading.Thread.Sleep(10000);
                DataSet dstiendas = globales.Gedsejecutatiendas;

                if (globales.Grtrataarchivo.ToLower() == "eliminar")
                {

                    for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
                    {
                        string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                        string t_nomtienda = dstiendas.Tables[0].Rows[i]["nomtienda"].ToString();
                        string t_servidor = dstiendas.Tables[0].Rows[i]["servidor"].ToString();
                        string t_ruta = globales.formatdata(dstiendas.Tables[0].Rows[i]["ruta"].ToString());
                        string t_usuario = dstiendas.Tables[0].Rows[i]["usuario"].ToString();
                        string t_password = dstiendas.Tables[0].Rows[i]["password"].ToString();
                        string t_estado = dstiendas.Tables[0].Rows[i]["estado"].ToString();

                        string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda + "\\old";
                        string t_rutalocal_load = globales.Grutadescarga + "\\" + t_codtienda + "\\load\\old";
                        if (!Directory.Exists(t_rutalocal))
                        {
                            continue;
                        }

                        

                        //Delete OLD....
                        if (Directory.GetFiles(t_rutalocal, "*.*").Length > 0)
                        {
                            string[] Rutatmp;
                            string filetemp = "";
                            string rutafile = "";
                            string pathfile = "";
                            Rutatmp = Directory.GetFiles(t_rutalocal, "*.*");

                            for (int k = 0; k < Rutatmp.Length; k++)
                            {
                                pathfile = Rutatmp[k];
                                filetemp = Path.GetFileName(Rutatmp[k]);//Nombre archivo                        
                                rutafile = Path.GetDirectoryName(Rutatmp[k]);// Ruta del Archivo.

                                try {
                                    File.Delete(pathfile);
                                }
                                catch (Exception ex) {
                                    //Escribiendo Log.......
                                    cllog.escribirLOG("Error trataarchivo(). Error al eliminar XML. " + ex.ToString());
                                    //fin Log...............
                                }
                                
                            }
                        }
                        cllog.escribirLOG("trataarchivo(). XML Eliminado Terminado. [" + t_rutalocal + "]");

                        //........................

                        if (!Directory.Exists(t_rutalocal_load))
                        {
                            continue;
                        }
                        //Delete LOAD/OLD .csv....
                        if (Directory.GetFiles(t_rutalocal_load, "*.*").Length > 0)
                        {
                            string[] Rutatmp;
                            string filetemp = "";
                            string rutafile = "";
                            string pathfile = "";
                            Rutatmp = Directory.GetFiles(t_rutalocal_load, "*.*");

                            for (int k = 0; k < Rutatmp.Length; k++)
                            {
                                pathfile = Rutatmp[k];
                                filetemp = Path.GetFileName(Rutatmp[k]);//Nombre archivo                        
                                rutafile = Path.GetDirectoryName(Rutatmp[k]);// Ruta del Archivo.

                                try
                                {
                                    File.Delete(pathfile);
                                }
                                catch (Exception ex)
                                {
                                    //Escribiendo Log.......
                                    cllog.escribirLOG("Error trataarchivo(). Error al eliminar csv de tienda. " + ex.ToString());
                                    //fin Log...............
                                }

                            }
                        }
                        cllog.escribirLOG("trataarchivo(). CSV Eliminado Terminado.[" + t_rutalocal_load + "]");



                    }


                }
                else
                {
                    string fechabackup = DateTime.Now.AddDays(-1).ToString("yyyyMMdd");

                    for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
                    {
                        string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                        string t_nomtienda = dstiendas.Tables[0].Rows[i]["nomtienda"].ToString();
                        string t_servidor = dstiendas.Tables[0].Rows[i]["servidor"].ToString();
                        string t_ruta = globales.formatdata(dstiendas.Tables[0].Rows[i]["ruta"].ToString());
                        string t_usuario = dstiendas.Tables[0].Rows[i]["usuario"].ToString();
                        string t_password = dstiendas.Tables[0].Rows[i]["password"].ToString();
                        string t_estado = dstiendas.Tables[0].Rows[i]["estado"].ToString();

                        string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda + "\\old";
                        string t_rutalocal_load = globales.Grutadescarga + "\\" + t_codtienda + "\\load\\old";
                        string t_rutabackup = globales.GrutaAplicacion + "\\backup\\" + t_codtienda + "\\" + fechabackup ;

                        if (!Directory.Exists(t_rutalocal))
                        {
                            continue;
                        }

                        //Backup----
                        if (!Directory.Exists(t_rutabackup + "\\XML\\"))
                        {
                            Directory.CreateDirectory(t_rutabackup + "\\XML\\");
                        }
                        //--

                        //Backup----
                        if (!Directory.Exists(t_rutabackup + "\\LOAD\\"))
                        {
                            Directory.CreateDirectory(t_rutabackup + "\\LOAD\\");
                        }
                        //--

                        

                        if (Directory.GetFiles(t_rutalocal, "*.*").Length > 0)
                        {
                            string[] Rutatmp;
                            string filetemp = "";
                            string rutafile = "";
                            string pathfile = "";

                            Rutatmp = Directory.GetFiles(t_rutalocal, "*.*");

                            for (int k = 0; k < Rutatmp.Length; k++)
                            {
                                pathfile = Rutatmp[k];
                                filetemp = Path.GetFileName(Rutatmp[k]);//Nombre archivo                        
                                rutafile = Path.GetDirectoryName(Rutatmp[k]);// Ruta del Archivo.

                                //Mover a la rutabackup----
                                if (File.Exists(t_rutabackup + "\\XML\\" + filetemp))
                                {
                                    File.Delete(t_rutabackup + "\\XML\\" + filetemp);
                                }
                                File.Move(pathfile, t_rutabackup + "\\XML\\" + filetemp);
                                //------------

                            }
                        }

                        //Delete LOAD/OLD .csv....
                        if (Directory.GetFiles(t_rutalocal_load, "*.*").Length > 0)
                        {
                            string[] Rutatmp;
                            string filetemp = "";
                            string rutafile = "";
                            string pathfile = "";
                            Rutatmp = Directory.GetFiles(t_rutalocal_load, "*.*");

                            for (int k = 0; k < Rutatmp.Length; k++)
                            {
                                pathfile = Rutatmp[k];
                                filetemp = Path.GetFileName(Rutatmp[k]);//Nombre archivo                        
                                rutafile = Path.GetDirectoryName(Rutatmp[k]);// Ruta del Archivo.

                                try
                                {
                                    File.Delete(pathfile);
                                }
                                catch (Exception ex)
                                {
                                    //Escribiendo Log.......
                                    cllog.escribirLOG("Error trataarchivo(). Error al eliminar csv de tienda. " + ex.ToString());
                                    //fin Log...............
                                }

                            }
                        }
                        cllog.escribirLOG("trataarchivo(). CSV Eliminado Terminado BACKUPS .[" + t_rutalocal_load + "]");


                    }

                }



                //Delete GENERAL LOAD/OLD .csv....
                if (Directory.GetFiles(globales.GrutaAplicacion + "\\load\\old", "*.*").Length > 0)
                {
                    string[] Rutatmp;
                    string filetemp = "";
                    string rutafile = "";
                    string pathfile = "";
                    Rutatmp = Directory.GetFiles(globales.GrutaAplicacion + "\\load\\old", "*.*");

                    for (int k = 0; k < Rutatmp.Length; k++)
                    {
                        pathfile = Rutatmp[k];
                        filetemp = Path.GetFileName(Rutatmp[k]);//Nombre archivo                        
                        rutafile = Path.GetDirectoryName(Rutatmp[k]);// Ruta del Archivo.

                        try
                        {
                            File.Delete(pathfile);
                        }
                        catch (Exception ex)
                        {
                            //Escribiendo Log.......
                            cllog.escribirLOG("Error trataarchivo(). Error al eliminar csv general. " + ex.ToString());
                            //fin Log...............
                        }

                    }
                }
                cllog.escribirLOG("trataarchivo(). CSV GENERAL Eliminado Terminado.[" + globales.GrutaAplicacion + "\\load\\old" + "]");


                cllog.escribirLOG("trataarchivo(). [" + globales.Grtrataarchivo.ToLower()  + "]. Terminado");
            }
            catch (Exception ex)
            {
                result = "Error trataarchivo(). " + ex.ToString();
                //Escribiendo Log.......
                cllog.escribirLOG("Error trataarchivo(). " + ex.ToString());
                //fin Log...............


            }

            if (result != "1") {
                Modesribirmensajeform(result);
            }
            
            globales.Gedtrataarchivo_activo = false;

            return result;
        }
        
        private void btndescargar_Click(object sender, EventArgs e)
        {
             DataSet dstiendas = globales.Gedsejecutatiendas;
            //globales.Gedejecutarthread_tienda = new Thread[dstiendas.Tables[0].Rows.Count];

            try
            {
                string tmp_fecha_venpro = globales.Grtimeserv.ToString("yyyy-MM-dd");
                Modesribirmensajeform("clear");
                try
                {
                    Moditemchart(globales.Gcontprocesadosxml, globales.Gcontdescargadossxml);
                }
                catch { }

                for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
                {
                    string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                    string t_nomtienda = dstiendas.Tables[0].Rows[i]["nomtienda"].ToString();
                    string t_servidor = dstiendas.Tables[0].Rows[i]["servidor"].ToString();
                    string t_ruta = globales.formatdata(dstiendas.Tables[0].Rows[i]["ruta"].ToString());
                    string t_usuario = dstiendas.Tables[0].Rows[i]["usuario"].ToString();
                    string t_password = dstiendas.Tables[0].Rows[i]["password"].ToString();
                    string t_estado = dstiendas.Tables[0].Rows[i]["estado"].ToString();

                    string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda;
                    //string t_rutalsvr= t_servidor + "\\"+ t_ruta;

                    ////Descargar Tiendas.........
                    //bool existe_tienda_ejecucion = false;
                    //for (int m = 0; m < globales.Gedtiendas_ejecucion.Count; m++)
                    //{
                    //    //cllog.escribirLOG("Gedimport_ejecucion: m" + m.ToString() + ":" + globales.Gedimport_ejecucion[m]);
                    //    if (globales.Gedtiendas_ejecucion[m] == t_codtienda.ToString())
                    //    {
                    //        existe_tienda_ejecucion = true;
                    //        break;
                    //    }
                    //}
                    ////--------

                    bool existe_tienda_ejecucion = false;
                    for (int k = 0; k < globales.Gedejecutarthread_tienda.Length; k++)
                    {                        
                        if (globales.Gedejecutarthread_tienda[k].Name == t_codtienda)
                        {
                            cllog.escribirLOG("Descarga?." + t_codtienda + ". " + globales.Gedejecutarthread_tienda[k].IsAlive.ToString());
                            existe_tienda_ejecucion = globales.Gedejecutarthread_tienda[k].IsAlive;
                            break;
                        }
                    }

                    if (!existe_tienda_ejecucion)
                    {
                        //---------------------------------
                        List<String> parametro = new List<String>();
                        parametro.Add(tmp_fecha_venpro);
                        parametro.Add(t_codtienda);
                        parametro.Add(t_nomtienda);
                        parametro.Add(t_servidor);
                        parametro.Add(t_rutalocal);
                        parametro.Add(t_ruta);
                        parametro.Add(t_usuario);
                        parametro.Add(t_password);


                        //globales.Gedejecutarthread_tienda[i] = new Thread(delegate()
                        //{
                        //    descargar_archivos(tmp_fecha_venpro, t_codtienda, t_nomtienda, t_servidor, t_rutalocal, t_ruta, t_usuario, t_password);
                        //});
                        globales.Gedejecutarthread_tienda[i] = new Thread(descargar_archivos);
                        globales.Gedejecutarthread_tienda[i].Name = t_codtienda.ToString();
                        globales.Gedejecutarthread_tienda[i].IsBackground = true;
                        globales.Gedejecutarthread_tienda[i].Start(parametro);
                        cllog.escribirLOG("Ejecuta:" + t_codtienda + ". " + globales.Gedejecutarthread_tienda[i].Name.ToString());
                        //globales.Gedejecutarthread_tienda[i].Join();
                        //Modesribirmensajeform("Ok." + t_codtienda.ToString());

                    }
                    //............................

                }
            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error btndescargar_Click(). " + ex.ToString());
                //fin Log...............


            }
        }

        private void btnprocesar_Click(object sender, EventArgs e)
        {
             //DataSet dstiendas = globales.Gedsejecutatiendas;           

             //   for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
             //   {
             //       string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();

             //       if (globales.Gedejecutarthread_tienda[i].Name == t_codtienda)
             //       {
             //           //Modesribirmensajeform("Ok." + t_codtienda.ToString());
             //           cllog.escribirLOG("pru." + t_codtienda + ". " + globales.Gedejecutarthread_tienda[0].IsAlive.ToString());
             //           if (globales.Gedejecutarthread_tienda[0].IsAlive)
             //           {

             //           }
             //       }
             //   }

             //   return;

             DataSet dstiendas = globales.Gedsejecutatiendas;
             //globales.Gedejecutarthread_archivo = new Thread[dstiendas.Tables[0].Rows.Count];
             string tmp_fecha_venpro = globales.Grtimeserv.ToString("yyyy-MM-dd");
             Modesribirmensajeform("clear");
             try
             {


                 try
                 {
                     Moditemchart(globales.Gcontprocesadosxml, globales.Gcontdescargadossxml);
                 }
                 catch { }

                 for (int i = 0; i < dstiendas.Tables[0].Rows.Count; i++)
                 {
                     string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                     string t_nomtienda = dstiendas.Tables[0].Rows[i]["nomtienda"].ToString();
                     string t_servidor = dstiendas.Tables[0].Rows[i]["servidor"].ToString();
                     string t_ruta = globales.formatdata(dstiendas.Tables[0].Rows[i]["ruta"].ToString());
                     string t_usuario = dstiendas.Tables[0].Rows[i]["usuario"].ToString();
                     string t_password = dstiendas.Tables[0].Rows[i]["password"].ToString();
                     string t_estado = dstiendas.Tables[0].Rows[i]["estado"].ToString();

                     string t_rutalocal = globales.Grutadescarga + "\\" + t_codtienda;
                     string t_fechahoraload = DateTime.Now.ToString("yyyyMMddHHmmss");

                     ////Procesar Tiendas.........
                     //bool existe_archivo_ejecucion = false;
                     //for (int m = 0; m < globales.Gedarchivo_ejecucion.Count; m++)
                     //{
                     //    //cllog.escribirLOG("Gedimport_ejecucion: m" + m.ToString() + ":" + globales.Gedimport_ejecucion[m]);
                     //    if (globales.Gedarchivo_ejecucion[m] == t_rutalocal.ToString())
                     //    {
                     //        existe_archivo_ejecucion = true;
                     //        break;
                     //    }
                     //}
                     ////--------

                     //Procesar Tiendas.........
                     bool existe_archivo_ejecucion = false;
                     for (int k = 0; k < globales.Gedejecutarthread_archivo.Length; k++)
                     {
                         if (globales.Gedejecutarthread_archivo[k].Name == t_codtienda)
                         {
                             cllog.escribirLOG("pru." + t_codtienda + ". " + globales.Gedejecutarthread_archivo[k].IsAlive.ToString());
                             existe_archivo_ejecucion = globales.Gedejecutarthread_archivo[k].IsAlive;
                             break;
                         }
                     }
                     //............................

                     if (!existe_archivo_ejecucion)
                     {

                         //---------------------------------
                         List<String> parametro = new List<String>();
                         parametro.Add(tmp_fecha_venpro);
                         parametro.Add(t_codtienda);
                         parametro.Add(t_rutalocal);
                         parametro.Add(t_fechahoraload);

                         globales.Gedejecutarthread_archivo[i] = new Thread(import_archivo);
                         globales.Gedejecutarthread_archivo[i].Name = t_codtienda.ToString();
                         globales.Gedejecutarthread_archivo[i].IsBackground = true;
                         globales.Gedejecutarthread_archivo[i].Start(parametro);

                     }
                     //............................
                 }

                 //CONCAT LOAD........
                 if (globales.Gedejecutarthread_concatload != null)
                 {
                     cllog.escribirLOG("LOADGENERAL." + globales.Gedejecutarthread_concatload.IsAlive.ToString());
                     if (!globales.Gedejecutarthread_concatload.IsAlive)
                     {
                         globales.Gedejecutarthread_concatload = new Thread(loadarchivos);
                         globales.Gedejecutarthread_concatload.Name = "load";
                         globales.Gedejecutarthread_concatload.IsBackground = true;
                         globales.Gedejecutarthread_concatload.Start();
                     }
                 }
                 else
                 {
                     globales.Gedejecutarthread_concatload = new Thread(loadarchivos);
                     globales.Gedejecutarthread_concatload.Name = "load";
                     globales.Gedejecutarthread_concatload.IsBackground = true;
                     globales.Gedejecutarthread_concatload.Start();
                 }
                 //....................

             }
             catch (Exception ex)
             {
                 //Escribiendo Log.......
                 cllog.escribirLOG("Error btnprocesar_Click(). " + ex.ToString());
                 //fin Log...............
             }

        }

        private void btndescargamanual_Click(object sender, EventArgs e)
        {

            try
            {
                frmconsultartiendas frm = new frmconsultartiendas();
                frm.rs = false;
                frm.btndescargar.Visible = true;

                frm.btnAgregar.Visible = false;
                frm.btnCambiarEstado.Visible = false;
                frm.btnModificar.Visible = false;
                frm.toolStripLabel2.Visible = false;
                frm.toolStripLabel3.Visible = false;
                frm.ShowDialog();

                if (frm.rs)
                {
                    DataTable tmp_listatiendas = new DataTable();
                    tmp_listatiendas = frm.g_lista;
                    string tmp_fecha_venpro = globales.Grtimeserv.ToString("yyyy-MM-dd");
                    Modesribirmensajeform("clear");

                    if (tmp_listatiendas.Rows.Count > 0)
                    {
                        try
                        {
                            Moditemchart(globales.Gcontprocesadosxml, globales.Gcontdescargadossxml);
                        }
                        catch { }

                        //Thread[] Gedejecutarthread_tienda_tmp;
                        //Gedejecutarthread_tienda_tmp = new Thread[tmp_listatiendas.Rows.Count];

                        for (int i = 0; i < tmp_listatiendas.Rows.Count; i++)
                        {
                            Int64 t_codigo = Convert.ToInt64(tmp_listatiendas.Rows[i][0].ToString());
                            string t_nombre = tmp_listatiendas.Rows[i][1].ToString();
                            string t_servidor = tmp_listatiendas.Rows[i][2].ToString();
                            string t_ruta = globales.formatdata(tmp_listatiendas.Rows[i][3].ToString());
                            string t_usuario = tmp_listatiendas.Rows[i][4].ToString();
                            string t_password = tmp_listatiendas.Rows[i][5].ToString();
                            //Boolean t_estado = Convert.ToBoolean(Convert.ToInt32(tmp_listatiendas.Rows[i][6]));

                            string t_rutalocal = globales.Grutadescarga + "\\" + t_codigo.ToString();
                            //string t_rutalsvr= t_servidor + "\\"+ t_ruta;

                            ////Descargar Tiendas.........
                            //bool existe_tienda_ejecucion = false;
                            //for (int m = 0; m < globales.Gedtiendas_ejecucion.Count; m++)
                            //{

                            //    //cllog.escribirLOG("Gedimport_ejecucion: m" + m.ToString() + ":" + globales.Gedimport_ejecucion[m]);
                            //    if (globales.Gedtiendas_ejecucion[m] == t_codigo.ToString())
                            //    {
                            //        existe_tienda_ejecucion = true;
                            //        break;
                            //    }
                            //}
                            ////--------

                            bool existe_tienda_ejecucion = false;
                            for (int k = 0; k < globales.Gedejecutarthread_tienda.Length; k++)
                            {
                                if (globales.Gedejecutarthread_tienda[k].Name == t_codigo.ToString())
                                {
                                    //cllog.escribirLOG("manual." + t_codigo.ToString() + ". " + globales.Gedejecutarthread_tienda[k].IsAlive.ToString());
                                    existe_tienda_ejecucion = globales.Gedejecutarthread_tienda[k].IsAlive;
                                    break;
                                }
                            }

                            if (!existe_tienda_ejecucion)
                            {
                                //cllog.escribirLOG("OK..................." + t_codigo.ToString() + ". ");
                                    

                                //globales.Gedejecutarthread_tienda[i] = new Thread(delegate()
                                //{
                                //    descargar_archivos(tmp_fecha_venpro, t_codigo.ToString(), t_nombre, t_servidor, t_rutalocal, t_ruta, t_usuario, t_password);
                                //});

                                //---------------------------------
                                List<String> parametro = new List<String>();
                                parametro.Add(tmp_fecha_venpro);
                                parametro.Add(t_codigo.ToString());
                                parametro.Add(t_nombre);
                                parametro.Add(t_servidor);
                                parametro.Add(t_rutalocal);
                                parametro.Add(t_ruta);
                                parametro.Add(t_usuario);
                                parametro.Add(t_password);

                                globales.Gedejecutarthread_tienda[i] = new Thread(descargar_archivos);
                                globales.Gedejecutarthread_tienda[i].Name = t_codigo.ToString();
                                globales.Gedejecutarthread_tienda[i].IsBackground = true;
                                globales.Gedejecutarthread_tienda[i].Start(parametro);

                            }
                            //............................


                        }
                    }


                }


            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error btndescargamanual_Click(). " + ex.ToString());
                //fin Log...............
            }

        }

        private void tiendasToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmconsultartiendas frm = new frmconsultartiendas();
            frm.ShowDialog();

        }

        private void tablasToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmconsultartabla frm = new frmconsultartabla();
            frm.ShowDialog();
        }

        private void columnasToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmconsultarcolumnasimport frm = new frmconsultarcolumnasimport();
            frm.ShowDialog();
        }

        private void tiendasActivasToolStripMenuItem1_Click(object sender, EventArgs e)
        {
           // globales.Gedsejecutatiendas = cldatos.cargar_tienda_mysql(cnmysql_venpro);

            switch (globales.Gcxconexiontipovenpro)
            {
                case "SQL":
                    globales.Gedsejecutatiendas = cldatos_sql.cargar_tienda_sql(cnsql_venpro);
                    break;

                case "Mysql":
                    globales.Gedsejecutatiendas = cldatos.cargar_tienda_mysql(cnmysql_venpro);
                    break;
            }

            if (globales.Gedsejecutatiendas.Tables[0].Rows.Count > 0)
            {
                abortar_thread_tienda();
                //Actualizar tiendas thread para descargas_archivos().....
                DataSet dstiendas = globales.Gedsejecutatiendas;
                globales.Gedejecutarthread_tienda = new Thread[dstiendas.Tables[0].Rows.Count];


                if (dstiendas.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < globales.Gedejecutarthread_tienda.Length; i++)
                    {
                        string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                        globales.Gedejecutarthread_tienda[i] = new Thread(delegate()
                        {
                            Boolean tmp_bool = true;
                        });
                        globales.Gedejecutarthread_tienda[i].Name = t_codtienda;
                    }

                    //procesar archivos...
                    for (int i = 0; i < globales.Gedejecutarthread_archivo.Length; i++)
                    {
                        string t_codtienda = dstiendas.Tables[0].Rows[i]["codtienda"].ToString();
                        globales.Gedejecutarthread_archivo[i] = new Thread(delegate()
                        {
                            Boolean tmp_bool = true;
                        });
                        globales.Gedejecutarthread_archivo[i].Name = t_codtienda;
                    }
                    //.......

                }
                
                //...............

                MessageBox.Show("Se cargaron las Tiendas activas. Con un total de " +
                    globales.Gedsejecutatiendas.Tables[0].Rows.Count.ToString() + " Tiendas.");
            }
            else
            {
                MessageBox.Show("No existen Tiendas Activas, Validar por favor.");
            }

        }

        private void tablasActivasToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            //Cargar cargar tablas...  
            switch (globales.Gcxconexiontipovenpro)
            {
                case "SQL":
                    globales.Gedsejecutartabladel = cldatos_sql.cargar_tabla_colum_delete_sql(cnsql_venpro);
                    globales.Gedsejecutartablaimport = cldatos_sql.cargar_tablaxml_import_sql(cnsql_venpro);
                    break;

                case "Mysql":
                    globales.Gedsejecutartabladel = cldatos.cargar_tabla_colum_delete_mysql(cnmysql_venpro);
                    globales.Gedsejecutartablaimport = cldatos.cargar_tablaxml_import_mysql(cnmysql_venpro);
                    break;
            }     
           

            if (globales.Gedsejecutartabladel.Tables[0].Rows.Count > 0 &&
                globales.Gedsejecutartablaimport.Tables[0].Rows.Count > 0)
            {
                MessageBox.Show("Se cargaron " + globales.Gedsejecutartabladel.Tables[0].Rows.Count.ToString() + "  tablas activas.");
            }
            else
            {
                MessageBox.Show("No existen Tablas Activas, Validar por favor.");
            }

        }

        private void tooltimeractivo_DoubleClick(object sender, EventArgs e)
        {
            //MessageBox.Show("Doble click");
            if (Timer1.Enabled)
            {
                this.tooltimeractivo.Image = VENPRO.Properties.Resources.desac;
                Timer1.Enabled = false;
                this.toolhora.Text = "";
            }
            else
            {
                this.tooltimeractivo.Image = VENPRO.Properties.Resources.act;
                Timer1.Enabled = true;
            }

        }

        private void timer2_Tick(object sender, EventArgs e)
        {

            try
            {

                try
                {
                    Moditemchart(globales.Gcontprocesadosxml, globales.Gcontdescargadossxml);
                    globales.Gcontprocesadosxml = 0;
                    globales.Gcontdescargadossxml = 0;
                }
                catch { }


                if (globales.Gractreproceso)
                {
                    globales.Grtimeserv = globales.Grfechareproceso;
                    globales.Grutadescarga = globales.Grutareproceso;
                    this.Text = "MODO REPROCESO ARCHIVOS";
                }
                else {
                    globales.Grtimeserv = DateTime.Now.AddDays(globales.Grdiaserv).AddHours(globales.Grhoraserv).AddMinutes(globales.Grminserv);

                }

                this.lblhoraserv.Text = "[ " + globales.Grtimeserv.ToString("yyyy-MM-dd HH:mm:ss") + " ]";
                //--------

                if (globales.Grperiodominalerta > 0)
                {
                    if (globales.Gmensajeperiodicoerr != "")
                    {
                        int tmp_min = Convert.ToInt32(DateTime.Now.ToString("mm"));

                        for (int k = 0; k <= 60; k += globales.Grperiodominalerta)
                        {
                            //cllog.escribirLOG("compara minutoperiodo: k." + k + " periodoalerta." + globales.Grperiodominalerta);
                            if (k == tmp_min)
                            {
                                string tmp_contenidoMail = globales.Gccontenido + "<BR>" + "." + "<BR>Mensaje:<BR>" + globales.Gmensajeperiodicoerr
                                        + "<BR><BR><BR>" + "Por favor no responder este mensaje, puesto que es originado de forma automatica."
                                        + "<BR>" + "Atte. SoporteVENPRO";
                                globales.NewMail(globales.GcNomMostrar, globales.GcDe, globales.GcTo, globales.GcCC, globales.GcCCO,
                                 globales.Gcasunto, tmp_contenidoMail, globales.GcAdjunto);
                                globales.Gmensajeperiodicoerr = "";
                            }
                        }
                    }

                }

                //MessageBox.Show(globales.Grhoratrata.ToString("HH:mm") + " Horaactual:" + DateTime.Now.ToString("HH:mm"));
                if (globales.Grhoratrata.ToString("HH:mm") == DateTime.Now.ToString("HH:mm"))
                {
                    //MessageBox.Show(globales.Grhoratrata.ToString("HH:mm") + " Horaactual:" + DateTime.Now.ToString("HH:mm"));
                    if (globales.Gedtrataarchivo_activo == false)
                    {
                        this.lblulttrataarchivo.Text = "[ " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ]";

                        Thread ejecutarthread;
                        ejecutarthread = new Thread(delegate()
                        {
                            trataarchivo();
                        });
                        //ejecutarthread.Name = t_codtienda.ToString();
                        ejecutarthread.Start();
                    }
                }
                //.........
                                

                //ALERTA TAG NO REGISTRADOS-------------

                if (globales.Grhoraalertadiariatag.ToString("HH:mm") == DateTime.Now.ToString("HH:mm"))
                {
                    if (globales.Gralertabusqtag)
                    {
                       
                            DataSet ds= new DataSet(); 
                        
                            switch (globales.Gcxconexiontipovenpro)
                            {
                                case "SQL":
                                    ds = cldatos_sql.cargar_validacionxml_sql(cnsql_venpro);
                                    break;

                                case "Mysql":
                                    ds = cldatos.cargar_validacionxml_mysql(cnmysql_venpro);
                                    break;
                            }

                            string tmp_mensaje = "<BR>";
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                                {
                                    tmp_mensaje = tmp_mensaje + "<BR>" + ds.Tables[0].Rows[i]["fecharegistro"].ToString() + "\t" +
                                                    ds.Tables[0].Rows[i]["ruta"].ToString() + "\t" +
                                                    ds.Tables[0].Rows[i]["tag1"].ToString() + "\t" +
                                                    ds.Tables[0].Rows[i]["tag2"].ToString() + "\t" +
                                                    ds.Tables[0].Rows[i]["tag3"].ToString() + "\t" +
                                                    ds.Tables[0].Rows[i]["tag4"].ToString();
                                }


                                string tmp_contenidoMail = globales.Gccontenido + "<BR>" + " VALIDACION DE TAG XML. No existe las siguientes tablas en la BD." + "<BR>Mensaje:<BR>" + tmp_mensaje
                                        + "<BR><BR><BR>" + "Por favor no responder este mensaje, puesto que es originado de forma automatica."
                                        + "<BR>" + "Atte. SoporteVENPRO";
                                globales.NewMail(globales.GcNomMostrar, globales.GcDe, globales.GcTo, globales.GcCC, globales.GcCCO,
                                 globales.Gcasunto, tmp_contenidoMail, globales.GcAdjunto);

                            }
                        
                    }
                    
                }
                //--------------------------------------

            }
            catch (Exception ex)
            {
                //Escribiendo Log.......
                cllog.escribirLOG("Error Timer2.trataarchivo(). " + ex.ToString());
                //fin Log...............


            }


            //----------------------

        }

        private void elimBackArchToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Esta Seguro de " + globales.Grtrataarchivo.ToLower() + "Archivos?", "Pregunta", MessageBoxButtons.YesNo) == DialogResult.Yes)
            {
                if (globales.Gedtrataarchivo_activo == false)
                {
                    this.lblulttrataarchivo.Text = "[ " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ]";

                    Thread ejecutarthread;
                    ejecutarthread = new Thread(delegate()
                    {
                        trataarchivo();
                    });
                    //ejecutarthread.Name = t_codtienda.ToString();
                    ejecutarthread.IsBackground=true;
                    ejecutarthread.Start();
                }
                else {
                    MessageBox.Show("El proceso aun se esta ejecutando...");
                }

                //if (tmp_trataarchivo == "1") {
                //    MessageBox.Show("Se concluyo con satisfactoriamente!!!.");
                //}
            }

        }

        private void reprocesoDatosToolStripMenuItem_Click(object sender, EventArgs e)
        {

            MessageBox.Show("Se desactivara el temporizador, Debera activarlo manualmente o Reiniciar la aplicacion.");
            this.tooltimeractivo.Image = VENPRO.Properties.Resources.desac;
            Timer1.Enabled = false;
            this.toolhora.Text = "";

            frmreproceso frm = new frmreproceso();
            frm.ShowDialog();
            if (frm.rs) {
                leerconfig();
            }

            //DataSet dsdel = globales.Gedsejecutartabladel;
            //for (int i = 0; i < dsdel.Tables[0].Rows.Count; i++)
            //{
            //    string v_codtabla = dsdel.Tables[0].Rows[i]["codtabla"].ToString();
            //    string v_tabla = dsdel.Tables[0].Rows[i]["nomtabla"].ToString();
            //    string v_columfecha = dsdel.Tables[0].Rows[i]["nomcolum1"].ToString();
            //    //string v_columtienda = dsdel.Tables[0].Rows[i]["nomcolum2"].ToString();

            //    string tmp_delete_tabla = "";
            //    tmp_delete_tabla = cldatos.delete_archivoimport_mysql(cnmysql_bd, v_tabla, v_columfecha, "2014-07-17",
            //         "",0);
            //    if (tmp_delete_tabla != "1")
            //    {
            //        //result = tmp_delete_tabla;
            //        Modesribirmensajeform(tmp_delete_tabla);
            //        cllog.escribirLOG(tmp_delete_tabla);

            //    }
            //}


        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {

                //Escribiendo Log.......
                globales.escribirLOG("VENPRO Cerrado.");
                //fin Log...............
            }
            catch (Exception ex)
            {
                try
                {
                    ////Escribiendo Log.......
                    globales.escribirLOG("Error aplicacion Close. " + ex.Message);
                    ////fin Log...............
                }
                catch { }

            }
            
        }








    }
}
