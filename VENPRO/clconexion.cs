using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Data.OleDb;
using System.Data.Odbc;

namespace VENPRO
{
   public class clconexion
    {
       VENPRO.cllog log = new VENPRO.cllog();

        public static string con = "";
        public static string convenpro = "";
        // private string conn = "Initial Catalog=northwind;Data Source=(local);Integrated Security=SSPI;";
        private string conn;
        private string connvenpro;
        public string conexion
        {
            get
            {
                //conn = "Data Source=PCVIRTUAL\SQLEXPRESS;Initial Catalog=BDOPERACIONES;Integrated Security=True;" //SQL
                //conn="Server=localhost;Database=NombreDeMiBaseDeDatos;User id=root;Password=AquiVaTuPass;" //Mysql
                conn = con;
                return conn;

            }
            set { conn = value; }
        }

        public string conexionvenpro
        {
            get
            {
                //conn = "Data Source=PCVIRTUAL\SQLEXPRESS;Initial Catalog=BDOPERACIONES;Integrated Security=True;" //SQL
                //conn="Server=localhost;Database=NombreDeMiBaseDeDatos;User id=root;Password=AquiVaTuPass;" //Mysql
                connvenpro = convenpro;
                return connvenpro;

            }
            set { connvenpro = value; }
        }

        public bool testconexion(string conexiontipo)
        {

            bool result = false;

            SqlConnection cn;
            MySqlConnection cnMysql;

            try
            {

                if (conexiontipo == "SQL")
                {
                    cn = new SqlConnection(conexion);
                    //Abriendo conexion...
                    if (cn.State != ConnectionState.Open)
                        cn.Open();

                    //Cerrando conexion...
                    if (cn.State != ConnectionState.Closed)
                        cn.Close();
                }
                else {
                    if (conexiontipo == "Mysql")
                    {
                        cnMysql = new MySqlConnection(conexion);
                        //Abriendo conexion...
                        if (cnMysql.State != ConnectionState.Open)
                            cnMysql.Open();

                        //Cerrando conexion...
                        if (cnMysql.State != ConnectionState.Closed)
                            cnMysql.Close();
                    }
                }
                
                

                log.escribirLOG("testconexion().[ Exitoso a BD ].");
                result = true;
            }
            catch (Exception ex)
            {
                result = false;
                log.escribirLOG("Error.testconexion(). [ " + conexion + " ]. " + ex.ToString());
            }

            return result;
        }

        public bool testconexionbd(string conexiontipo, string conexion)
        {

            bool result = false;

            SqlConnection cn;
            MySqlConnection cnMysql;
            OleDbConnection cnOledb;
            OdbcConnection cnOdbc;
           
            try
            {

                //SqlConnection cnsql = new SqlConnection();
                //MySqlConnection cnmysql = new MySqlConnection();
                switch (conexiontipo)
                {
                    case "SQL":
                         cn = new SqlConnection(conexion);
                    //Abriendo conexion...
                    if (cn.State != ConnectionState.Open)
                        cn.Open();

                    //Cerrando conexion...
                    if (cn.State != ConnectionState.Closed)
                        cn.Close();
                    log.escribirLOG("testconexionbd().[ Exitoso a BD ]. SQL");
                        break;

                    case "MYSQL":
                        cnMysql = new MySqlConnection(conexion);
                        //Abriendo conexion...
                        if (cnMysql.State != ConnectionState.Open)
                            cnMysql.Open();

                        //Cerrando conexion...
                        if (cnMysql.State != ConnectionState.Closed)
                            cnMysql.Close();
                        log.escribirLOG("testconexionbd().[ Exitoso a BD ]. MYSQL");
                        break;

                      case "ACCESS":

             //           cn= new OdbcConnection("Driver={Microsoft Access Driver (*.mdb)};
             //DBQ=D:\\Program Files\\Microsoft Office\\Office10\\Samples\\Northwind.mdb;UID=;PWD=;");

                        cnOledb = new OleDbConnection(conexion);
                        //Abriendo conexion...
                        if (cnOledb.State != ConnectionState.Open)
                            cnOledb.Open();

                        //Cerrando conexion...
                        if (cnOledb.State != ConnectionState.Closed)
                            cnOledb.Close();
                        log.escribirLOG("testconexionbd().[ Exitoso a BD ]. ACCESS");
                        break;

                    default:
                        //ORACLE, SQL, DNS

        //cn= new OdbcConnection("Driver={Microsoft ODBC for Oracle};Server=myOracleServer;
        //                        UID=demo;PWD=demo;");
                        //......DNS
                        //cn = new OdbcConnection("dsn=myDSN;UID=myUid;PWD=myPwd;");

                        //.....SQL
                        //cn= new OdbcConnection("Driver={SQL Server};Server=mySQLServer;UID=sa;
                               //PWD=myPassword;Database=Northwind;");

                         cnOdbc = new OdbcConnection(conexion);
                        //Abriendo conexion...
                        if (cnOdbc.State != ConnectionState.Open)
                            cnOdbc.Open();

                        //Cerrando conexion...
                        if (cnOdbc.State != ConnectionState.Closed)
                            cnOdbc.Close();
                        log.escribirLOG("testconexionbd().[ Exitoso a BD ]. OTROS");
                        break;
                }

                result = true;
            }
            catch (Exception ex)
            {
                result = false;
                log.escribirLOG("Error.testconexionbd(). [ " + conexion + " ].[" + conexiontipo + "] " + ex.ToString());
            }

            return result;
        }


        public static void aplicarconexion()
        {
            clconexion.con = con;
        }

        public static void aplicarconexionvenpro()
        {
            clconexion.convenpro = convenpro;
        }



    }

}
