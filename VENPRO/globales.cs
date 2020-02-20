using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Data;

namespace VENPRO
{
    class globales
    {

        //config.............
        public static string GrutaAplicacion;
        public static string Grutaconfig;

        public static string Grutadescarga;
        public static string Grtrataarchivo;
        public static DateTime Grhoratrata= Convert.ToDateTime("00:40:00");

        public static DateTime Grtimeserv = DateTime.Now;
        public static int Grdiaserv = 0;
        public static int Grhoraserv = 0;
        public static int Grminserv = 0;
        public static Boolean Gractbusqtag = false;
        public static Boolean Gralertabusqtag = false;
        public static DateTime Grhoraalertadiariatag= Convert.ToDateTime("00:50:00");
        public static int Grperiodominalerta = 0;//si es 0 esta desactivo.
        public static string Grarchivopermitido = "TRPER";
        public static string Grextensionpermitido = ".xml;XML";
        public static Boolean Gsolodescarga = false;
        public static Boolean Gsoloproceso = false;

        public static Boolean Gractreproceso = false;
        public static DateTime Grfechareproceso = Convert.ToDateTime(DateTime.Now.AddDays(-1).ToString("yyyy-MM-dd"));
        public static string Grutareproceso;
        public static int Gcantarchivoprocesaporminuto = 1;

        public static string Gmensajeperiodicoerr = "";
        public static DataTable gdtatable = new DataTable();
        public static DataTable gdtatabledescarga = new DataTable();
        public static int Gcontprocesadosxml = 0;
        public static int Gcontdescargadossxml = 0;
        

        //CORREO....
        public static string GcCorreo = "CORREO";
        public static Boolean GcActivarAlerta = false;
        public static string Gcservidor;
        public static Boolean GcEnableSsl = false;
        public static int Gcpuerto;
        public static Boolean GcEstCredencial = false;
        public static string GcUsuario;
        public static string Gcpass;
        public static string GcNomMostrar;
        public static string GcDe;
        public static string GcTo;
        public static string GcCC;
        public static string GcCCO;
        public static string Gcasunto;
        public static string Gccontenido;
        public static string GcAdjunto;

        //..........

        //Tiempo...
        public static decimal GtiempoMin = 4;
        public static decimal Greintento = 3;
        //.......

        //conexion......
        public static string Gconexion = "conexion";
        public static string Gcxconexionstring;
        public static string Gcxconexiontipo = "Mysql";
        //...........

        //conexion_VENPRO......
        public static string Gconexionvenpro = "conexionvenpro";
        public static string Gcxconexionstringvenpro;
        public static string Gcxconexiontipovenpro = "Mysql";
        //...........


        //Evento_VENPRO......
        public static DataSet Gedsejecutartabladel = new DataSet();
        public static DataSet Gedsejecutartablaimport = new DataSet();
        public static DataSet Gedsejecutatiendas = new DataSet();

        public static Thread[] Gedejecutarthread_tienda;
        public static List<string> Gedtiendas_ejecucion = new List<string>();

        public static Thread[] Gedejecutarthread_archivo;
        public static List<string> Gedarchivo_ejecucion = new List<string>();

        public static Thread Gedejecutarthread_concatload;

        public static Boolean Gedtrataarchivo_activo = false;
        //......



        public static void escribirLOG(string texto)
        {
            string fic = System.Environment.CurrentDirectory + "\\LOG\\venpro_" + DateTime.Now.ToString("yyyyMMdd") + ".log";

            try
            {
                string strDir;
                //Crear directorio de configuracion.............
                strDir = System.Environment.CurrentDirectory + "\\LOG\\";
                if (System.IO.Directory.Exists(strDir) == false)
                {
                    System.IO.Directory.CreateDirectory(strDir);
                }

                if (System.IO.File.Exists(fic) == true)
                {
                    System.IO.StreamWriter sw = new StreamWriter(fic, true);
                    sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd H:m:s") + " : " + texto);
                    sw.Close();
                }
                else
                {
                    System.IO.StreamWriter sw = new StreamWriter(fic, true);
                    sw.WriteLine("   LOG VENPRO " + DateTime.Now.ToString("yyyy-MM-dd"));
                    sw.WriteLine("_________________________________________________________");
                    sw.WriteLine("---------------------------------------------------------");
                    sw.WriteLine("");
                    sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd H:m:s") + " : " + texto);
                    sw.Close();
                }

            }
            catch { }

        }

        public static bool CrearconfigXML()
        {
            bool rs = false;
            try
            {
                XmlDocument arbol;
                arbol = new XmlDocument();
                //Version XML acepte ñ...
                XmlDeclaration decl = arbol.CreateXmlDeclaration("1.0", "ISO-8859-1", null);
                arbol.AppendChild(decl);
                //Instrucciones.....
                //XmlProcessingInstruction pi = arbol.CreateProcessingInstruction("MyCustomNameHere", "attribute1=\"val1\" attribute2=\"val2\"");
                //arbol.AppendChild(pi);
                //Autor.....
                XmlComment coment = arbol.CreateComment("  By M@rcelo :::: ***Marcelo H*** ::: VENPRO :::  ");
                 coment = arbol.CreateComment("  trataarchivo:eliminar/backup  ::(Se elimina Archivo)/(Se backup Archivos)");
                arbol.AppendChild(coment);
                //--------------------------------
                XmlNode jerarquia;
                XmlNode nodo;
                XmlAttribute Atributo;


                jerarquia = arbol.CreateElement("objeto");
                arbol.AppendChild(jerarquia);

                //jerarquia.AppendChild(nodo);

                //Nuevo Nodo///////////////////////////
                nodo = arbol.CreateElement("CORREO");

                //Atributos.....

                Atributo = arbol.CreateAttribute("ActivarAlerta");
                Atributo.InnerText = "false";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("servidor");
                Atributo.InnerText = "svr0200.falabella.com";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("EnableSsl");
                Atributo.InnerText = "false";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("puerto");
                Atributo.InnerText = "25";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("EstCredencial");
                Atributo.InnerText = "false";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("Usuario");
                Atributo.InnerText = "";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("pass");
                Atributo.InnerText = "";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("NomMostrar");
                Atributo.InnerText = "ALERTA RPE TOTTUS";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("De");
                Atributo.InnerText = "soporterpe@tottus.com.pe";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("To");
                Atributo.InnerText = "mherediag@tottus.com.pe";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("CC");
                Atributo.InnerText = "";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("CCO");
                Atributo.InnerText = "";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("asunto");
                Atributo.InnerText = "ALERTA Error al procesar.";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("contenido");
                Atributo.InnerText = "ALERTA!. Procesamiento";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("Adjunto");
                Atributo.InnerText = "";
                nodo.Attributes.Append(Atributo);


                //Asignando Nuevo nodo...........                  
                jerarquia.AppendChild(nodo);

                //............

                //Nuevo Nodo///////////////////////////
                nodo = arbol.CreateElement("tiempo");

                //Atributos.....

                Atributo = arbol.CreateAttribute("tiempoMin");
                Atributo.InnerText = "60";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("numreintento");
                Atributo.InnerText = "3";
                nodo.Attributes.Append(Atributo);


                //Asignando Nuevo nodo...........                  
                jerarquia.AppendChild(nodo);

                //Nuevo Nodo///////////////////////////
                nodo = arbol.CreateElement("conexion");

                //Atributos.....

                Atributo = arbol.CreateAttribute("conexionstring");
                //Atributo.InnerText = "Data Source=SERVIDOR;Initial Catalog=BD;User ID=usuario; Password=pass;";
                Atributo.InnerText = "Server=localhost;Database=BD;User id=usuario;Password=pass;Allow User Variables=True;persist security info=true;default command timeout=60000;";

                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("conexiontipo");
                Atributo.InnerText = "Mysql";
                nodo.Attributes.Append(Atributo);


                //Asignando Nuevo nodo...........                  
                jerarquia.AppendChild(nodo);


                //Nuevo Nodo///////////////////////////
                nodo = arbol.CreateElement("conexionvenpro");

                //Atributos.....

                Atributo = arbol.CreateAttribute("conexionstringvenpro");
                //Atributo.InnerText = "Data Source=SERVIDOR;Initial Catalog=BD;User ID=usuario; Password=pass;";
                Atributo.InnerText = "Server=localhost;Database=VENPRO;User id=usuario;Password=pass;Allow User Variables=True;persist security info=true;default command timeout=60000;default command timeout=30000;";

                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("conexiontipovenpro");
                Atributo.InnerText = "Mysql";
                nodo.Attributes.Append(Atributo);


                //Asignando Nuevo nodo...........                  
                jerarquia.AppendChild(nodo);

                //Nuevo Nodo///////////////////////////
                nodo = arbol.CreateElement("configuracion");

                //Atributos.....

                Atributo = arbol.CreateAttribute("rutadescarga");
                Atributo.InnerText = "D:\\VENPRO\\Import\\";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("trataarchivo");
                Atributo.InnerText = "eliminar";//Eliminar/backup
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("horatrata");
                Atributo.InnerText = "00:40:00";//En formato 24H
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("diaserv");
                Atributo.InnerText = "0";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("horaserv");
                Atributo.InnerText = "0";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("minutoserv");
                Atributo.InnerText = "0";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("activarbusquedatag");
                Atributo.InnerText = "true";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("alertabusquedatag");
                Atributo.InnerText = "true";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("horaalertadiariatag");
                Atributo.InnerText = "00:50:00";//En formato 24H
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("periodominalerta");
                Atributo.InnerText = "3"; //Si es "0" no envia alerta.
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("archivopermitido");
                Atributo.InnerText = "TRPER"; 
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("extensionpermitido");
                Atributo.InnerText = ".xml;.XML"; 
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("solodescarga");
                Atributo.InnerText = "false";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("soloproceso");
                Atributo.InnerText = "false";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("cantidadarchivoprocesaparalelo");
                Atributo.InnerText = "1";
                nodo.Attributes.Append(Atributo);

                //Asignando Nuevo nodo...........                  
                jerarquia.AppendChild(nodo);
                //............

                //Nuevo Nodo///////////////////////////
                nodo = arbol.CreateElement("reproceso");

                //Atributos.....

                Atributo = arbol.CreateAttribute("activarreproceso");
                Atributo.InnerText = "false";

                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("fechareproceso");
                Atributo.InnerText = "2014-12-27";
                nodo.Attributes.Append(Atributo);

                Atributo = arbol.CreateAttribute("rutareproceso");
                Atributo.InnerText = "D:\\VENPRO\\reproceso\\";
                nodo.Attributes.Append(Atributo);


                //Asignando Nuevo nodo...........                  
                jerarquia.AppendChild(nodo);

                arbol.Save(globales.Grutaconfig + "config.xml");
                rs = true;
            }
            catch (System.Exception ex)
            {
                rs = false;
                //Escribiendo Log.......
                globales.escribirLOG("Error CrearconfigXML(). " + ex.ToString());
                //fin Log...............

            }
            return rs;
        }

        public static void esribirmensajeform(string mensaje)
        {
            string result = "";

            try
            {
                result = Form1.f1.txtmensaje.Text;
                result = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " : " + mensaje + "\r\n" + result;

                Form1.f1.txtmensaje.Text = result;
                //Form1.f1.txtmensaje.Focus();
                Form1.f1.txtmensaje.ScrollToCaret();

            }
            catch (System.Exception ex)
            {
                globales.escribirLOG("Error esribirmensajeform(). " + ex.ToString());
            }

        }

        public static int StatusFTP(string rutaserver, string user, string pass)
        {

            try
            {

            FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create("ftp://" + rutaserver + "/");

            request.Method = WebRequestMethods.Ftp.ListDirectory;

            request.Credentials = new NetworkCredential(user, pass);

            //request.UsePassive = true;

            //request.UseBinary = true;

            //request.KeepAlive = true;
            //Elimino el proxy.....
            request.Proxy = null;

            FtpWebResponse response = (FtpWebResponse)request.GetResponse();
            //StreamReader reqStreamreader = request.GetRequestStream();
            StreamReader responseReader = new StreamReader(response.GetResponseStream());
            responseReader.ReadLine();
            response.Close();

            return 1;

            }

            catch(Exception ex)
            {
                globales.escribirLOG("Error . " + ex.Message);
                return 0;

            }

        }

        public static bool download(string rutaserver, string user, string pass, string rutalocal, string archivolocal, string nombrearchivoserv)
        {
            bool rs = false;

            FtpWebRequest ftpRequest = null;
            FtpWebResponse ftpResponse = null;

            Stream stream = null;
            StreamReader reader = null;
            StreamWriter writer = null;
            string file_origen = rutalocal + "\\" + "tmp_" + archivolocal;
            string file_destino = rutalocal + "\\" + archivolocal;
            try
            {


                ftpRequest = (FtpWebRequest)WebRequest.Create("ftp://" + rutaserver + "/" + nombrearchivoserv);
                ftpRequest.Credentials = new NetworkCredential(user, pass);
                //Elimino el proxy.....
                ftpRequest.Proxy = null;
                ftpRequest.Method = WebRequestMethods.Ftp.DownloadFile;
                ftpRequest.UseBinary = true;
                ftpRequest.UsePassive = true;
                ftpRequest.KeepAlive = false;

                ftpRequest.Timeout = 90000;
                ftpRequest.ReadWriteTimeout = 90000;
                ftpRequest.ServicePoint.MaxIdleTime = 1;
                ftpRequest.ServicePoint.ConnectionLimit = 90000;
                ftpRequest.ServicePoint.ConnectionLeaseTimeout = 90000;

                ftpResponse = (FtpWebResponse)ftpRequest.GetResponse();
                
                try
                {
                    stream = ftpResponse.GetResponseStream();
                    reader = new StreamReader(stream, Encoding.UTF8);
                    writer = new StreamWriter(file_origen, false);
                    writer.Write(reader.ReadToEnd());

                    rs = true;

                }
                catch (Exception ex)
                {

                    rs = false;
                    //Escribiendo Log.......
                    globales.escribirLOG("Error download().Error Write. " + ex.Message);
                    //fin Log...............

                }
                finally
                {
                    stream.Close();
                    reader.Close();
                    writer.Close();
                }

                if (rs)
                {
                    if (File.Exists(file_destino))
                        File.Delete(file_destino);
                    File.Move(file_origen, file_destino);
                }
                else
                {
                    //Si hay error al descargar eliminar temporal.
                    if (File.Exists(file_origen))
                        File.Delete(file_origen);
                }

            }
            catch (Exception ex)
            {
                rs = false;
                //Escribiendo Log.......
                globales.escribirLOG("Error download(). " + ex.Message);
                //fin Log...............

                if (ftpRequest != null) {
                    ftpRequest.Abort();
                }

                if (ftpResponse != null)
                {
                    ftpResponse.Close();
                }

                if (stream != null)
                {
                    stream.Close();
                }

                if (reader != null)
                {
                    reader.Close();
                }

                if (writer != null)
                {
                    writer.Close();
                }

               
            }

            return rs;


        }

        public static String GetFileList_err = "";
        public static List<String> GetFileList(string rutaserver, string user, string pass)
        {
            //string[] downloadFiles;
            GetFileList_err = "";
            List<String> resultlista = new List<String>();

            StringBuilder result = new StringBuilder();
            FtpWebRequest reqFTP= null;
            WebResponse response = null;
            StreamReader reader = null;
            try
            {

                reqFTP = (FtpWebRequest)FtpWebRequest.Create(new Uri("ftp://" + rutaserver + "/"));
                
                //Elimino el proxy.....
                reqFTP.Proxy = null;                
                reqFTP.Credentials = new NetworkCredential(user, pass);
                reqFTP.Method = WebRequestMethods.Ftp.ListDirectory;

                reqFTP.UseBinary = true;
                reqFTP.UsePassive = true;
                reqFTP.KeepAlive = false;
                reqFTP.Timeout = 10000;
                reqFTP.ReadWriteTimeout = 10000;
                reqFTP.ServicePoint.MaxIdleTime = 1; 
                reqFTP.ServicePoint.ConnectionLimit = 10000;
                reqFTP.ServicePoint.ConnectionLeaseTimeout = 10000;
                

                 response = reqFTP.GetResponse();
                 reader = new StreamReader(response.GetResponseStream());
                //MessageBox.Show(reader.ReadToEnd());
                string line = reader.ReadLine();
                while (line != null)
                {
                    result.Append(line);
                    result.Append("\n");
                    line = reader.ReadLine();
                }
                result.Remove(result.ToString().LastIndexOf('\n'), 1);
                reader.Close();
                response.Close();
                //MessageBox.Show(response.StatusDescription);
                resultlista= new List<string>(result.ToString().Split('\n'));
                return resultlista;
            }
            catch (Exception ex)
            {
                if (reqFTP != null) {
                    reqFTP.Abort();
                }
                if (reader != null) {
                    reader.Dispose();
                }
                if (response != null) {
                    response.Close();
                }  

                

                //Escribiendo Log.......
                globales.escribirLOG("Error GetFileList(). No se pudo listar archivos - " + "ftp://" + rutaserver + ". " + ex.ToString());
                GetFileList_err = "Error GetFileList(). " + "ftp://" + rutaserver + ". " + ex.Message;
                //fin Log..............
                //try
                //{
                //    reader.Close();
                //    response.Close();
                //}
                //catch
                //{
                //    //Escribiendo Log.......
                //    globales.escribirLOG("Error GetFileList(). No pudo cerrar la conexion. " + ex.ToString());
                //    //fin Log..............
                //}

                //downloadFiles = null;
                return resultlista;
            }
        }

        public static string convertformatodecimal(Char formatodecimalcultura, string valorentrada)
        {

            string valorsalida = "";
            //Reemplazar.. (.) x (,)

            if (formatodecimalcultura == ',')
            {
                if (valorentrada.Trim().IndexOf('.') > -1)
                {
                    string TempitemxMinDecimal = valorentrada.Replace('.', ',');
                    valorsalida = TempitemxMinDecimal;
                }
                else
                {
                    valorsalida = valorentrada;
                }

            }
            else
            {

                if (formatodecimalcultura == '.')
                {
                    if (valorentrada.Trim().IndexOf(',') > -1)
                    {
                        string TempitemxMinDecimal = valorentrada.Replace(',', '.');
                        valorsalida = TempitemxMinDecimal;
                    }
                    else
                    {
                        valorsalida = valorentrada;
                    }


                }

            }

            return valorsalida;



        }

        public static bool grabarreprocesoXML(string objeto, bool activar, string fechareproceso, string rutareproceso)
        {
            bool rs = false;
            try
            {
                XmlDocument arbol;
                arbol = new XmlDocument();
                arbol.Load(globales.Grutaconfig + "config.xml");

                XmlNodeList nodolist;

                //Modificando///////////////////////////
                nodolist = arbol.SelectNodes("/objeto");

                foreach (XmlNode nodo in nodolist)
                {
                    for (int i = 0; i <= nodo.ChildNodes.Count - 1; i++)
                    {
                        if (nodo.ChildNodes[i].Name == objeto)
                        {
                            nodo.ChildNodes[i].Attributes[0].InnerText = activar.ToString();
                            nodo.ChildNodes[i].Attributes[1].InnerText = fechareproceso.ToString();
                            nodo.ChildNodes[i].Attributes[2].InnerText = rutareproceso.ToString();

                        }
                    }

                }


                arbol.Save(globales.Grutaconfig + "config.xml");
                rs = true;
            }
            catch (System.Exception ex)
            {

                rs = false;
                //Escribiendo Log.......
                globales.escribirLOG("Error aplicacion Cambiar Estado. " + ex.Message);
                //fin Log...............

            }
            return rs;

        }
        
        public static string NewMail(string NombreMostrar, string De, string To, string CC, string CCO, string Asunto, string Body, string adjuntos)
        {
            string result = "1";

            try
            {



                MailMessage mailmsg = new MailMessage();

                //Para....
                String[] direcciones_To = To.Split(';');
                foreach (string dire in direcciones_To)
                {
                    if (!string.IsNullOrEmpty(dire))
                    {
                        mailmsg.To.Add(dire);
                    }
                }
                //.......
                //CC....
                String[] direcciones_CC = CC.Split(';');
                foreach (string dire in direcciones_CC)
                {
                    if (!string.IsNullOrEmpty(dire))
                    {
                        mailmsg.CC.Add(dire);
                    }

                }
                //.......
                //CCO....
                String[] direcciones_CCO = CCO.Split(';');
                foreach (string dire in direcciones_CCO)
                {
                    if (!string.IsNullOrEmpty(dire))
                    {
                        mailmsg.Bcc.Add(dire);
                    }
                }
                //.......


                mailmsg.From = new MailAddress(De, NombreMostrar);
                mailmsg.Subject = Asunto;
                mailmsg.Body = Body;
                mailmsg.BodyEncoding = System.Text.Encoding.UTF8;
                mailmsg.Priority = MailPriority.Normal;
                mailmsg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mailmsg.IsBodyHtml = true;

                //Adjuntar Archivo.......
                String[] adjunto_temp = adjuntos.Split(';');
                if (adjunto_temp != null)
                {
                    foreach (string archivo_adjuntos in adjunto_temp)
                    {
                        if (!string.IsNullOrEmpty(archivo_adjuntos))
                        {
                            mailmsg.Attachments.Add(new System.Net.Mail.Attachment(archivo_adjuntos));
                        }
                    }
                }
                //....................

                //SmtpClient smtpMail = new SmtpClient("smtp.gmail.com", 587);
                //smtpMail.EnableSsl = true;
                //NetworkCredential myCreds = new NetworkCredential("user@gmail.com", "password", "");
                //smtpMail.Credentials = myCreds;

                //SmtpClient smtpMail = new SmtpClient("127.0.0.1", 26);
                //smtpMail.EnableSsl = true;
                //NetworkCredential myCreds = new NetworkCredential("user@gmail.com", "password", "");
                //smtpMail.Credentials = myCreds;

                SmtpClient smtpMail = new SmtpClient();
                smtpMail.Host = globales.Gcservidor;
                smtpMail.Port = globales.Gcpuerto;
                smtpMail.EnableSsl = globales.GcEnableSsl;
                if (globales.GcEstCredencial == true)
                {
                    smtpMail.Credentials = new System.Net.NetworkCredential(globales.GcUsuario, globales.Gcpass);
                }

                try
                {
                    smtpMail.Send(mailmsg);

                    mailmsg.Dispose();
                    mailmsg = null;
                    smtpMail.Dispose();
                    smtpMail = null;
                }
                catch (System.Exception ex)
                {
                    result = "Error Enviar Email. " + ex.Message;
                    globales.escribirLOG("Error Enviar Email. " + ex.ToString());

                    try
                    {
                        mailmsg.Dispose();
                        mailmsg = null;
                        smtpMail.Dispose();
                        smtpMail = null;
                    }
                    catch (System.Exception exx)
                    {
                        globales.escribirLOG("Error NewMail(). No se pudo liberar correctamente el objeto smtpMail y mailmsg. " + exx.ToString());
                    }

                }


            }
            catch (System.Exception ex)
            {
                result = "Error NewMail. " + ex.Message;
                globales.escribirLOG("Error NewMail. " + ex.ToString());
            }

            return result;

        }


        //Crear carpeta o archivo...
        public static string formatdata(string datoformato)
        {
            string rs = "";
            string[] dato;
            //Fecha:   |f=-3=yyy-MM-dd|
            //Texto:   |t=valor texto ingresado|
            //semana:   |s=-1|
            //Mes comercial:   |mc=-5|
           
            
            //RPE.cllog log = new RPE.cllog();
            //RPE.clconexion clconexion = new RPE.clconexion();
            //RPE.clregistro clregistro = new RPE.clregistro();

            //SqlConnection cnsql = new SqlConnection();
            //MySqlConnection cnmysql = new MySqlConnection();


            //if (globales.Gcxconexiontipo == "SQL")
            //{
            //    //............                        
            //    cnsql = new SqlConnection(clconexion.conexion);
            //    if (cnsql.State != ConnectionState.Open)
            //        cnsql.Open();
            //    //...........

            //}
            //else
            //{
            //    if (globales.Gcxconexiontipo == "Mysql")
            //    {
            //        //............                        
            //        cnmysql = new MySqlConnection(clconexion.conexion);
            //        if (cnmysql.State != ConnectionState.Open)
            //            cnmysql.Open();
            //        //...........

            //    }
            //}
            ////...........

            if (datoformato.IndexOf('|') != -1)
            {
                dato = datoformato.Split('|');
                DateTime fechahoy = new DateTime();
                fechahoy = Grtimeserv;

                for (int i = 0; i < dato.Length; i++)
                {

                    if (dato[i].Contains("f=") == true || dato[i].Contains("t=") == true || dato[i].Contains("s=") == true || dato[i].Contains("mc=") == true)
                    {
                        if (dato[i].Substring(0, 1) == "f")
                        {
                            string[] fechtmp;
                            fechtmp = dato[i].Split('=');
                            string formatofecha = fechtmp[2];
                            int dias = Convert.ToInt32(fechtmp[1]);
                            rs = rs + fechahoy.AddDays(dias).ToString(formatofecha);
                        }
                        else
                        {
                            if (dato[i].Substring(0, 1) == "t")
                            {
                                string[] textotmp;
                                textotmp = dato[i].Split('=');
                                rs = rs + textotmp[1];
                            }
                            else
                            {

                                if (dato[i].Substring(0, 1) == "s")
                                {
                                    //string[] semanatmp;
                                    //semanatmp = dato[i].Split('=');
                                    //int dias = Convert.ToInt32(semanatmp[1]);
                                    //string fechabd = fechahoy.AddDays(dias).ToString("yyyy-MM-dd");
                                    //DataSet ds = new DataSet();
                                    //ds = clregistro.cargarfecha_mysql(cnmysql, fechabd);

                                    //rs = rs + ds.Tables[0].Rows[0]["numsemana"];

                                }
                                else
                                {

                                    if (dato[i].Substring(0, 2) == "mc")
                                    {
                                        //string[] mesctmp;
                                        //mesctmp = dato[i].Split('=');
                                        //int dias = Convert.ToInt32(mesctmp[1]);
                                        //string fechabd = fechahoy.AddDays(dias).ToString("yyyy-MM-dd");
                                        //DataSet ds = new DataSet();
                                        //ds = clregistro.cargarfecha_mysql(cnmysql, fechabd);

                                        //rs = rs + ds.Tables[0].Rows[0]["nummes"];
                                    }
                                    else
                                    {

                                    }
                                }
                            }
                        }

                    }
                    else
                    {
                        //Si no encuentra se muestra el mismo valor.
                        //rs = dato[i];
                    }
                }

            }


            return rs;
        }




    }
}
