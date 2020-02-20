using System;
using System.Collections.Generic;
using System.Text;
using System.IO;

namespace VENPRO
{
   public class cllog
    {
      public static string rutaAplicacion="\\";

        public bool escribirLOG(string texto)
        {
            bool result = false;            
            //string fic = System.Environment.CurrentDirectory + "\\LOG\\convertvelocidad_" + DateTime.Now.ToString("yyyyMMdd") + ".log";
            string fic = rutaAplicacion + "\\LOG\\venpro_" + DateTime.Now.ToString("yyyyMMdd") + ".log";

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
                result = true;
            }
            catch
            {
                result = false;
            }

            return result;

        }

        public string escribirscv(string ruta, string arch,  string datos)
        {
            string result = "0";
            //string fic = System.Environment.CurrentDirectory + "\\LOG\\convertvelocidad_" + DateTime.Now.ToString("yyyyMMdd") + ".log";
            string fic = ruta + "\\" + arch;

            try
            {
                string strDir;
                //Crear directorio de configuracion.............
                strDir = ruta;
                if (System.IO.Directory.Exists(strDir) == false)
                {
                    System.IO.Directory.CreateDirectory(strDir);
                }

                if (System.IO.File.Exists(fic) == true)
                {
                    System.IO.StreamWriter sw = new StreamWriter(fic, true);
                    sw.WriteLine(datos);
                    sw.Close();
                }
                else
                {
                    System.IO.StreamWriter sw = new StreamWriter(fic, true);
                    sw.WriteLine(datos);
                    sw.Close();
                }
                result = "1";
            }
            catch(Exception ex)
            {
                result = ex.Message;
            }

            return result;

        }


    }
}
