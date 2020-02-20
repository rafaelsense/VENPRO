using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using MySql.Data.MySqlClient;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Data.Odbc;

namespace VENPRO
{
    class cldatos_mysql
    {

        VENPRO.cllog log = new VENPRO.cllog();
        VENPRO.clconexion clconexion = new VENPRO.clconexion();

        DataSet ds = new DataSet();

        //.........
        private string _err;
        public string err
        {
            get { return _err; }
            set { _err = value; }
        }


        //---------
        public DataSet cargar_tipoconexion_mysql(MySqlConnection cn, Int64 codtipoconexion)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                if (codtipoconexion == 0)
                {
                    command.CommandText = @" select * from tipoconexion Order By nomtipoconexion asc;";
                }
                else
                {
                    command.CommandText = @"   select * from tipoconexion 
                        where codtipoconexion=@codtipoconexion";
                }


                command.Parameters.Add("@codtipoconexion", MySqlDbType.Int64);

                //...................
                command.Parameters["@codtipoconexion"].Value = codtipoconexion;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tipoconexion");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tipoconexion_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tipoconexion_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public bool insert_conexionbd_mysql(MySqlConnection cn, string nomtipoconexion, string nomconexion,
   string conexion)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO conexionbd (codtipoconexion, nomconexion, conexion) 
                                  select  (select codtipoconexion from tipoconexion where nomtipoconexion=@nomtipoconexion), @nomconexion, @conexion ";

                command.Parameters.Add("@nomtipoconexion", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@nomconexion", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@conexion", MySqlDbType.Text);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@nomtipoconexion"].Value = nomtipoconexion;
                command.Parameters["@nomconexion"].Value = nomconexion;
                command.Parameters["@conexion"].Value = conexion;
                //...................

                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.insert_conexionbd_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_conexionbd_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public bool update_conexionbd_mysql(MySqlConnection cn, Int64 codconexionbd, string nomtipoconexion, string nomconexion,
          string conexion)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update conexionbd  set codtipoconexion=(select codtipoconexion from tipoconexion where nomtipoconexion=@nomtipoconexion), 
                        nomconexion=@nomconexion, conexion=@conexion where codconexionbd=@codconexionbd";

                command.Parameters.Add("@codconexionbd", MySqlDbType.Int64);
                command.Parameters.Add("@nomtipoconexion", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@nomconexion", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@conexion", MySqlDbType.Text);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@codconexionbd"].Value = codconexionbd;
                command.Parameters["@nomtipoconexion"].Value = nomtipoconexion;
                command.Parameters["@nomconexion"].Value = nomconexion;
                command.Parameters["@conexion"].Value = conexion;
                //...................

                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.update_conexionbd_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_conexionbd_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public DataSet cargar_conexionbd_mysql(MySqlConnection cn)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"   select c.codconexionbd, tc.nomtipoconexion, c.nomconexion, c.conexion  from conexionbd c, tipoconexion tc 
                where c.codtipoconexion=tc.codtipoconexion Order By c.nomconexion asc;";



                //command.Parameters.Add("@codtipoconexion", MySqlDbType.Int64);

                ////...................
                //command.Parameters["@codtipoconexion"].Value = codtipoconexion;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "conexionbd");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_conexionbd_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_conexionbd_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_conexionbd_mysql(MySqlConnection cn, string nomtipoconexion)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select c.codconexionbd, tc.nomtipoconexion, c.nomconexion, c.conexion  
                from conexionbd c inner join tipoconexion tc on  c.codtipoconexion=tc.codtipoconexion
                where nomtipoconexion=@nomtipoconexion;";



                command.Parameters.Add("@nomtipoconexion", MySqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtipoconexion"].Value = nomtipoconexion;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "conexionbd");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_conexionbd_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_conexionbd_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        //---------

        public bool insert_tienda_mysql(MySqlConnection cn, Int64 codtienda,  string nomtienda, string servidor, string ruta, 
            string usuario, string password, Boolean estado)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO tienda (codtienda, nomtienda, servidor, ruta, usuario, password, estado ) 
                                    values (@codtienda, @nomtienda, @servidor, @ruta, @usuario, @password, @estado )";

                command.Parameters.Add("@codtienda", MySqlDbType.Int64);
                command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@servidor", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@ruta", MySqlDbType.VarChar, 200);
                command.Parameters.Add("@usuario", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@password", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@estado", MySqlDbType.Bit);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@codtienda"].Value = codtienda;
                command.Parameters["@nomtienda"].Value = nomtienda;
                command.Parameters["@servidor"].Value = servidor;
                //command.Parameters["@ruta"].Value = ruta;
                //command.Parameters["@usuario"].Value = usuario;
                //command.Parameters["@password"].Value = password;
                command.Parameters["@estado"].Value = estado;

                //...................

                if (ruta == "")
                {
                    command.Parameters["@ruta"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@ruta"].Value = ruta;
                }

                if (usuario == "")
                {
                    command.Parameters["@usuario"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@usuario"].Value = usuario;
                }

                if (password == "")
                {
                    command.Parameters["@password"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@password"].Value = password;
                }


                //command.Connection.Open();

                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.insert_tienda_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_tienda_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public bool update_tienda_mysql(MySqlConnection cn, Int64 codtienda, string nomtienda, string servidor, string ruta,
            string usuario, string password, Boolean estado)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update tienda set  nomtienda=@nomtienda, servidor=@servidor, ruta=@ruta, usuario=@usuario,
                                        password=@password, estado=@estado  
                                        where codtienda=@codtienda;";

                command.Parameters.Add("@codtienda", MySqlDbType.Int64);
                command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@servidor", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@ruta", MySqlDbType.VarChar, 200);
                command.Parameters.Add("@usuario", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@password", MySqlDbType.VarChar, 100);
                command.Parameters.Add("@estado", MySqlDbType.Bit);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@codtienda"].Value = codtienda;
                command.Parameters["@nomtienda"].Value = nomtienda;
                command.Parameters["@servidor"].Value = servidor;
                //command.Parameters["@ruta"].Value = ruta;
                //command.Parameters["@usuario"].Value = usuario;
                //command.Parameters["@password"].Value = password;
                command.Parameters["@estado"].Value = estado;

                //...................

                if (ruta == "")
                {
                    command.Parameters["@ruta"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@ruta"].Value = ruta;
                }

                if (usuario == "")
                {
                    command.Parameters["@usuario"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@usuario"].Value = usuario;
                }

                if (password == "")
                {
                    command.Parameters["@password"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@password"].Value = password;
                }



                //command.Connection.Open();  
                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.update_tienda_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_tienda_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public bool update_tiendaestado_mysql(MySqlConnection cn, Int64 codtienda, Boolean estado)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update tienda set estado=@estado  
                                        where codtienda=@codtienda;";

                command.Parameters.Add("@codtienda", MySqlDbType.Int64);
                command.Parameters.Add("@estado", MySqlDbType.Bit);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@codtienda"].Value = codtienda;
                command.Parameters["@estado"].Value = estado;

                //...................
             
                //command.Connection.Open();  
                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.update_tiendaestado_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_tiendaestado_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public DataSet cargar_tienda_mysql(MySqlConnection cn, string nomtienda)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = "select * from tienda  where nomtienda like '%" + nomtienda + "%'";

                command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 50);

                //...................
                command.Parameters["@nomtienda"].Value = nomtienda;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tienda");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tienda_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tienda_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        //-----------------------

        //--
        public bool insert_columnasimport_mysql(MySqlConnection cn, string nomcolumna, string nomcolumnaxml, string tipocolumna,
           Double size, string formato)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO columnasimport (nomcolumna, nomcolumnaxml, tipocolumna, size, formato ) 
                                    values (@nomcolumna, @nomcolumnaxml, @tipocolumna, @size, @formato )";

                command.Parameters.Add("@nomcolumna", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@nomcolumnaxml", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@tipocolumna", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@size", MySqlDbType.Double, 10);
                command.Parameters.Add("@formato", MySqlDbType.VarChar, 50);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@nomcolumna"].Value = nomcolumna;
                command.Parameters["@nomcolumnaxml"].Value = nomcolumnaxml;
                command.Parameters["@size"].Value = size;
                //command.Parameters["@formato"].Value = formato;
                //...................

                if (tipocolumna == "")
                {
                    command.Parameters["@tipocolumna"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@tipocolumna"].Value = tipocolumna;
                }

                if (formato == "")
                {
                    command.Parameters["@formato"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@formato"].Value = formato;
                }






                //command.Connection.Open();



                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.insert_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public bool update_columnasimport_mysql(MySqlConnection cn, Int64 codcolumna, string nomcolumna, string nomcolumnaxml, string tipocolumna,
           Double size, string formato)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update columnasimport set nomcolumna=@nomcolumna, nomcolumnaxml=@nomcolumnaxml,
                                        tipocolumna=@tipocolumna, size=@size, formato=@formato  
                                    where codcolumna=@codcolumna;";

                command.Parameters.Add("@codcolumna", MySqlDbType.Int64);
                command.Parameters.Add("@nomcolumna", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@nomcolumnaxml", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@tipocolumna", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@size", MySqlDbType.Double, 10);
                command.Parameters.Add("@formato", MySqlDbType.VarChar, 50);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@codcolumna"].Value = codcolumna;
                command.Parameters["@nomcolumna"].Value = nomcolumna;
                command.Parameters["@nomcolumnaxml"].Value = nomcolumnaxml;
                //command.Parameters["@tipocolumna"].Value = tipocolumna;
                command.Parameters["@size"].Value = size;
                //command.Parameters["@formato"].Value = formato;
                //...................

                if (tipocolumna == "")
                {
                    command.Parameters["@tipocolumna"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@tipocolumna"].Value = tipocolumna;
                }

                if (formato == "")
                {
                    command.Parameters["@formato"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@formato"].Value = formato;
                }






                //command.Connection.Open();



                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.update_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public DataSet cargar_columnasimport_mysql(MySqlConnection cn, string nomcolumna)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = "select * from columnasimport  where nomcolumna like '%" + nomcolumna + "%'";

                command.Parameters.Add("@nomcolumna", MySqlDbType.VarChar, 50);

                //...................
                command.Parameters["@nomcolumna"].Value = nomcolumna;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "columnasimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_columnasimport_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_columnasimport_mysql(MySqlConnection cn, string nomcolumna, string nomcolumnaxml)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                if (nomcolumna == "" && nomcolumnaxml != "")
                {
                    command.CommandText = "select * from columnasimport  where nomcolumnaxml like '%" + nomcolumnaxml + "%';";
                }
                else {

                    if (nomcolumna != "" && nomcolumnaxml == "")
                    {
                        command.CommandText = "select * from columnasimport  where nomcolumna like '%" + nomcolumna + "%';";
                    }
                    else
                    {
                        command.CommandText = "select * from columnasimport  where nomcolumna like '%" + nomcolumna + "%'"
                                + " or nomcolumnaxml like '%" + nomcolumnaxml + "%'";
                    }

                    
                }
                

                command.Parameters.Add("@nomcolumna", MySqlDbType.VarChar, 250);

                //...................
                command.Parameters["@nomcolumna"].Value = nomcolumna;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "columnasimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_columnasimport_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_columnasimport_mysql(MySqlConnection cn, Int64 codcolumna)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select codcolumna, nomcolumna, nomcolumnaxml, tipocolumna,size, formato from columnasimport
                where codcolumna=@codcolumna;";

                command.Parameters.Add("@codcolumna", MySqlDbType.Int64);

                //...................
                command.Parameters["@codcolumna"].Value = codcolumna;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "columnasimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_columnasimport_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_columnasimport_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        //--

        //--

        public bool insert_tablaimport_mysql(MySqlConnection cn, string nomtabla, string nomtablaxml,  int col_posicion_update,
            int col_posicion_update1, int col_posicion_update2, int col_posicion_update3, int col_posicion_update4,
            int col_posicion_update5, int col_posicion_update6, int col_posicion_update7, string modoactualizacion, Boolean estadoactivo,
       string[] columna, int[] posicion)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO tablaimport (nomtabla, nomtablaxml, col_posicion_update, col_posicion_update1, col_posicion_update2,
                                        col_posicion_update3, col_posicion_update4, col_posicion_update5, col_posicion_update6, col_posicion_update7,
                                        modoactualizacion, estadoactivo ) 
                                    select @nomtabla, @nomtablaxml, @col_posicion_update,  @col_posicion_update1,  @col_posicion_update2,
                                        @col_posicion_update3, @col_posicion_update4, @col_posicion_update5, @col_posicion_update6, @col_posicion_update7,
                                        @modoactualizacion, @estadoactivo;";

                command.Parameters.Add("@nomtabla", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@nomtablaxml", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@col_posicion_update", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update1", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update2", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update3", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update4", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update5", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update6", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update7", MySqlDbType.Int32);
                command.Parameters.Add("@modoactualizacion", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@estadoactivo", MySqlDbType.Bit);
                command.Parameters.Add("@nomconexion", MySqlDbType.VarChar, 100);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;
                command.Parameters["@nomtablaxml"].Value = nomtablaxml;
                //command.Parameters["@col_posicion_update"].Value = col_posicion_update;

                //command.Parameters["@col_posicion_update1"].Value = col_posicion_update1;
                //command.Parameters["@col_posicion_update2"].Value = col_posicion_update2;

                if (col_posicion_update == 0)
                {
                    command.Parameters["@col_posicion_update"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update"].Value = col_posicion_update;
                }

                if (col_posicion_update1 == 0)
                {
                    command.Parameters["@col_posicion_update1"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update1"].Value = col_posicion_update1;
                }

                if (col_posicion_update2 == 0)
                {
                    command.Parameters["@col_posicion_update2"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update2"].Value = col_posicion_update2;
                }

                if (col_posicion_update3 == 0)
                {
                    command.Parameters["@col_posicion_update3"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update3"].Value = col_posicion_update3;
                }

                if (col_posicion_update4 == 0)
                {
                    command.Parameters["@col_posicion_update4"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update4"].Value = col_posicion_update4;
                }

                if (col_posicion_update5 == 0)
                {
                    command.Parameters["@col_posicion_update5"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update5"].Value = col_posicion_update5;
                }

                if (col_posicion_update6 == 0)
                {
                    command.Parameters["@col_posicion_update6"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update6"].Value = col_posicion_update6;
                }

                if (col_posicion_update7 == 0)
                {
                    command.Parameters["@col_posicion_update7"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update7"].Value = col_posicion_update7;
                }

                

                command.Parameters["@modoactualizacion"].Value = modoactualizacion;
                command.Parameters["@estadoactivo"].Value = estadoactivo;
                //...................
                command.ExecuteNonQuery();

                //....................
                String commandIndentity = "SELECT @@IDENTITY";
                //cmd = new OleDbCommand(commandIndentity, cn, trans);
                //Console.WriteLine("New Running No = {0}", (int)cmd.ExecuteScalar());
                command.CommandText = commandIndentity;
                Int64 t_codigo = 0;
                t_codigo = Convert.ToInt64(command.ExecuteScalar());
                log.escribirLOG("Codigo:" + t_codigo.ToString());
                //......................

                if (t_codigo == 0)
                {
                    tran.Rollback();
                    return false;
                }

                if (t_codigo > 0)
                {
                    command.Parameters.Add("@codtabla", MySqlDbType.Int64);
                    command.Parameters.Add("@nomcolumna", MySqlDbType.VarChar, 50);
                    command.Parameters.Add("@posicion", MySqlDbType.Int32);

                    for (int i = 0; i < columna.Length; i++)
                    {
                        command.Parameters["@codtabla"].Value = t_codigo;
                        command.Parameters["@nomcolumna"].Value = columna[i];
                        command.Parameters["@posicion"].Value = posicion[i];
                        //...................

                        command.CommandText = @"INSERT INTO tablaimport_columnaimport (codtabla, codcolumna, posicion ) 
                select @codtabla, (select codcolumna from columnasimport where nomcolumna=@nomcolumna) as codcolumna, @posicion ";

                        command.ExecuteNonQuery();
                    }

                    tran.Commit();
                    result = true;
                }
                else
                {
                    result = false;
                }




                //command.Connection.Open();







            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.insert_tablaimport_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_tablaimport_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }


        public bool update_tablaimport_mysql(MySqlConnection cn, Int64 codtabla, string nomtabla, string nomtablaxml, int col_posicion_update,
            int col_posicion_update1, int col_posicion_update2, int col_posicion_update3, int col_posicion_update4,
            int col_posicion_update5, int col_posicion_update6, int col_posicion_update7, string modoactualizacion, Boolean estadoactivo,
       string[] columna, int[] posicion)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update tablaimport set nomtabla=@nomtabla, nomtablaxml=@nomtablaxml, col_posicion_update=@col_posicion_update, col_posicion_update1=@col_posicion_update1, 
                                        col_posicion_update2=@col_posicion_update2 , col_posicion_update3=@col_posicion_update3 , col_posicion_update4=@col_posicion_update4 ,
                                        col_posicion_update5=@col_posicion_update5 , col_posicion_update6=@col_posicion_update6 , col_posicion_update7=@col_posicion_update7 ,
                                        modoactualizacion=@modoactualizacion, estadoactivo=@estadoactivo     
                                        where codtabla=@codtabla ";

                command.Parameters.Add("@codtabla", MySqlDbType.Int64);
                command.Parameters.Add("@nomtabla", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@nomtablaxml", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@col_posicion_update", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update1", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update2", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update3", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update4", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update5", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update6", MySqlDbType.Int32);
                command.Parameters.Add("@col_posicion_update7", MySqlDbType.Int32);
                command.Parameters.Add("@modoactualizacion", MySqlDbType.VarChar, 50);
                command.Parameters.Add("@estadoactivo", MySqlDbType.Bit);
                command.Parameters.Add("@nomconexion", MySqlDbType.VarChar, 100);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@codtabla"].Value = codtabla;
                command.Parameters["@nomtabla"].Value = nomtabla;
                command.Parameters["@nomtablaxml"].Value = nomtablaxml;
                //command.Parameters["@col_posicion_update"].Value = col_posicion_update;

                //command.Parameters["@col_posicion_update1"].Value = col_posicion_update1;
                //command.Parameters["@col_posicion_update2"].Value = col_posicion_update2;

                if (col_posicion_update == 0)
                {
                    command.Parameters["@col_posicion_update"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update"].Value = col_posicion_update;
                }

                if (col_posicion_update1 == 0)
                {
                    command.Parameters["@col_posicion_update1"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update1"].Value = col_posicion_update1;
                }

                if (col_posicion_update2 == 0)
                {
                    command.Parameters["@col_posicion_update2"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update2"].Value = col_posicion_update2;
                }

                if (col_posicion_update3 == 0)
                {
                    command.Parameters["@col_posicion_update3"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update3"].Value = col_posicion_update3;
                }

                if (col_posicion_update4 == 0)
                {
                    command.Parameters["@col_posicion_update4"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update4"].Value = col_posicion_update4;
                }

                if (col_posicion_update5 == 0)
                {
                    command.Parameters["@col_posicion_update5"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update5"].Value = col_posicion_update5;
                }

                if (col_posicion_update6 == 0)
                {
                    command.Parameters["@col_posicion_update6"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update6"].Value = col_posicion_update6;
                }

                if (col_posicion_update7 == 0)
                {
                    command.Parameters["@col_posicion_update7"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@col_posicion_update7"].Value = col_posicion_update7;
                }


                command.Parameters["@modoactualizacion"].Value = modoactualizacion;
                command.Parameters["@estadoactivo"].Value = estadoactivo;
                //...................
                command.ExecuteNonQuery();

                //....................
                Int64 t_codigo = 0;
                t_codigo = codtabla;
                log.escribirLOG("Codigo update:" + t_codigo.ToString());
                //......................

                if (t_codigo == 0)
                {
                    tran.Rollback();
                    return false;
                }

                if (t_codigo > 0)
                {
                    command.Parameters.Add("@nomcolumna", MySqlDbType.VarChar, 50);
                    command.Parameters.Add("@posicion", MySqlDbType.Int32);
                    //Eliminar columnas de tabla...
                    command.CommandText = @"delete from tablaimport_columnaimport where codtabla=@codtabla";
                    command.ExecuteNonQuery();
                    //.........

                    for (int i = 0; i < columna.Length; i++)
                    {
                        command.Parameters["@codtabla"].Value = t_codigo;
                        command.Parameters["@nomcolumna"].Value = columna[i];
                        command.Parameters["@posicion"].Value = posicion[i];
                        //...................

                        command.CommandText = @"INSERT INTO tablaimport_columnaimport (codtabla, codcolumna, posicion ) 
                select @codtabla, (select codcolumna from columnasimport where nomcolumna=@nomcolumna) as codcolumna, @posicion ";

                        command.ExecuteNonQuery();
                    }

                    tran.Commit();
                    result = true;
                }
                else
                {
                    result = false;
                }




                //command.Connection.Open();







            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.update_tablaimport_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_tablaimport_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public DataSet cargar_tablaimport_mysql(MySqlConnection cn, string nomtabla)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, Count(c.nomcolumna) as cantcolumnas, t.modoactualizacion from
                                tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna
                                where nomtabla like '%" + nomtabla + "%' group by t.codtabla, t.nomtabla;";

                command.Parameters.Add("@nomtabla", MySqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tablaimport_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tablaimport_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_tablaimport_mysql(MySqlConnection cn, string nomtabla, string nomtablaxml)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;


                if (nomtabla == "" && nomtablaxml != "")
                {
                    command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, Count(c.nomcolumna) as cantcolumnas, t.modoactualizacion from
                                tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna
                                where nomtablaxml like '%" + nomtablaxml + "%' group by t.codtabla, t.nomtabla;";

                }
                else
                {

                    if (nomtabla != "" && nomtablaxml == "")
                    {
                        command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, Count(c.nomcolumna) as cantcolumnas, t.modoactualizacion from
                                tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna
                                where nomtabla like '%" + nomtabla + "%' group by t.codtabla, t.nomtabla;";

                    }
                    else
                    {
                        command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, Count(c.nomcolumna) as cantcolumnas, t.modoactualizacion from
                                tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna
                                where nomtabla like '%" + nomtabla + "%'  or nomtablaxml like '%" + nomtablaxml + "%'" + 
                                                      " group by t.codtabla, t.nomtabla;";

                    }


                }

                command.Parameters.Add("@nomtabla", MySqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tablaimport_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tablaimport_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }


        public DataSet cargar_nomcolumna_mysql(MySqlConnection cn, string nomtabla)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select tc.posicion, c.nomcolumna, c.nomcolumnaxml from tablaimport t,tablaimport_columnaimport tc, columnasimport c
                where  t.codtabla=tc.codtabla and tc.codcolumna=c.codcolumna
                and  nomtabla=@nomtabla Order by tc.posicion asc;";

                command.Parameters.Add("@nomtabla", MySqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_nomcolumna_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_nomcolumna_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }


        //--

        //Importar.....
        public DataSet cargar_tablaxml_import_mysql(MySqlConnection cn)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;


                command.CommandText = @" select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo,  
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, t.modoactualizacion, 
					 c.codcolumna, c.nomcolumna, c.nomcolumnaxml, c.tipocolumna, c.size, c.formato, tc.posicion as posicioncolum
					  from tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna  
                Order by t.codtabla, tc.posicion asc;";



                //command.Parameters.Add("@nomtablaxml", MySqlDbType.VarChar, 100);

                //...................
                //command.Parameters["@nomtablaxml"].Value = nomtablaxml;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tablaxml_import_mysql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.Message;
                log.escribirLOG("Error.cargar_tablaxml_import_mysql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.ToString());
                return ds;
            }


        }

//        public bool delete_RPE_archivoimport(DataTable dtcolumnas, List<String> datosupdatecolum,
//        Int64 codevento, string nomevento, Int64 codimportarchivo, string nomimportarchivo, Int64 codtipoconexion,
//            string tipoconexion, Int64 codconexionbd, string nomconexion, string conexion,
//                Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate)
//        {
//            bool result = false;

//            MySqlCommand command_mysql = new MySqlCommand();
//            MySqlTransaction tran_mysql = null;

//            SqlCommand command_Sql = new SqlCommand();
//            SqlTransaction tran_Sql = null;

//            OleDbCommand command_OleDb = new OleDbCommand();
//            OleDbTransaction tran_OleDb = null;

//            OdbcCommand command_Odbc = new OdbcCommand();
//            OdbcTransaction tran_Odbc = null;

//            string query = "";
//            string tmp_err = "";
//            //string rutaorigen, string archivoorigen, Int64 codevento, string nomevento,  
//            //    Int64 codimportarchivo,string nomimportarchivo,  Int64 codtipoconexion, 
//            //string tipoconexion, Int64 codconexionbd, string nomconexion,  string conexion, 
//            //    Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate, 
//            //string rangoexcel

//            string v_columnaupdate_del = "";
//            string v_tabla = "";
//            string v_uso = "";
//            string v_nomcolumna = "";
//            string v_tipocolumna = "";
//            string v_size = "";
//            string v_formato = "";

//            try
//            {





//                v_columnaupdate_del = "";
//                v_tabla = dtcolumnas.Rows[colposicionupdate - 1]["nomtabla"].ToString();
//                v_uso = dtcolumnas.Rows[colposicionupdate - 1]["uso"].ToString();
//                v_nomcolumna = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
//                v_tipocolumna = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
//                v_size = dtcolumnas.Rows[colposicionupdate - 1]["size"].ToString();
//                v_formato = dtcolumnas.Rows[colposicionupdate - 1]["formato"].ToString();

//                if (dtcolumnas.Rows.Count > 0)
//                {
//                    //SE DEBE VALIDAR QUE EXISTA DATO EN EN CAMPO USO....
//                    //compara la fila que tiene la columna update.. 
//                    //ARRAY TEXTO
//                    //ARRAY NUMERO
//                    if (v_uso == "ARRAY TEXTO")
//                    {

//                        if (tipoconexion == "ACCESS")
//                        {

//                            if (v_tipocolumna == "Date")
//                            {
//                                for (int i = 0; i < datosupdatecolum.Count; i++)
//                                {

//                                    if (i == 0)
//                                    {
//                                        v_columnaupdate_del = "#" + datosupdatecolum[i] + "#";
//                                    }
//                                    else
//                                    {
//                                        v_columnaupdate_del = v_columnaupdate_del + " ,#" + datosupdatecolum[i] + "#";
//                                    }


//                                }
//                            }
//                            else
//                            {
//                                for (int i = 0; i < datosupdatecolum.Count; i++)
//                                {

//                                    if (i == 0)
//                                    {
//                                        v_columnaupdate_del = "'" + datosupdatecolum[i] + "'";
//                                    }
//                                    else
//                                    {
//                                        v_columnaupdate_del = v_columnaupdate_del + ",'" + datosupdatecolum[i] + "'";
//                                    }


//                                }
//                            }

//                        }
//                        else
//                        {
//                            for (int i = 0; i < datosupdatecolum.Count; i++)
//                            {

//                                if (i == 0)
//                                {
//                                    v_columnaupdate_del = "'" + datosupdatecolum[i] + "'";
//                                }
//                                else
//                                {
//                                    v_columnaupdate_del = v_columnaupdate_del + ",'" + datosupdatecolum[i] + "'";
//                                }


//                            }
//                        }

//                    }
//                    //.........
//                    if (v_uso == "ARRAY NUMERO")
//                    {
//                        for (int i = 0; i < datosupdatecolum.Count; i++)
//                        {

//                            if (i == 0)
//                            {
//                                v_columnaupdate_del = "" + datosupdatecolum[i] + "";
//                            }
//                            else
//                            {
//                                v_columnaupdate_del = v_columnaupdate_del + "," + datosupdatecolum[i] + "";
//                            }


//                        }
//                    }

//                }

//                //..................

//                query = @"delete from " + tabla + @" where " + v_nomcolumna + " in ( " + v_columnaupdate_del + " )";

//                tmp_err = "Error.delete_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                         "nomevento: " + nomevento + "\r\n" +
//                                         "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                           "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                          "codtabla: " + codtabla + "\r\n" +
//                                          "tipoconexion: " + tipoconexion + "\r\n" +
//                                          "codconexion: " + codconexionbd + "\r\n" +
//                                          "nomconexion: " + nomconexion + "\r\n" +
//                                          "columnaupdate: " + v_nomcolumna + "\r\n" +
//                                          "valorEliminacion: " + v_columnaupdate_del + "\r\n" +
//                                          "]" + "[" + query + "]. ";
//                //CONEXION MULTIPLE-----------------------------------
//                SqlConnection cnSql_BD;
//                MySqlConnection cnMysql_BD;
//                OleDbConnection cnOleDb_BD;
//                OdbcConnection cnOdbc_BD;
//                switch (tipoconexion)
//                {
//                    case "SQL":
//                        cnSql_BD = new SqlConnection(conexion);
//                        //Abriendo conexion...
//                        if (cnSql_BD.State != ConnectionState.Open)
//                            cnSql_BD.Open();
//                        command_Sql.Connection = cnSql_BD;
//                        command_Sql.CommandText = query;
//                        tran_Sql = command_Sql.Connection.BeginTransaction();
//                        command_Sql.Transaction = tran_Sql;
//                        command_Sql.ExecuteNonQuery();

//                        try
//                        {
//                            tran_Sql.Commit();
//                            result = true;
//                        }
//                        catch (Exception ex)
//                        {
//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            tran_Sql.Rollback();
//                        }

//                        break;

//                    case "MYSQL":
//                        cnMysql_BD = new MySqlConnection(conexion);
//                        //Abriendo conexion...
//                        if (cnMysql_BD.State != ConnectionState.Open)
//                            cnMysql_BD.Open();
//                        command_mysql.Connection = cnMysql_BD;
//                        command_mysql.CommandText = query;
//                        tran_mysql = command_mysql.Connection.BeginTransaction();
//                        command_mysql.Transaction = tran_mysql;
//                        command_mysql.ExecuteNonQuery();

//                        try
//                        {
//                            tran_mysql.Commit();
//                            result = true;
//                        }
//                        catch (Exception ex)
//                        {
//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            tran_mysql.Rollback();
//                        }

//                        break;

//                    case "ACCESS":
//                        cnOleDb_BD = new OleDbConnection(conexion);
//                        //Abriendo conexion...
//                        if (cnOleDb_BD.State != ConnectionState.Open)
//                            cnOleDb_BD.Open();
//                        command_OleDb.Connection = cnOleDb_BD;
//                        command_OleDb.CommandText = query;
//                        tran_OleDb = command_OleDb.Connection.BeginTransaction();
//                        command_OleDb.Transaction = tran_OleDb;
//                        command_OleDb.ExecuteNonQuery();

//                        try
//                        {
//                            tran_OleDb.Commit();
//                            result = true;
//                        }
//                        catch (Exception ex)
//                        {
//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            tran_OleDb.Rollback();
//                        }

//                        break;

//                    //case "ORACLE":
//                    //    cnOdbc_BD = new OdbcConnection(conexion);
//                    //    //Abriendo conexion...
//                    //    if (cnOdbc_BD.State != ConnectionState.Open)
//                    //        cnOdbc_BD.Open();
//                    //    command_Odbc.Connection = cnOdbc_BD;
//                    //    command_Odbc.CommandText = query;
//                    //    tran_Odbc = command_Odbc.Connection.BeginTransaction();
//                    //    command_Odbc.Transaction = tran_Odbc;
//                    //    command_Odbc.ExecuteNonQuery();

//                    //    try
//                    //    {
//                    //        tran_Odbc.Commit();
//                    //        result = true;
//                    //    }
//                    //    catch (Exception ex)
//                    //    {
//                    //        result = false;
//                    //        _err = tmp_err + ". " + ex.ToString();
//                    //        log.escribirLOG(tmp_err + ". " + ex.ToString());
//                    //        tran_Odbc.Rollback();
//                    //    }

//                    //    break;

//                    default:
//                        cnOdbc_BD = new OdbcConnection(conexion);
//                        //Abriendo conexion...
//                        if (cnOdbc_BD.State != ConnectionState.Open)
//                            cnOdbc_BD.Open();
//                        command_Odbc.Connection = cnOdbc_BD;
//                        command_Odbc.CommandText = query;
//                        tran_Odbc = command_Odbc.Connection.BeginTransaction();
//                        command_Odbc.Transaction = tran_Odbc;
//                        command_Odbc.ExecuteNonQuery();

//                        try
//                        {
//                            tran_Odbc.Commit();
//                            result = true;
//                        }
//                        catch (Exception ex)
//                        {
//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            tran_Odbc.Rollback();
//                        }


//                        break;
//                }
//                //-------------------------------------------------------



//                ////...................
//                //command.Parameters["@nomcolumna"].Value = nomcolumna;

//                //command.Parameters["@size"].Value = size;
//                ////command.Parameters["@formato"].Value = formato;
//                ////...................

//                //if (tipocolumna == "")
//                //{
//                //    command.Parameters["@tipocolumna"].Value = DBNull.Value;
//                //}
//                //else
//                //{
//                //    command.Parameters["@tipocolumna"].Value = tipocolumna;
//                //}

//                //if (formato == "")
//                //{
//                //    command.Parameters["@formato"].Value = DBNull.Value;
//                //}
//                //else
//                //{
//                //    command.Parameters["@formato"].Value = formato;
//                //}






//                //command.Connection.Open();






//            }
//            catch (Exception ex)
//            {
//                result = false;
//                _err = "Error.delete_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "columnaupdate: " + v_nomcolumna + "\r\n" +
//                                         "valorEliminacion: " + v_columnaupdate_del + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString();

//                log.escribirLOG("Error.delete_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "columnaupdate: " + v_nomcolumna + "\r\n" +
//                                         "valorEliminacion: " + v_columnaupdate_del + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString()
//                                         );



//            }
//            finally
//            {
//                //if (command.Connection != null)
//                //{
//                //    if (command.Connection.State == ConnectionState.Open)
//                //        command.Connection.Close();
//                //}
//            }

//            return result;
//        }

//        private bool insert_RPE_archivoimport_SQL(Int64 index, String[,] valorFila, DataTable dtcolumnas, List<String> datosupdatecolum,
//Int64 codevento, string nomevento, Int64 codimportarchivo, string nomimportarchivo, Int64 codtipoconexion,
//    string tipoconexion, Int64 codconexionbd, string nomconexion, string conexion,
//        Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate)
//        {
//            bool result = false;

//            MySqlCommand command_mysql = new MySqlCommand();
//            MySqlTransaction tran_mysql = null;

//            SqlCommand command_Sql = new SqlCommand();
//            SqlTransaction tran_Sql = null;

//            OdbcCommand command_Odbc = new OdbcCommand();
//            OdbcTransaction tran_Odbc = null;

//            string query = "";
//            string tmp_err = "";

//            string tmp_valorFila = "";

//            string c_columnas = "";
//            string p_columnas = "";
//            string v_tabla = "";


//            try
//            {





//                c_columnas = "";
//                p_columnas = "";
//                v_tabla = dtcolumnas.Rows[colposicionupdate - 1]["nomtabla"].ToString();
//                //v_uso = dtcolumnas.Rows[colposicionupdate - 1]["uso"].ToString();
//                //v_nomcolumna = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
//                //v_tipocolumna = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
//                //v_size = dtcolumnas.Rows[colposicionupdate - 1]["size"].ToString();
//                //v_formato = dtcolumnas.Rows[colposicionupdate - 1]["formato"].ToString();


//                if (valorFila.GetLength(1) != dtcolumnas.Rows.Count)
//                {
//                    tmp_err = "Error.insert_RPE_archivoimport_SQL(). La configuracion de columnas del archivo y las columnas de la tabla deben coincidir" + "[codevento: " + codevento.ToString() + "\r\n" +
//                                         "nomevento: " + nomevento + "\r\n" +
//                                         "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                           "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                          "codtabla: " + codtabla + "\r\n" +
//                                          "tipoconexion: " + tipoconexion + "\r\n" +
//                                          "codconexion: " + codconexionbd + "\r\n" +
//                                          "nomconexion: " + nomconexion + "\r\n" +
//                                          "NumeroColumnaTabla: " + dtcolumnas.Rows.Count.ToString() + "\r\n" +
//                                          "NumeroColumnaArchivo: " + valorFila.GetLength(1).ToString() + "\r\n" +
//                                          "]. ";

//                    _err = tmp_err;
//                    log.escribirLOG(tmp_err);
//                    return false;
//                }

//                //Cargar Columnas Tabla.........
//                if (dtcolumnas.Rows.Count > 0)
//                {

//                    for (int i = 0; i < dtcolumnas.Rows.Count; i++)
//                    {

//                        if (i == 0)
//                        {
//                            c_columnas = "" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }
//                        else
//                        {
//                            c_columnas = c_columnas + ", " + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = p_columnas + ", " + "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }

//                        //-------------------------------------------------
//                        //Valores de TipoColumna permitido.
//                        //VarChar ->size
//                        //Char ->size
//                        //DateTime
//                        //Date
//                        //Time
//                        //Double
//                        //Bit
//                        //Int
//                        //Text
//                        string t_tipocolumna = dtcolumnas.Rows[i]["tipocolumna"].ToString();
//                        Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[i]["size"].ToString());
//                        string t_paramcolumna = "@" + dtcolumnas.Rows[i]["nomcolumna"].ToString();

//                        if (t_tipocolumna == "VarChar")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.VarChar, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Char")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Char, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "DateTime")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.DateTime);
//                        }
//                        if (t_tipocolumna == "Date")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Date);
//                        }
//                        if (t_tipocolumna == "Time")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Time);
//                        }
//                        if (t_tipocolumna == "Double")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Decimal, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Bit")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Bit);
//                        }
//                        if (t_tipocolumna == "Int")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Int);
//                        }
//                        if (t_tipocolumna == "Text")
//                        {
//                            command_Sql.Parameters.Add(t_paramcolumna, SqlDbType.Text);
//                        }
//                        //----------------

//                    }

//                }
//                //...........

//                //CONEXION MULTIPLE-----------------------------------
//                SqlConnection cnSql_BD;
//                //MySqlConnection cnMysql_BD;
//                ////OleDbConnection cnOledb;
//                //OdbcConnection cnOdbc_BD;

//                //INSERT REGISTRO......

//                if (index > 1)
//                {

//                    for (int i = 1; i < index; i++)
//                    {
//                        tmp_valorFila = "";

//                        //Columna--------------
//                        for (int j = 0; j < valorFila.GetLength(1); j++)
//                        {

//                            //-------------------------------------------------
//                            //Valores de TipoColumna permitido.
//                            //VarChar ->size
//                            //Char ->size
//                            //DateTime
//                            //Date
//                            //Time
//                            //Double
//                            //Bit
//                            //Int
//                            //Text
//                            string t_tipocolumna = dtcolumnas.Rows[j]["tipocolumna"].ToString();
//                            Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[j]["size"].ToString());
//                            string t_paramcolumna = "@" + dtcolumnas.Rows[j]["nomcolumna"].ToString();
//                            string t_valorFila = valorFila[i, j];

//                            if (t_tipocolumna == "VarChar")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlString.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Char")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlChars.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "DateTime")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlDateTime.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Date")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlDateTime.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Time")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlDateTime.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Double")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlDecimal.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Bit")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlBoolean.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Int")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlInt32.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Text")
//                            {
//                                command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = System.Data.SqlTypes.SqlString.Null;
//                                }
//                                else
//                                {
//                                    command_Sql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            //----------------



//                            if (j == 0)
//                            {
//                                tmp_valorFila = "[" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }
//                            else
//                            {
//                                tmp_valorFila = tmp_valorFila + ", [" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }

//                        }

//                        //.......
//                        query = @"INSERT INTO " + v_tabla + " (" + c_columnas + @" ) 
//                                    values (" + p_columnas + @" )";

//                        tmp_err = "Error.insert_RPE_archivoimport_SQL()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "] ";
//                        //------
//                        cnSql_BD = new SqlConnection();

//                        try
//                        {
//                            cnSql_BD = new SqlConnection(conexion);
//                            //Abriendo conexion...
//                            if (cnSql_BD.State != ConnectionState.Open)
//                                cnSql_BD.Open();

//                            try
//                            {
//                                command_Sql.Connection = cnSql_BD;
//                                command_Sql.CommandText = query;
//                                tran_Sql = command_Sql.Connection.BeginTransaction();
//                                command_Sql.Transaction = tran_Sql;
//                                command_Sql.ExecuteNonQuery();

//                                try
//                                {
//                                    //CORRECTO..........
//                                    tran_Sql.Commit();
//                                    result = true;
//                                    //.................
//                                }
//                                catch (Exception ex)
//                                {
//                                    result = false;
//                                    _err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
//                                    log.escribirLOG(tmp_err + " NO se ejecuto la sentencia. " + ex.ToString());
//                                    tran_Sql.Rollback();
//                                    break;
//                                }

//                            }
//                            catch (Exception ex)
//                            {
//                                tmp_err = "Error.insert_RPE_archivoimport_SQL(). Error en la sentencia. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                            "nomevento: " + nomevento + "\r\n" +
//                                            "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                              "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                             "codtabla: " + codtabla + "\r\n" +
//                                             "tipoconexion: " + tipoconexion + "\r\n" +
//                                             "codconexion: " + codconexionbd + "\r\n" +
//                                             "nomconexion: " + nomconexion + "\r\n" +
//                                             "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                             "]" + "[" + query + "] ";

//                                result = false;
//                                _err = tmp_err + ". " + ex.ToString();
//                                log.escribirLOG(tmp_err + ". " + ex.ToString());
//                                break;
//                            }
//                        }
//                        catch (Exception ex)
//                        {
//                            tmp_err = "Error.insert_RPE_archivoimport_SQL(). Error en la conexion. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "Conexion: [" + conexion + "] \r\n" +
//                                         "]";

//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            break;
//                        }





//                        //------

//                    }




//                }

//                //..................

//                //query = @"delete from " + tabla + @" where " + v_nomcolumna + " in ( " + v_columnaupdate_del + " )";

//                //tmp_err = "Error.delete_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                //                         "nomevento: " + nomevento + "\r\n" +
//                //                         "codimportarchivo: " + codimportarchivo + "\r\n" +
//                //                           "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                //                          "codtabla: " + codtabla + "\r\n" +
//                //                          "tipoconexion: " + tipoconexion + "\r\n" +
//                //                          "codconexion: " + codconexionbd + "\r\n" +
//                //                          "nomconexion: " + nomconexion + "\r\n" +
//                //                          "columnaupdate: " + v_nomcolumna + "\r\n" +
//                //                          "valorEliminacion: " + v_columnaupdate_del + "\r\n" +
//                //                          "]" + "[" + query + "]. ";

//                ////CONEXION MULTIPLE-----------------------------------
//                //SqlConnection cnSql_BD;
//                //MySqlConnection cnMysql_BD;
//                ////OleDbConnection cnOledb;
//                //OdbcConnection cnOdbc_BD;
//                //switch (tipoconexion)
//                //{
//                //    case "SQL":
//                //        cnSql_BD = new SqlConnection(conexion);
//                //        //Abriendo conexion...
//                //        if (cnSql_BD.State != ConnectionState.Open)
//                //            cnSql_BD.Open();
//                //        command_Sql.Connection = cnSql_BD;
//                //        command_Sql.CommandText = query;
//                //        tran_Sql = command_Sql.Connection.BeginTransaction();
//                //        command_Sql.Transaction = tran_Sql;
//                //        command_Sql.ExecuteNonQuery();

//                //        try
//                //        {
//                //            tran_Sql.Commit();
//                //            result = true;
//                //        }
//                //        catch (Exception ex)
//                //        {
//                //            result = false;
//                //            _err = tmp_err + ". " + ex.ToString();
//                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                //            tran_Sql.Rollback();
//                //        }

//                //        break;

//                //    case "MYSQL":
//                //        cnMysql_BD = new MySqlConnection(conexion);
//                //        //Abriendo conexion...
//                //        if (cnMysql_BD.State != ConnectionState.Open)
//                //            cnMysql_BD.Open();
//                //        command_mysql.Connection = cnMysql_BD;
//                //        command_mysql.CommandText = query;
//                //        tran_mysql = command_mysql.Connection.BeginTransaction();
//                //        command_mysql.Transaction = tran_mysql;
//                //        command_mysql.ExecuteNonQuery();

//                //        try
//                //        {
//                //            tran_mysql.Commit();
//                //            result = true;
//                //        }
//                //        catch (Exception ex)
//                //        {
//                //            result = false;
//                //            _err = tmp_err + ". " + ex.ToString();
//                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                //            tran_mysql.Rollback();
//                //        }

//                //        break;

//                //    case "ACCESS":
//                //        cnOdbc_BD = new OdbcConnection(conexion);
//                //        //Abriendo conexion...
//                //        if (cnOdbc_BD.State != ConnectionState.Open)
//                //            cnOdbc_BD.Open();
//                //        command_Odbc.Connection = cnOdbc_BD;
//                //        command_Odbc.CommandText = query;
//                //        tran_Odbc = command_Odbc.Connection.BeginTransaction();
//                //        command_Odbc.Transaction = tran_Odbc;
//                //        command_Odbc.ExecuteNonQuery();

//                //        try
//                //        {
//                //            tran_Odbc.Commit();
//                //            result = true;
//                //        }
//                //        catch (Exception ex)
//                //        {
//                //            result = false;
//                //            _err = tmp_err + ". " + ex.ToString();
//                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                //            tran_Odbc.Rollback();
//                //        }

//                //        break;

//                //    default:
//                //        cnOdbc_BD = new OdbcConnection(conexion);
//                //        //Abriendo conexion...
//                //        if (cnOdbc_BD.State != ConnectionState.Open)
//                //            cnOdbc_BD.Open();
//                //        command_Odbc.Connection = cnOdbc_BD;
//                //        command_Odbc.CommandText = query;
//                //        tran_Odbc = command_Odbc.Connection.BeginTransaction();
//                //        command_Odbc.Transaction = tran_Odbc;
//                //        command_Odbc.ExecuteNonQuery();

//                //        try
//                //        {
//                //            tran_Odbc.Commit();
//                //            result = true;
//                //        }
//                //        catch (Exception ex)
//                //        {
//                //            result = false;
//                //            _err = tmp_err + ". " + ex.ToString();
//                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                //            tran_Odbc.Rollback();
//                //        }


//                //        break;
//                //}
//                ////-------------------------------------------------------



//                //command.Parameters.Add("@codparam", MySqlDbType.Int64);
//                //command.Parameters.Add("@nomparam", MySqlDbType.VarChar, 50);
//                //command.Parameters.Add("@tipoparam", MySqlDbType.VarChar, 50);
//                //command.Parameters.Add("@size", MySqlDbType.Int32);
//                //command.Parameters.Add("@formato", MySqlDbType.VarChar, 50);
//                //command.Parameters.Add("@uso", MySqlDbType.VarChar, 50);
//                //command.Parameters.Add("@tipoio", MySqlDbType.VarChar, 50);
//                //command.Parameters.Add("@valor_salida", MySqlDbType.VarChar, 50);

//                //tran = command.Connection.BeginTransaction();
//                //command.Transaction = tran;

//                ////...................
//                //command.Parameters["@codparam"].Value = codparam;
//                //command.Parameters["@nomparam"].Value = nomparam;
//                //command.Parameters["@tipoparam"].Value = tipoparam;
//                //command.Parameters["@size"].Value = size;
//                ////command.Parameters["@formato"].Value = formato;
//                ////command.Parameters["@uso"].Value = uso;
//                //command.Parameters["@tipoio"].Value = tipoio;
//                ////command.Parameters["@valor_salida"].Value = valor_salida;
//                ////...................

//                //if (formato == "")
//                //{
//                //    command.Parameters["@formato"].Value = DBNull.Value;
//                //}
//                //else
//                //{
//                //    command.Parameters["@formato"].Value = formato;
//                //}

//                ////...................
//                //command.Parameters["@nomcolumna"].Value = nomcolumna;

//                //command.Parameters["@size"].Value = size;
//                ////command.Parameters["@formato"].Value = formato;
//                ////...................

//                //if (tipocolumna == "")
//                //{
//                //    command.Parameters["@tipocolumna"].Value = DBNull.Value;
//                //}
//                //else
//                //{
//                //    command.Parameters["@tipocolumna"].Value = tipocolumna;
//                //}

//                //if (formato == "")
//                //{
//                //    command.Parameters["@formato"].Value = DBNull.Value;
//                //}
//                //else
//                //{
//                //    command.Parameters["@formato"].Value = formato;
//                //}






//                //command.Connection.Open();






//            }
//            catch (Exception ex)
//            {
//                result = false;
//                _err = "Error.insert_RPE_archivoimport_SQL()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString();

//                log.escribirLOG("Error.insert_RPE_archivoimport_SQL()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString()
//                                         );



//            }
//            finally
//            {
//                //if (command.Connection != null)
//                //{
//                //    if (command.Connection.State == ConnectionState.Open)
//                //        command.Connection.Close();
//                //}
//            }

//            return result;
//        }

//        private bool insert_RPE_archivoimport_Mysql(Int64 index, String[,] valorFila, DataTable dtcolumnas, List<String> datosupdatecolum,
//Int64 codevento, string nomevento, Int64 codimportarchivo, string nomimportarchivo, Int64 codtipoconexion,
//   string tipoconexion, Int64 codconexionbd, string nomconexion, string conexion,
//       Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate)
//        {
//            bool result = false;

//            MySqlCommand command_Mysql = new MySqlCommand();
//            MySqlTransaction tran_Mysql = null;

//            //SqlCommand command_Sql = new SqlCommand();
//            //SqlTransaction tran_Sql = null;

//            //OdbcCommand command_Odbc = new OdbcCommand();
//            //OdbcTransaction tran_Odbc = null;

//            string query = "";
//            string tmp_err = "";

//            string tmp_valorFila = "";

//            string c_columnas = "";
//            string p_columnas = "";
//            string v_tabla = "";


//            try
//            {





//                c_columnas = "";
//                p_columnas = "";
//                v_tabla = dtcolumnas.Rows[colposicionupdate - 1]["nomtabla"].ToString();
//                //v_uso = dtcolumnas.Rows[colposicionupdate - 1]["uso"].ToString();
//                //v_nomcolumna = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
//                //v_tipocolumna = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
//                //v_size = dtcolumnas.Rows[colposicionupdate - 1]["size"].ToString();
//                //v_formato = dtcolumnas.Rows[colposicionupdate - 1]["formato"].ToString();


//                if (valorFila.GetLength(1) != dtcolumnas.Rows.Count)
//                {
//                    tmp_err = "Error.insert_RPE_archivoimport_mysql(). La configuracion de columnas del archivo y las columnas de la tabla deben coincidir" + "[codevento: " + codevento.ToString() + "\r\n" +
//                                         "nomevento: " + nomevento + "\r\n" +
//                                         "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                           "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                          "codtabla: " + codtabla + "\r\n" +
//                                          "tipoconexion: " + tipoconexion + "\r\n" +
//                                          "codconexion: " + codconexionbd + "\r\n" +
//                                          "nomconexion: " + nomconexion + "\r\n" +
//                                          "NumeroColumnaTabla: " + dtcolumnas.Rows.Count.ToString() + "\r\n" +
//                                          "NumeroColumnaArchivo: " + valorFila.GetLength(1).ToString() + "\r\n" +
//                                          "]. ";

//                    _err = tmp_err;
//                    log.escribirLOG(tmp_err);
//                    return false;
//                }

//                //Cargar Columnas Tabla.........
//                if (dtcolumnas.Rows.Count > 0)
//                {

//                    for (int i = 0; i < dtcolumnas.Rows.Count; i++)
//                    {

//                        if (i == 0)
//                        {
//                            c_columnas = "" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }
//                        else
//                        {
//                            c_columnas = c_columnas + ", " + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = p_columnas + ", " + "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }

//                        //-------------------------------------------------
//                        //Valores de TipoColumna permitido.
//                        //VarChar ->size
//                        //Char ->size
//                        //DateTime
//                        //Date
//                        //Time
//                        //Double
//                        //Bit
//                        //Int
//                        //Text
//                        string t_tipocolumna = dtcolumnas.Rows[i]["tipocolumna"].ToString();
//                        Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[i]["size"].ToString());
//                        string t_paramcolumna = "@" + dtcolumnas.Rows[i]["nomcolumna"].ToString();

//                        if (t_tipocolumna == "VarChar")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.VarChar, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Char")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.VarChar, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "DateTime")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.DateTime);
//                        }
//                        if (t_tipocolumna == "Date")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.DateTime);
//                        }
//                        if (t_tipocolumna == "Time")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Timestamp);
//                        }
//                        if (t_tipocolumna == "Double")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Decimal, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Bit")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Bit);
//                        }
//                        if (t_tipocolumna == "Int")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Int32);
//                        }
//                        if (t_tipocolumna == "Text")
//                        {
//                            command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Text);
//                        }
//                        //----------------

//                    }

//                }
//                //...........

//                //CONEXION MULTIPLE-----------------------------------
//                //SqlConnection cnSql_BD;
//                MySqlConnection cnMysql_BD;
//                ////OleDbConnection cnOledb;
//                //OdbcConnection cnOdbc_BD;

//                //INSERT REGISTRO......

//                if (index > 1)
//                {

//                    for (int i = 1; i < index; i++)
//                    {
//                        tmp_valorFila = "";

//                        //Columna--------------
//                        for (int j = 0; j < valorFila.GetLength(1); j++)
//                        {

//                            //-------------------------------------------------
//                            //Valores de TipoColumna permitido.
//                            //VarChar ->size
//                            //Char ->size
//                            //DateTime
//                            //Date
//                            //Time
//                            //Double
//                            //Bit
//                            //Int
//                            //Text
//                            string t_tipocolumna = dtcolumnas.Rows[j]["tipocolumna"].ToString();
//                            Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[j]["size"].ToString());
//                            string t_paramcolumna = "@" + dtcolumnas.Rows[j]["nomcolumna"].ToString();
//                            string t_valorFila = valorFila[i, j];

//                            if (t_tipocolumna == "VarChar")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }

//                            }
//                            if (t_tipocolumna == "Char")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "DateTime")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Date")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Time")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DateTime.Parse(t_valorFila.Trim()); ;
//                                }
//                            }
//                            if (t_tipocolumna == "Double")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = Convert.ToDecimal(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Bit")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = Convert.ToBoolean(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Int")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = Convert.ToInt64(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Text")
//                            {
//                                command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            //----------------

//                            //log.escribirLOG("command_Mysql:" + t_paramcolumna + ":tipo:"+  command_Mysql.Parameters[t_paramcolumna].MySqlDbType.ToString()+ ":"+
//                            //    command_Mysql.Parameters[t_paramcolumna].Value.ToString());

//                            if (j == 0)
//                            {
//                                tmp_valorFila = "[" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }
//                            else
//                            {
//                                tmp_valorFila = tmp_valorFila + ", [" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }

//                        }

//                        //.......
//                        query = @"INSERT INTO " + v_tabla + " (" + c_columnas + @" ) 
//                                    values (" + p_columnas + @" )";

//                        tmp_err = "Error.insert_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "] ";
//                        //------
//                        cnMysql_BD = new MySqlConnection();

//                        try
//                        {
//                            cnMysql_BD = new MySqlConnection(conexion);
//                            //Abriendo conexion...
//                            if (cnMysql_BD.State != ConnectionState.Open)
//                                cnMysql_BD.Open();

//                            try
//                            {
//                                command_Mysql.Connection = cnMysql_BD;
//                                command_Mysql.CommandText = query;
//                                tran_Mysql = command_Mysql.Connection.BeginTransaction();
//                                command_Mysql.Transaction = tran_Mysql;
//                                command_Mysql.ExecuteNonQuery();

//                                try
//                                {
//                                    //CORRECTO..........
//                                    tran_Mysql.Commit();
//                                    result = true;
//                                    //.................
//                                }
//                                catch (Exception ex)
//                                {
//                                    result = false;
//                                    _err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
//                                    log.escribirLOG(tmp_err + " NO se ejecuto la sentencia. " + ex.ToString());
//                                    tran_Mysql.Rollback();
//                                    break;
//                                }

//                            }
//                            catch (Exception ex)
//                            {
//                                tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la sentencia. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                            "nomevento: " + nomevento + "\r\n" +
//                                            "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                              "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                             "codtabla: " + codtabla + "\r\n" +
//                                             "tipoconexion: " + tipoconexion + "\r\n" +
//                                             "codconexion: " + codconexionbd + "\r\n" +
//                                             "nomconexion: " + nomconexion + "\r\n" +
//                                             "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                             "]" + "[" + query + "] ";

//                                result = false;
//                                _err = tmp_err + ". " + ex.ToString();
//                                log.escribirLOG(tmp_err + ". " + ex.ToString());
//                                break;
//                            }
//                        }
//                        catch (Exception ex)
//                        {
//                            tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la conexion. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "Conexion: [" + conexion + "] \r\n" +
//                                         "]";

//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            break;
//                        }





//                        //------

//                    }




//                }

//                //..................



//            }
//            catch (Exception ex)
//            {
//                result = false;
//                _err = "Error.insert_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString();

//                log.escribirLOG("Error.insert_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString()
//                                         );



//            }
//            finally
//            {
//                //if (command.Connection != null)
//                //{
//                //    if (command.Connection.State == ConnectionState.Open)
//                //        command.Connection.Close();
//                //}
//            }

//            return result;
//        }

//        private bool insert_RPE_archivoimport_OleDb(Int64 index, String[,] valorFila, DataTable dtcolumnas, List<String> datosupdatecolum,
//Int64 codevento, string nomevento, Int64 codimportarchivo, string nomimportarchivo, Int64 codtipoconexion,
//string tipoconexion, Int64 codconexionbd, string nomconexion, string conexion,
//Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate)
//        {
//            bool result = false;

//            //MySqlCommand command_Mysql = new MySqlCommand();
//            //MySqlTransaction tran_Mysql = null;

//            //SqlCommand command_Sql = new SqlCommand();
//            //SqlTransaction tran_Sql = null;

//            OleDbCommand command_OleDb = new OleDbCommand();
//            OleDbTransaction tran_OleDb = null;

//            //OdbcCommand command_Odbc = new OdbcCommand();
//            //OdbcTransaction tran_Odbc = null;

//            string query = "";
//            string tmp_err = "";

//            string tmp_valorFila = "";

//            string c_columnas = "";
//            string p_columnas = "";
//            string v_tabla = "";


//            try
//            {





//                c_columnas = "";
//                p_columnas = "";
//                v_tabla = dtcolumnas.Rows[colposicionupdate - 1]["nomtabla"].ToString();
//                //v_uso = dtcolumnas.Rows[colposicionupdate - 1]["uso"].ToString();
//                //v_nomcolumna = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
//                //v_tipocolumna = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
//                //v_size = dtcolumnas.Rows[colposicionupdate - 1]["size"].ToString();
//                //v_formato = dtcolumnas.Rows[colposicionupdate - 1]["formato"].ToString();


//                if (valorFila.GetLength(1) != dtcolumnas.Rows.Count)
//                {
//                    tmp_err = "Error.insert_RPE_archivoimport_OleDb(). La configuracion de columnas del archivo y las columnas de la tabla deben coincidir" + "[codevento: " + codevento.ToString() + "\r\n" +
//                                         "nomevento: " + nomevento + "\r\n" +
//                                         "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                           "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                          "codtabla: " + codtabla + "\r\n" +
//                                          "tipoconexion: " + tipoconexion + "\r\n" +
//                                          "codconexion: " + codconexionbd + "\r\n" +
//                                          "nomconexion: " + nomconexion + "\r\n" +
//                                          "NumeroColumnaTabla: " + dtcolumnas.Rows.Count.ToString() + "\r\n" +
//                                          "NumeroColumnaArchivo: " + valorFila.GetLength(1).ToString() + "\r\n" +
//                                          "]. ";

//                    _err = tmp_err;
//                    log.escribirLOG(tmp_err);
//                    return false;
//                }

//                //Cargar Columnas Tabla.........
//                if (dtcolumnas.Rows.Count > 0)
//                {

//                    for (int i = 0; i < dtcolumnas.Rows.Count; i++)
//                    {

//                        if (i == 0)
//                        {
//                            c_columnas = "" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }
//                        else
//                        {
//                            c_columnas = c_columnas + ", " + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = p_columnas + ", " + "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }

//                        //-------------------------------------------------
//                        //Valores de TipoColumna permitido.
//                        //VarChar ->size
//                        //Char ->size
//                        //DateTime
//                        //Date
//                        //Time
//                        //Double
//                        //Bit
//                        //Int
//                        //Text
//                        string t_tipocolumna = dtcolumnas.Rows[i]["tipocolumna"].ToString();
//                        Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[i]["size"].ToString());
//                        string t_paramcolumna = "@" + dtcolumnas.Rows[i]["nomcolumna"].ToString();

//                        if (t_tipocolumna == "VarChar")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.VarChar, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Char")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.Char, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "DateTime")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.DBTimeStamp);
//                        }
//                        if (t_tipocolumna == "Date")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.Date);
//                        }
//                        if (t_tipocolumna == "Time")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.DBTimeStamp);
//                        }
//                        if (t_tipocolumna == "Double")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.Decimal, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Bit")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.Boolean);
//                        }
//                        if (t_tipocolumna == "Int")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.Integer);
//                        }
//                        if (t_tipocolumna == "Text")
//                        {
//                            command_OleDb.Parameters.Add(t_paramcolumna, OleDbType.LongVarChar);
//                        }
//                        //----------------

//                    }

//                }
//                //...........

//                //CONEXION MULTIPLE-----------------------------------
//                //SqlConnection cnSql_BD;
//                //MySqlConnection cnMysql_BD;
//                OleDbConnection cnOleDb_BD;
//                //OdbcConnection cnOdbc_BD;

//                //INSERT REGISTRO......

//                if (index > 1)
//                {

//                    for (int i = 1; i < index; i++)
//                    {
//                        tmp_valorFila = "";

//                        //Columna--------------
//                        for (int j = 0; j < valorFila.GetLength(1); j++)
//                        {

//                            //-------------------------------------------------
//                            //Valores de TipoColumna permitido.
//                            //VarChar ->size
//                            //Char ->size
//                            //DateTime
//                            //Date
//                            //Time
//                            //Double
//                            //Bit
//                            //Int
//                            //Text
//                            string t_tipocolumna = dtcolumnas.Rows[j]["tipocolumna"].ToString();
//                            Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[j]["size"].ToString());
//                            string t_paramcolumna = "@" + dtcolumnas.Rows[j]["nomcolumna"].ToString();
//                            string t_valorFila = valorFila[i, j];
//                            log.escribirLOG("t_valorFila:" + j.ToString() + ": " + t_valorFila);
//                            if (t_tipocolumna == "VarChar")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }

//                            }
//                            if (t_tipocolumna == "Char")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "DateTime")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Date")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Time")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DateTime.Parse(t_valorFila.Trim()); ;
//                                }
//                            }
//                            if (t_tipocolumna == "Double")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = Convert.ToDecimal(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Bit")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = Convert.ToBoolean(Convert.ToInt32(t_valorFila));
//                                }
//                            }
//                            if (t_tipocolumna == "Int")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = Convert.ToInt64(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Text")
//                            {
//                                command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_OleDb.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            //----------------

//                            //log.escribirLOG("command_Mysql:" + t_paramcolumna + ":tipo:"+  command_Mysql.Parameters[t_paramcolumna].MySqlDbType.ToString()+ ":"+
//                            //    command_Mysql.Parameters[t_paramcolumna].Value.ToString());

//                            if (j == 0)
//                            {
//                                tmp_valorFila = "[" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }
//                            else
//                            {
//                                tmp_valorFila = tmp_valorFila + ", [" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }

//                        }

//                        //.......
//                        query = @"INSERT INTO " + v_tabla + " (" + c_columnas + @" ) 
//                                    values (" + p_columnas + @" )";

//                        tmp_err = "Error.insert_RPE_archivoimport_OleDb()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "tabla: " + codtabla.ToString() + " - " + tabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "] ";
//                        //------
//                        cnOleDb_BD = new OleDbConnection();

//                        try
//                        {
//                            cnOleDb_BD = new OleDbConnection(conexion);
//                            //Abriendo conexion...
//                            if (cnOleDb_BD.State != ConnectionState.Open)
//                                cnOleDb_BD.Open();

//                            try
//                            {
//                                command_OleDb.Connection = cnOleDb_BD;
//                                command_OleDb.CommandText = query;
//                                tran_OleDb = command_OleDb.Connection.BeginTransaction();
//                                command_OleDb.Transaction = tran_OleDb;
//                                command_OleDb.ExecuteNonQuery();

//                                try
//                                {
//                                    //CORRECTO..........
//                                    tran_OleDb.Commit();
//                                    result = true;
//                                    //.................
//                                }
//                                catch (Exception ex)
//                                {
//                                    result = false;
//                                    _err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
//                                    log.escribirLOG(tmp_err + " NO se ejecuto la sentencia. " + ex.ToString());
//                                    tran_OleDb.Rollback();
//                                    break;
//                                }

//                            }
//                            catch (Exception ex)
//                            {
//                                tmp_err = "Error.insert_RPE_archivoimport_OleDb(). Error en la sentencia. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                            "nomevento: " + nomevento + "\r\n" +
//                                            "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                              "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                             "tabla: " + codtabla.ToString() + " - " + tabla + "\r\n" +
//                                             "tipoconexion: " + tipoconexion + "\r\n" +
//                                             "codconexion: " + codconexionbd + "\r\n" +
//                                             "nomconexion: " + nomconexion + "\r\n" +
//                                             "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                             "]" + "[" + query + "] ";

//                                result = false;
//                                _err = tmp_err + ". " + ex.ToString();
//                                log.escribirLOG(tmp_err + ". " + ex.ToString());
//                                break;
//                            }
//                        }
//                        catch (Exception ex)
//                        {
//                            tmp_err = "Error.insert_RPE_archivoimport_OleDb(). Error en la conexion. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "tabla: " + codtabla.ToString() + " - " + tabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "Conexion: [" + conexion + "] \r\n" +
//                                         "]";

//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            break;
//                        }





//                        //------

//                    }




//                }

//                //..................



//            }
//            catch (Exception ex)
//            {
//                result = false;
//                _err = "Error.insert_RPE_archivoimport_OleDb()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "tabla: " + codtabla.ToString() + " - " + tabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString();

//                log.escribirLOG("Error.insert_RPE_archivoimport_OleDb()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "tabla: " + codtabla.ToString() + " - " + tabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString()
//                                         );



//            }
//            finally
//            {
//                //if (command.Connection != null)
//                //{
//                //    if (command.Connection.State == ConnectionState.Open)
//                //        command.Connection.Close();
//                //}
//            }

//            return result;
//        }

//        private bool insert_RPE_archivoimport_Odbc(Int64 index, String[,] valorFila, DataTable dtcolumnas, List<String> datosupdatecolum,
//Int64 codevento, string nomevento, Int64 codimportarchivo, string nomimportarchivo, Int64 codtipoconexion,
//string tipoconexion, Int64 codconexionbd, string nomconexion, string conexion,
//Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate)
//        {
//            bool result = false;

//            //MySqlCommand command_Mysql = new MySqlCommand();
//            //MySqlTransaction tran_Mysql = null;

//            //SqlCommand command_Sql = new SqlCommand();
//            //SqlTransaction tran_Sql = null;

//            OdbcCommand command_Odbc = new OdbcCommand();
//            OdbcTransaction tran_Odbc = null;

//            string query = "";
//            string tmp_err = "";

//            string tmp_valorFila = "";

//            string c_columnas = "";
//            string p_columnas = "";
//            string v_tabla = "";


//            try
//            {





//                c_columnas = "";
//                p_columnas = "";
//                v_tabla = dtcolumnas.Rows[colposicionupdate - 1]["nomtabla"].ToString();
//                //v_uso = dtcolumnas.Rows[colposicionupdate - 1]["uso"].ToString();
//                //v_nomcolumna = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
//                //v_tipocolumna = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
//                //v_size = dtcolumnas.Rows[colposicionupdate - 1]["size"].ToString();
//                //v_formato = dtcolumnas.Rows[colposicionupdate - 1]["formato"].ToString();


//                if (valorFila.GetLength(1) != dtcolumnas.Rows.Count)
//                {
//                    tmp_err = "Error.insert_RPE_archivoimport_Odbc(). La configuracion de columnas del archivo y las columnas de la tabla deben coincidir" + "[codevento: " + codevento.ToString() + "\r\n" +
//                                         "nomevento: " + nomevento + "\r\n" +
//                                         "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                           "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                          "codtabla: " + codtabla + "\r\n" +
//                                          "tipoconexion: " + tipoconexion + "\r\n" +
//                                          "codconexion: " + codconexionbd + "\r\n" +
//                                          "nomconexion: " + nomconexion + "\r\n" +
//                                          "NumeroColumnaTabla: " + dtcolumnas.Rows.Count.ToString() + "\r\n" +
//                                          "NumeroColumnaArchivo: " + valorFila.GetLength(1).ToString() + "\r\n" +
//                                          "]. ";

//                    _err = tmp_err;
//                    log.escribirLOG(tmp_err);
//                    return false;
//                }

//                //Cargar Columnas Tabla.........
//                if (dtcolumnas.Rows.Count > 0)
//                {

//                    for (int i = 0; i < dtcolumnas.Rows.Count; i++)
//                    {

//                        if (i == 0)
//                        {
//                            c_columnas = "" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }
//                        else
//                        {
//                            c_columnas = c_columnas + ", " + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre columna
//                            p_columnas = p_columnas + ", " + "@" + dtcolumnas.Rows[i]["nomcolumna"] + ""; //nombre parametro columna
//                        }

//                        //-------------------------------------------------
//                        //Valores de TipoColumna permitido.
//                        //VarChar ->size
//                        //Char ->size
//                        //DateTime
//                        //Date
//                        //Time
//                        //Double
//                        //Bit
//                        //Int
//                        //Text
//                        string t_tipocolumna = dtcolumnas.Rows[i]["tipocolumna"].ToString();
//                        Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[i]["size"].ToString());
//                        string t_paramcolumna = "@" + dtcolumnas.Rows[i]["nomcolumna"].ToString();

//                        if (t_tipocolumna == "VarChar")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.VarChar, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Char")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.Char, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "DateTime")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.Time);
//                        }
//                        if (t_tipocolumna == "Date")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.DateTime);
//                            //command_Odbc.Parameters.Add(t_paramcolumna);
//                        }
//                        if (t_tipocolumna == "Time")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.DateTime);
//                            //command_Odbc.Parameters.Add(t_paramcolumna);
//                        }
//                        if (t_tipocolumna == "Double")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.Decimal, t_sizecolumna);
//                        }
//                        if (t_tipocolumna == "Bit")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.Bit);
//                        }
//                        if (t_tipocolumna == "Int")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.Int);
//                        }
//                        if (t_tipocolumna == "Text")
//                        {
//                            command_Odbc.Parameters.Add(t_paramcolumna, OdbcType.Text);
//                        }
//                        //----------------

//                    }

//                }
//                //...........

//                //CONEXION MULTIPLE-----------------------------------
//                //SqlConnection cnSql_BD;
//                //MySqlConnection cnMysql_BD;
//                ////OleDbConnection cnOledb;
//                OdbcConnection cnOdbc_BD;

//                //INSERT REGISTRO......

//                if (index > 1)
//                {

//                    for (int i = 1; i < index; i++)
//                    {
//                        tmp_valorFila = "";

//                        //Columna--------------
//                        for (int j = 0; j < valorFila.GetLength(1); j++)
//                        {

//                            //-------------------------------------------------
//                            //Valores de TipoColumna permitido.
//                            //VarChar ->size
//                            //Char ->size
//                            //DateTime
//                            //Date
//                            //Time
//                            //Double
//                            //Bit
//                            //Int
//                            //Text
//                            string t_tipocolumna = dtcolumnas.Rows[j]["tipocolumna"].ToString();
//                            Int32 t_sizecolumna = Convert.ToInt32(dtcolumnas.Rows[j]["size"].ToString());
//                            string t_paramcolumna = "@" + dtcolumnas.Rows[j]["nomcolumna"].ToString();
//                            string t_valorFila = valorFila[i, j];

//                            if (t_tipocolumna == "VarChar")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }

//                            }
//                            if (t_tipocolumna == "Char")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "DateTime")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            if (t_tipocolumna == "Date")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    //command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DateTime.Parse(t_valorFila.Trim());
//                                }
//                            }
//                            if (t_tipocolumna == "Time")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DateTime.Parse(t_valorFila.Trim());
//                                }
//                            }
//                            if (t_tipocolumna == "Double")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = Decimal.Parse(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Bit")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = Convert.ToBoolean(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Int")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = Convert.ToInt32(t_valorFila);
//                                }
//                            }
//                            if (t_tipocolumna == "Text")
//                            {
//                                command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                //...................
//                                if (t_valorFila == "")
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = DBNull.Value;
//                                }
//                                else
//                                {
//                                    command_Odbc.Parameters[t_paramcolumna].Value = t_valorFila;
//                                }
//                            }
//                            //----------------

//                            //log.escribirLOG("command_Odbc:" + t_paramcolumna + ":tipo:" + command_Odbc.Parameters[t_paramcolumna].OdbcType.ToString() + ":" +
//                            //    command_Odbc.Parameters[t_paramcolumna].Value.ToString());

//                            if (j == 0)
//                            {
//                                tmp_valorFila = "[" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }
//                            else
//                            {
//                                tmp_valorFila = tmp_valorFila + ", [" + t_valorFila + "]"; //valor de La filaxColumna.
//                            }

//                        }

//                        //.......
//                        query = @"INSERT INTO " + v_tabla + " (" + c_columnas + @" ) 
//                                    values (" + p_columnas + @" )";

//                        tmp_err = "Error.insert_RPE_archivoimport_Odbc()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "] ";
//                        //------
//                        cnOdbc_BD = new OdbcConnection();

//                        try
//                        {
//                            cnOdbc_BD = new OdbcConnection(conexion);
//                            //Abriendo conexion...
//                            if (cnOdbc_BD.State != ConnectionState.Open)
//                                cnOdbc_BD.Open();

//                            try
//                            {
//                                command_Odbc.Connection = cnOdbc_BD;
//                                command_Odbc.CommandText = query;
//                                tran_Odbc = command_Odbc.Connection.BeginTransaction();
//                                command_Odbc.Transaction = tran_Odbc;
//                                command_Odbc.ExecuteNonQuery();

//                                try
//                                {
//                                    //CORRECTO..........
//                                    tran_Odbc.Commit();
//                                    result = true;
//                                    //.................
//                                }
//                                catch (Exception ex)
//                                {
//                                    result = false;
//                                    _err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
//                                    log.escribirLOG(tmp_err + " NO se ejecuto la sentencia. " + ex.ToString());
//                                    tran_Odbc.Rollback();
//                                    break;
//                                }

//                            }
//                            catch (Exception ex)
//                            {
//                                tmp_err = "Error.insert_RPE_archivoimport_Odbc(). Error en la sentencia. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                            "nomevento: " + nomevento + "\r\n" +
//                                            "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                              "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                             "codtabla: " + codtabla + "\r\n" +
//                                             "tipoconexion: " + tipoconexion + "\r\n" +
//                                             "codconexion: " + codconexionbd + "\r\n" +
//                                             "nomconexion: " + nomconexion + "\r\n" +
//                                             "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                             "]" + "[" + query + "] ";

//                                result = false;
//                                _err = tmp_err + ". " + ex.ToString();
//                                log.escribirLOG(tmp_err + ". " + ex.ToString());
//                                break;
//                            }
//                        }
//                        catch (Exception ex)
//                        {
//                            tmp_err = "Error.insert_RPE_archivoimport_Odbc(). Error en la conexion. " + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "Conexion: [" + conexion + "] \r\n" +
//                                         "]";

//                            result = false;
//                            _err = tmp_err + ". " + ex.ToString();
//                            log.escribirLOG(tmp_err + ". " + ex.ToString());
//                            break;
//                        }





//                        //------

//                    }




//                }

//                //..................



//            }
//            catch (Exception ex)
//            {
//                result = false;
//                _err = "Error.insert_RPE_archivoimport_Odbc()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString();

//                log.escribirLOG("Error.insert_RPE_archivoimport_Odbc()." + "[codevento: " + codevento.ToString() + "\r\n" +
//                                        "nomevento: " + nomevento + "\r\n" +
//                                        "codimportarchivo: " + codimportarchivo + "\r\n" +
//                                          "nomimportarchivo: " + nomimportarchivo + "\r\n" +
//                                         "codtabla: " + codtabla + "\r\n" +
//                                         "tipoconexion: " + tipoconexion + "\r\n" +
//                                         "codconexion: " + codconexionbd + "\r\n" +
//                                         "nomconexion: " + nomconexion + "\r\n" +
//                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
//                                         "]" + "[" + query + "]. " +
//                                         ex.ToString()
//                                         );



//            }
//            finally
//            {
//                //if (command.Connection != null)
//                //{
//                //    if (command.Connection.State == ConnectionState.Open)
//                //        command.Connection.Close();
//                //}
//            }

//            return result;
//        }

//        public bool insert_RPE_archivoimport(Int64 index, String[,] valorFila, DataTable dtcolumnas, List<String> datosupdatecolum,
//Int64 codevento, string nomevento, Int64 codimportarchivo, string nomimportarchivo, Int64 codtipoconexion,
//string tipoconexion, Int64 codconexionbd, string nomconexion, string conexion,
//Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate)
//        {

//            bool result = false;
//            //string tmp_err = "";
//            //_err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();

//            switch (tipoconexion)
//            {
//                case "SQL":
//                    result = insert_RPE_archivoimport_SQL(index, valorFila, dtcolumnas, datosupdatecolum, codevento, nomevento,
//                                     codimportarchivo, nomimportarchivo, codtipoconexion, tipoconexion, codconexionbd, nomconexion, conexion, codtabla,
//                                     tabla, cantcolumnas, colposicionupdate);
//                    break;

//                case "MYSQL":
//                    result = insert_RPE_archivoimport_Mysql(index, valorFila, dtcolumnas, datosupdatecolum, codevento, nomevento,
//                                 codimportarchivo, nomimportarchivo, codtipoconexion, tipoconexion, codconexionbd, nomconexion, conexion, codtabla,
//                                 tabla, cantcolumnas, colposicionupdate);
//                    break;

//                case "ACCESS":
//                    result = insert_RPE_archivoimport_OleDb(index, valorFila, dtcolumnas, datosupdatecolum, codevento, nomevento,
//                                  codimportarchivo, nomimportarchivo, codtipoconexion, tipoconexion, codconexionbd, nomconexion, conexion, codtabla,
//                                  tabla, cantcolumnas, colposicionupdate);
//                    break;

//                //case "ORACLE":
//                //    result = insert_RPE_archivoimport_Odbc(index, valorFila, dtcolumnas, datosupdatecolum, codevento, nomevento,
//                //                  codimportarchivo, nomimportarchivo, codtipoconexion, tipoconexion, codconexionbd, nomconexion, conexion, codtabla,
//                //                  tabla, cantcolumnas, colposicionupdate);
//                //    break;

//                default:
//                    result = insert_RPE_archivoimport_Odbc(index, valorFila, dtcolumnas, datosupdatecolum, codevento, nomevento,
//                                    codimportarchivo, nomimportarchivo, codtipoconexion, tipoconexion, codconexionbd, nomconexion, conexion, codtabla,
//                                    tabla, cantcolumnas, colposicionupdate);
//                    break;
//            }


//            return result;

//        }

        public string delete_archivoimport_antes(MySqlConnection cnMysql_BD, Int64 codtabla, string archivo, string nomtabla, string modoactualizacion,
            int colposicionupdate, int colposicionupdate1, int colposicionupdate2, int colposicionupdate3,
            int colposicionupdate4, int colposicionupdate5, int colposicionupdate6, int colposicionupdate7,
            DataTable dtcolumnas, List<String> v_columnaxFila, List<String> v_valorxFila )
        {
            string result = "0";

            MySqlCommand command_mysql = new MySqlCommand();
            MySqlTransaction tran_mysql = null;

            //SqlCommand command_Sql = new SqlCommand();
            //SqlTransaction tran_Sql = null;

            //OleDbCommand command_OleDb = new OleDbCommand();
            //OleDbTransaction tran_OleDb = null;

            //OdbcCommand command_Odbc = new OdbcCommand();
            //OdbcTransaction tran_Odbc = null;

            string query = "";
            string tmp_err = "";
            //string rutaorigen, string archivoorigen, Int64 codevento, string nomevento,  
            //    Int64 codimportarchivo,string nomimportarchivo,  Int64 codtipoconexion, 
            //string tipoconexion, Int64 codconexionbd, string nomconexion,  string conexion, 
            //    Int64 codtabla, string tabla, Int32 cantcolumnas, Int32 colposicionupdate, 
            //string rangoexcel

            //string v_columnaupdate_del = "";
            string v_tabla = "";
            //string v_uso = "";
            //string v_nomcolumna = "";
            //string v_tipocolumna = "";
            //string v_size = "";
            //string v_formato = "";

            try
            {





                //v_columnaupdate_del = "";
                v_tabla = nomtabla;
                //v_uso = dtcolumnas.Rows[colposicionupdate - 1]["uso"].ToString();
                //v_nomcolumna = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
                //v_tipocolumna = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
                //v_size = dtcolumnas.Rows[colposicionupdate - 1]["size"].ToString();
                //v_formato = dtcolumnas.Rows[colposicionupdate - 1]["formato"].ToString();

                string t_colupdate = "";
                //string t_colupdate_param = "";
                //string t_colupdate_size = "";
                string t_colupdate_valor = "";
                string t_colupdate_tipo = "";

                string t_colupdate1 = "";
                //string t_colupdate1_param = "";
                //string t_colupdate1_size = "";
                string t_colupdate1_valor = "";
                string t_colupdate1_tipo = "";

                string t_colupdate2 = "";
                //string t_colupdate2_param = "";
                //string t_colupdate2_size = "";
                string t_colupdate2_valor = "";
                string t_colupdate2_tipo = "";

                string t_colupdate3 = "";
                //string t_colupdate3_param = "";
                //string t_colupdate3_size = "";
                string t_colupdate3_valor = "";
                string t_colupdate3_tipo = "";

                string t_colupdate4 = "";
                //string t_colupdate4_param = "";
                //string t_colupdate4_size = "";
                string t_colupdate4_valor = "";
                string t_colupdate4_tipo = "";

                string t_colupdate5 = "";
                //string t_colupdate5_param = "";
                //string t_colupdate5_size = "";
                string t_colupdate5_valor = "";
                string t_colupdate5_tipo = "";

                string t_colupdate6 = "";
                //string t_colupdate6_param = "";
                //string t_colupdate6_size = "";
                string t_colupdate6_valor = "";
                string t_colupdate6_tipo = "";

                string t_colupdate7 = "";
                //string t_colupdate7_param = "";
                //string t_colupdate7_size = "";
                string t_colupdate7_valor = "";
                string t_colupdate7_tipo = "";

                if (colposicionupdate > 0)
                {
                    t_colupdate = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
                    t_colupdate_tipo = dtcolumnas.Rows[colposicionupdate - 1]["tipocolumna"].ToString();
                    //t_colupdate_size = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();
                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    

                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {                        
                            tmp_valor = "'" + v_valorxFila[t_index] + "'";                        
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate_valor = tmp_valor;

                }
                if (colposicionupdate1 > 0)
                {
                    t_colupdate1 = dtcolumnas.Rows[colposicionupdate1 - 1]["nomcolumna"].ToString();
                    t_colupdate1_tipo = dtcolumnas.Rows[colposicionupdate1 - 1]["tipocolumna"].ToString();
                    //t_colupdate_size = dtcolumnas.Rows[colposicionupdate - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate1;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate1_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate1_valor = tmp_valor;
                }
                if (colposicionupdate2 > 0)
                {
                    t_colupdate2 = dtcolumnas.Rows[colposicionupdate2 - 1]["nomcolumna"].ToString();
                    t_colupdate2_tipo = dtcolumnas.Rows[colposicionupdate2 - 1]["tipocolumna"].ToString();
                    //t_colupdate2_size = dtcolumnas.Rows[colposicionupdate2 - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate2;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    t_colupdate2_valor = v_valorxFila[t_index];
                }
                if (colposicionupdate3 > 0)
                {
                    t_colupdate3 = dtcolumnas.Rows[colposicionupdate3 - 1]["nomcolumna"].ToString();
                    t_colupdate3_tipo = dtcolumnas.Rows[colposicionupdate3 - 1]["tipocolumna"].ToString();
                    //t_colupdate3_size = dtcolumnas.Rows[colposicionupdate3 - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate3;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate3_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate3_valor = tmp_valor;

                }
                if (colposicionupdate4 > 0)
                {
                    t_colupdate4 = dtcolumnas.Rows[colposicionupdate4 - 1]["nomcolumna"].ToString();
                    t_colupdate4_tipo = dtcolumnas.Rows[colposicionupdate4 - 1]["tipocolumna"].ToString();
                    //t_colupdate4_size = dtcolumnas.Rows[colposicionupdate4 - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate4;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate4_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate4_valor = tmp_valor;
                }
                if (colposicionupdate5 > 0)
                {
                    t_colupdate5 = dtcolumnas.Rows[colposicionupdate5 - 1]["nomcolumna"].ToString();
                    t_colupdate5_tipo = dtcolumnas.Rows[colposicionupdate5 - 1]["tipocolumna"].ToString();
                    //t_colupdate5_size = dtcolumnas.Rows[colposicionupdate5 - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate5;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate5_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate5_valor = tmp_valor;
                }
                if (colposicionupdate6 > 0)
                {
                    t_colupdate6 = dtcolumnas.Rows[colposicionupdate6 - 1]["nomcolumna"].ToString();
                    t_colupdate6_tipo = dtcolumnas.Rows[colposicionupdate6 - 1]["tipocolumna"].ToString();
                    //t_colupdate6_size = dtcolumnas.Rows[colposicionupdate6 - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate6;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate6_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate6_valor = tmp_valor;

                }
                if (colposicionupdate7 > 0)
                {
                    t_colupdate7 = dtcolumnas.Rows[colposicionupdate7 - 1]["nomcolumna"].ToString();
                    t_colupdate7_tipo = dtcolumnas.Rows[colposicionupdate7 - 1]["tipocolumna"].ToString();
                    //t_colupdate7_size = dtcolumnas.Rows[colposicionupdate7 - 1]["nomcolumna"].ToString();

                    //--------------------
                    int t_index = 0;
                    bool t_existecolum = false;
                    string tmp_col = t_colupdate7;
                    for (int k = 0; k < v_columnaxFila.Count; k++)
                    {
                        if (v_columnaxFila[k] == tmp_col)
                        {
                            t_index = k;
                            t_existecolum = true;
                        }
                    }
                    if (!t_existecolum)
                    {
                        tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
                                     "codtabla: " + codtabla + "\r\n" +
                                     //"tipoconexion: " + tipoconexion + "\r\n" +
                                     //"codconexion: " + codconexionbd + "\r\n" +
                                     //"nomconexion: " + nomconexion + "\r\n" +
                                      "] ";

                        result = tmp_err;
                        _err = tmp_err;
                        log.escribirLOG(tmp_err);

                        return result;
                    }
                    //---------------------
                    string tmp_valor = v_valorxFila[t_index];
                    string tmp_tipocolumna = t_colupdate7_tipo;

                    if (tmp_tipocolumna == "VarChar")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Char")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "DateTime")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Date")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Time")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    if (tmp_tipocolumna == "Double")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Bit")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Int")
                    {
                        tmp_valor = v_valorxFila[t_index];
                    }
                    if (tmp_tipocolumna == "Text")
                    {
                        tmp_valor = "'" + v_valorxFila[t_index] + "'";
                    }
                    //----------------
                    t_colupdate7_valor = tmp_valor;

                }

                string tmp_where = "";
                if (colposicionupdate > 0 && colposicionupdate1 <= 0 && colposicionupdate2 <= 0
                    && colposicionupdate3 <= 0 && colposicionupdate4 <= 0 && colposicionupdate5 <= 0
                    && colposicionupdate6 <= 0 && colposicionupdate7 <= 0) {

                        tmp_where = t_colupdate + " = " + t_colupdate_valor; 
                    

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 <= 0
                    && colposicionupdate3 <= 0 && colposicionupdate4 <= 0 && colposicionupdate5 <= 0
                    && colposicionupdate6 <= 0 && colposicionupdate7 <= 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and " +
                                t_colupdate1 + " = " + t_colupdate1_valor;

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 > 0
                    && colposicionupdate3 <= 0 && colposicionupdate4 <= 0 && colposicionupdate5 <= 0
                    && colposicionupdate6 <= 0 && colposicionupdate7 <= 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and  " +
                                t_colupdate1 + " = " + t_colupdate1_valor + " and " +
                                t_colupdate2 + " = " + t_colupdate2_valor;

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 > 0
                    && colposicionupdate3 > 0 && colposicionupdate4 <= 0 && colposicionupdate5 <= 0
                    && colposicionupdate6 <= 0 && colposicionupdate7 <= 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and " +
                                t_colupdate1 + " = " + t_colupdate1_valor + " and " +
                                t_colupdate2 + " = " + t_colupdate2_valor + " and " +
                                t_colupdate3 + " = " + t_colupdate3_valor;

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 > 0
                    && colposicionupdate3 > 0 && colposicionupdate4 > 0 && colposicionupdate5 <= 0
                    && colposicionupdate6 <= 0 && colposicionupdate7 <= 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and " +
                                t_colupdate1 + " = " + t_colupdate1_valor + " and " +
                                t_colupdate2 + " = " + t_colupdate2_valor + " and " +
                                t_colupdate3 + " = " + t_colupdate3_valor + " and " +
                                t_colupdate4 + " = " + t_colupdate4_valor;

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 > 0
                    && colposicionupdate3 > 0 && colposicionupdate4 > 0 && colposicionupdate5 > 0
                    && colposicionupdate6 <= 0 && colposicionupdate7 <= 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and " +
                                t_colupdate1 + " = " + t_colupdate1_valor + " and " +
                                t_colupdate2 + " = " + t_colupdate2_valor + " and " +
                                t_colupdate3 + " = " + t_colupdate3_valor + " and " +
                                t_colupdate4 + " = " + t_colupdate4_valor + " and " +
                                t_colupdate5 + " = " + t_colupdate5_valor;

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 > 0
                    && colposicionupdate3 > 0 && colposicionupdate4 > 0 && colposicionupdate5 > 0
                    && colposicionupdate6 > 0 && colposicionupdate7 <= 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and " +
                                t_colupdate1 + " = " + t_colupdate1_valor + " and " +
                                t_colupdate2 + " = " + t_colupdate2_valor + " and " +
                                t_colupdate3 + " = " + t_colupdate3_valor + " and " +
                                t_colupdate4 + " = " + t_colupdate4_valor + " and " +
                                t_colupdate5 + " = " + t_colupdate5_valor + " and " +
                                t_colupdate6 + " = " + t_colupdate6_valor;

                }
                if (colposicionupdate > 0 && colposicionupdate1 > 0 && colposicionupdate2 > 0
                    && colposicionupdate3 > 0 && colposicionupdate4 > 0 && colposicionupdate5 > 0
                    && colposicionupdate6 > 0 && colposicionupdate7 > 0)
                {

                    tmp_where = t_colupdate + " = " + t_colupdate_valor + " and " +
                                t_colupdate1 + " = " + t_colupdate1_valor + " and " +
                                t_colupdate2 + " = " + t_colupdate2_valor + " and " +
                                t_colupdate3 + " = " + t_colupdate3_valor + " and " +
                                t_colupdate4 + " = " + t_colupdate4_valor + " and " +
                                t_colupdate5 + " = " + t_colupdate5_valor + " and " +
                                t_colupdate6 + " = " + t_colupdate6_valor + " and " +
                                t_colupdate7 + " = " + t_colupdate7_valor;

                }

                

              
                //..................

                query = @"delete from " + v_tabla + @" where archivo='" + archivo + "' and " + tmp_where;

                tmp_err = "Error.delete_archivoimport()." + "[" +
                                          "codtabla: " + codtabla + "\r\n" +
                                          //"tipoconexion: " + tipoconexion + "\r\n" +
                                          //"codconexion: " + codconexionbd + "\r\n" +
                                          //"nomconexion: " + nomconexion + "\r\n" +
                                          "]" + "[" + query + "]. ";
                //CONEXION MULTIPLE-----------------------------------
                //SqlConnection cnSql_BD;
                //MySqlConnection cnMysql_BD;
                //OleDbConnection cnOleDb_BD;
                //OdbcConnection cnOdbc_BD;

                //cnMysql_BD = new MySqlConnection(conexion);
                //Abriendo conexion...
                if (cnMysql_BD.State != ConnectionState.Open)
                    cnMysql_BD.Open();
                command_mysql.Connection = cnMysql_BD;
                command_mysql.CommandText = query;
                tran_mysql = command_mysql.Connection.BeginTransaction();
                command_mysql.Transaction = tran_mysql;
                command_mysql.ExecuteNonQuery();

                try
                {
                    tran_mysql.Commit();
                    result = "1";
                }
                catch (Exception ex)
                {
                    result = tmp_err + ". " + ex.ToString();
                    _err = tmp_err + ". " + ex.ToString();
                    log.escribirLOG(tmp_err + ". " + ex.ToString());
                    tran_mysql.Rollback();
                }

                //switch (tipoconexion)
                //{
                //    case "SQL":
                //        cnSql_BD = new SqlConnection(conexion);
                //        //Abriendo conexion...
                //        if (cnSql_BD.State != ConnectionState.Open)
                //            cnSql_BD.Open();
                //        command_Sql.Connection = cnSql_BD;
                //        command_Sql.CommandText = query;
                //        tran_Sql = command_Sql.Connection.BeginTransaction();
                //        command_Sql.Transaction = tran_Sql;
                //        command_Sql.ExecuteNonQuery();

                //        try
                //        {
                //            tran_Sql.Commit();
                //            result = "1";
                //        }
                //        catch (Exception ex)
                //        {
                //            result = tmp_err + ". " + ex.ToString();
                //            _err = tmp_err + ". " + ex.ToString();
                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
                //            tran_Sql.Rollback();
                //        }

                //        break;

                //    case "MYSQL":
                //        cnMysql_BD = new MySqlConnection(conexion);
                //        //Abriendo conexion...
                //        if (cnMysql_BD.State != ConnectionState.Open)
                //            cnMysql_BD.Open();
                //        command_mysql.Connection = cnMysql_BD;
                //        command_mysql.CommandText = query;
                //        tran_mysql = command_mysql.Connection.BeginTransaction();
                //        command_mysql.Transaction = tran_mysql;
                //        command_mysql.ExecuteNonQuery();

                //        try
                //        {
                //            tran_mysql.Commit();
                //            result = "1";
                //        }
                //        catch (Exception ex)
                //        {
                //            result = tmp_err + ". " + ex.ToString();
                //            _err = tmp_err + ". " + ex.ToString();
                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
                //            tran_mysql.Rollback();
                //        }

                //        break;

                //    case "ACCESS":
                //        cnOleDb_BD = new OleDbConnection(conexion);
                //        //Abriendo conexion...
                //        if (cnOleDb_BD.State != ConnectionState.Open)
                //            cnOleDb_BD.Open();
                //        command_OleDb.Connection = cnOleDb_BD;
                //        command_OleDb.CommandText = query;
                //        tran_OleDb = command_OleDb.Connection.BeginTransaction();
                //        command_OleDb.Transaction = tran_OleDb;
                //        command_OleDb.ExecuteNonQuery();

                //        try
                //        {
                //            tran_OleDb.Commit();
                //            result = "1";
                //        }
                //        catch (Exception ex)
                //        {
                //            result = tmp_err + ". " + ex.ToString();
                //            _err = tmp_err + ". " + ex.ToString();
                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
                //            tran_OleDb.Rollback();
                //        }

                //        break;

                //    //case "ORACLE":
                //    //    cnOdbc_BD = new OdbcConnection(conexion);
                //    //    //Abriendo conexion...
                //    //    if (cnOdbc_BD.State != ConnectionState.Open)
                //    //        cnOdbc_BD.Open();
                //    //    command_Odbc.Connection = cnOdbc_BD;
                //    //    command_Odbc.CommandText = query;
                //    //    tran_Odbc = command_Odbc.Connection.BeginTransaction();
                //    //    command_Odbc.Transaction = tran_Odbc;
                //    //    command_Odbc.ExecuteNonQuery();

                //    //    try
                //    //    {
                //    //        tran_Odbc.Commit();
                //    //        result = true;
                //    //    }
                //    //    catch (Exception ex)
                //    //    {
                //    //        result = false;
                //    //        _err = tmp_err + ". " + ex.ToString();
                //    //        log.escribirLOG(tmp_err + ". " + ex.ToString());
                //    //        tran_Odbc.Rollback();
                //    //    }

                //    //    break;

                //    default:
                //        cnOdbc_BD = new OdbcConnection(conexion);
                //        //Abriendo conexion...
                //        if (cnOdbc_BD.State != ConnectionState.Open)
                //            cnOdbc_BD.Open();
                //        command_Odbc.Connection = cnOdbc_BD;
                //        command_Odbc.CommandText = query;
                //        tran_Odbc = command_Odbc.Connection.BeginTransaction();
                //        command_Odbc.Transaction = tran_Odbc;
                //        command_Odbc.ExecuteNonQuery();

                //        try
                //        {
                //            tran_Odbc.Commit();
                //            result = "1";
                //        }
                //        catch (Exception ex)
                //        {
                //            result = tmp_err + ". " + ex.ToString();
                //            _err = tmp_err + ". " + ex.ToString();
                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
                //            tran_Odbc.Rollback();
                //        }


                //        break;
                //}
                //-------------------------------------------------------








                //command.Connection.Open();






            }
            catch (Exception ex)
            {
                
                _err = "Error.delete_archivoimport()." + "[" +
                                         "codtabla: " + codtabla + "\r\n" +
                                         //"tipoconexion: " + tipoconexion + "\r\n" +
                                         //"codconexion: " + codconexionbd + "\r\n" +
                                         //"nomconexion: " + nomconexion + "\r\n" +
                                         "]" + "[" + query + "]. " +
                                         ex.ToString();

                result = "Error.delete_archivoimport()." + "[" +
                                         "codtabla: " + codtabla + "\r\n" +
                                         //"tipoconexion: " + tipoconexion + "\r\n" +
                                         //"codconexion: " + codconexionbd + "\r\n" +
                                         //"nomconexion: " + nomconexion + "\r\n" +
                                         "]" + "[" + query + "]. " +
                                         ex.ToString();

                log.escribirLOG("Error.delete_archivoimport()." + "[" +
                                         "codtabla: " + codtabla + "\r\n" +
                                         //"tipoconexion: " + tipoconexion + "\r\n" +
                                         //"codconexion: " + codconexionbd + "\r\n" +
                                         //"nomconexion: " + nomconexion + "\r\n" +
                                         "]" + "[" + query + "]. " +
                                         ex.ToString()
                                         );



            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public string delete_archivoimport_mysql(MySqlConnection cn, string tabla,  string columfecha, string valfecha,
           string columcodtienda, Int64 codtienda, string columarchivo, string archivo)
        {
            string result = "1";

            //MySqlCommand command = new MySqlCommand();
            //MySqlTransaction tran = null;
            String query = "";

            try
            {

                using (MySqlCommand command = new MySqlCommand())
                {
                    if (cn.State != ConnectionState.Open)
                        cn.Open();
                    command.Connection = cn; 

                    using (MySqlTransaction tran = command.Connection.BeginTransaction())
                    {




                        //cn = new SqlConnection(clconexion.conexion);
                        //if (cn.State != ConnectionState.Open)
                        //    cn.Open();
                        //command.Connection = cn;

                        query = @"delete from " + tabla + @" where cast(" + columfecha + " as date) ='" + valfecha + "'" + " and " +
                                        columcodtienda + "=" + codtienda + "" + " and " + columarchivo + "='" + archivo + "' ;";

                        command.CommandText = query;

                        //log.escribirLOG("Eliminando.delete_archivoimport_mysql().[" + command.CommandText + "]. ");

                        //command.Parameters.Add("@codtienda", MySqlDbType.Int64);
                        //command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 100);


                        //tran = command.Connection.BeginTransaction();
                        command.Transaction = tran;

                        //...................
                        //command.Parameters["@codtienda"].Value = codtienda;
                        //command.Parameters["@nomtienda"].Value = nomtienda;
                        //command.Parameters["@servidor"].Value = servidor;
                        ////command.Parameters["@ruta"].Value = ruta;
                        ////command.Parameters["@usuario"].Value = usuario;
                        ////command.Parameters["@password"].Value = password;
                        //command.Parameters["@estado"].Value = estado;

                        //...................

                        //if (nomtienda == "")
                        //{
                        //    command.Parameters["@nomtienda"].Value = DBNull.Value;
                        //}
                        //else
                        //{
                        //    command.Parameters["@nomtienda"].Value = nomtienda;
                        //}



                        //command.Connection.Open();

                        
                        try
                        {
                            command.ExecuteNonQuery();
                            tran.Commit();
                            result = "1";
                            //tran = null;
                            //command = null;

                            
                        }
                        catch (Exception exx)
                        {
                            tran.Rollback();
                            //tran = null;
                            //command = null;
                            log.escribirLOG("Error.delete_archivoimport_mysql.commit(). " + exx.ToString());
                        }


                    }

                }

            }
            catch (Exception ex)
            {
                result = "Error.delete_archivoimport_mysql().[" + query + "]. " + ex.ToString();
                _err = "Error.delete_archivoimport_mysql().[" + query + "]. " + ex.ToString();
                log.escribirLOG("Error.delete_archivoimport_mysql().[" + query + "]. " + ex.ToString());


            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public string delete_archivoimport_mysql(MySqlConnection cn, string tabla, string columfecha, string valfecha,
   string columcodtienda, Int64 codtienda)
        {
            string result = "1";

            //MySqlCommand command = new MySqlCommand();
            //MySqlTransaction tran = null;

            String query = "";

            try
            {

                using (MySqlCommand command = new MySqlCommand())
                {
                    if (cn.State != ConnectionState.Open)
                        cn.Open();
                    command.Connection = cn;                    

                    using (MySqlTransaction tran = command.Connection.BeginTransaction())
                    {


                        //cn = new SqlConnection(clconexion.conexion);
                        //if (cn.State != ConnectionState.Open)
                        //    cn.Open();
                        //command.Connection = cn;


                        if (codtienda > 0)
                        {
                            //Borra todas los registros de una tienda y fecha determinada...
                            query = @"delete from " + tabla + @" where cast(" + columfecha + " as date) ='" + valfecha + "'" + " and " +
                                            columcodtienda + "=" + codtienda + "" + " ;";
                            command.CommandText = query;
                        }
                        else
                        {
                            //Borra todas los registros de una fecha determinada...
                            query = @"delete from " + tabla + @" where cast(" + columfecha + " as date) ='" + valfecha + "'" + " ;";
                            command.CommandText = query;
                        }



                        //command.Parameters.Add("@codtienda", MySqlDbType.Int64);
                        //command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 100);


                        //tran = command.Connection.BeginTransaction();
                        command.Transaction = tran;

                        //...................
                        //command.Parameters["@codtienda"].Value = codtienda;
                        //command.Parameters["@nomtienda"].Value = nomtienda;
                        //command.Parameters["@servidor"].Value = servidor;
                        ////command.Parameters["@ruta"].Value = ruta;
                        ////command.Parameters["@usuario"].Value = usuario;
                        ////command.Parameters["@password"].Value = password;
                        //command.Parameters["@estado"].Value = estado;

                        //...................

                        //if (nomtienda == "")
                        //{
                        //    command.Parameters["@nomtienda"].Value = DBNull.Value;
                        //}
                        //else
                        //{
                        //    command.Parameters["@nomtienda"].Value = nomtienda;
                        //}



                        //command.Connection.Open();

                        

                        try
                        {
                            command.ExecuteNonQuery();
                            tran.Commit();
                            result = "1";
                        }
                        catch (Exception exx)
                        {
                            tran.Rollback();
                            log.escribirLOG("Error.delete_archivoimport_mysql.commit(). " + exx.ToString());
                        }


                    }
                }

            }
            catch (Exception ex)
            {
                result = "Error.delete_archivoimport_mysql().[" + query + "]. " + ex.ToString();
                _err = "Error.delete_archivoimport_mysql().[" + query + "]. " + ex.ToString();
                log.escribirLOG("Error.delete_archivoimport_mysql().[" + query + "]. " + ex.ToString());

                

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }


        public string insert_archivoimport_Mysql(MySqlConnection cnMysql_BD, string fecha_venpro, Int64 codtienda_venpro, string archivo_venpro,
            Int64 codtabla, string nomtabla, string modoactualizacion, int colposicionupdate, int colposicionupdate1, int colposicionupdate2, int colposicionupdate3,
            int colposicionupdate4, int colposicionupdate5, int colposicionupdate6, int colposicionupdate7,
            DataRow[] rwcolumnas, List<String> v_columnaxFila, List<String> v_valorxFila)
        {
            string  result = "";

            //MySqlCommand command_Mysql = new MySqlCommand();
            //MySqlTransaction tran_Mysql = null;

            //SqlCommand command_Sql = new SqlCommand();
            //SqlTransaction tran_Sql = null;

            //OdbcCommand command_Odbc = new OdbcCommand();
            //OdbcTransaction tran_Odbc = null;

            //CONEXION MULTIPLE-----------------------------------
            //SqlConnection cnSql_BD;
            //MySqlConnection cnMysql_BD;
            ////OleDbConnection cnOledb;
            //OdbcConnection cnOdbc_BD;

            string query = "";
            string tmp_err = "";

            string tmp_valorFila = "";

            string c_columnas = "";
            string p_columnas = "";
            string v_tabla = "";


            string er_columna = "";
            string er_tipocolumna = "";
            string er_sizecolumna = "";
            string er_valorcolumna = "";

            try
            {

                //MySqlCommand command_Mysql = new MySqlCommand();
                //MySqlTransaction tran_Mysql = null;

                using (MySqlCommand command_Mysql = new MySqlCommand())
                {
                    if (cnMysql_BD.State != ConnectionState.Open)
                        cnMysql_BD.Open();
                    command_Mysql.Connection = cnMysql_BD;

                    using (MySqlTransaction tran_Mysql = command_Mysql.Connection.BeginTransaction())
                    {

                        //command_Mysql.Connection = cnMysql_BD;
                        //command_Mysql.CommandText = query;
                        //tran_Mysql = command_Mysql.Connection.BeginTransaction();
                        //command_Mysql.Transaction = tran_Mysql;
                        //command_Mysql.ExecuteNonQuery();


                        c_columnas = "";
                        p_columnas = "";
                        //v_tabla = dtcolumnas.Rows[colposicionupdate - 1]["nomtabla"].ToString();
                        v_tabla = nomtabla;


                        //ELIMINAR DATO A INSERTAR-----------
                        //   string tmp_delete = "";
                        //  tmp_delete= delete_archivoimport(codtabla, nomtabla, modoactualizacion,
                        //colposicionupdate, colposicionupdate1, colposicionupdate2, colposicionupdate3,
                        //colposicionupdate4, colposicionupdate5, colposicionupdate6, colposicionupdate7,
                        //dtcolumnas, v_columnaxFila, v_valorxFila, codtipoconexion,
                        //   tipoconexion, codconexionbd, nomconexion, conexion);
                        //  if (tmp_delete!="1")
                        //  {
                        //       tmp_err = "Error.insert_RPE_archivoimport_mysql().[No se pudo eliminar el registro][Tabla: " + nomtabla  + "] ";
                        //       result = "Error.insert_RPE_archivoimport_mysql().[No se pudo eliminar el registro][Tabla: " + nomtabla + "] " + tmp_delete;
                        //      return result;
                        //   }

                        //-----------------------------------

                        //Cargar Columnas Tabla.........
                        if (rwcolumnas.Length > 0)
                        {
                            er_columna = "";
                            er_tipocolumna = "";
                            er_sizecolumna = "";
                            er_valorcolumna = "";

                            for (int i = 0; i < rwcolumnas.Length; i++)
                            {

                                if (i == 0)
                                {
                                    c_columnas = "" + rwcolumnas[i]["nomcolumna"] + ""; //nombre columna
                                    p_columnas = "@" + rwcolumnas[i]["nomcolumna"] + ""; //nombre parametro columna
                                }
                                else
                                {
                                    c_columnas = c_columnas + ", " + rwcolumnas[i]["nomcolumna"] + ""; //nombre columna
                                    p_columnas = p_columnas + ", " + "@" + rwcolumnas[i]["nomcolumna"] + ""; //nombre parametro columna
                                }

                                //-------------------------------------------------
                                //Valores de TipoColumna permitido.
                                //VarChar ->size
                                //Char ->size
                                //DateTime
                                //Date
                                //Time
                                //Double
                                //Bit
                                //Int
                                //Text
                                string t_tipocolumna = rwcolumnas[i]["tipocolumna"].ToString();
                                Int32 t_sizecolumna = Convert.ToInt32(rwcolumnas[i]["size"].ToString());
                                string t_paramcolumna = "@" + rwcolumnas[i]["nomcolumna"].ToString();

                                er_columna = rwcolumnas[i]["nomcolumna"].ToString();
                                er_tipocolumna = t_tipocolumna;
                                er_sizecolumna = t_sizecolumna.ToString();
                                er_valorcolumna = "";

                                if (t_tipocolumna == "VarChar")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.VarChar, t_sizecolumna);
                                }
                                if (t_tipocolumna == "Char")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.VarChar, t_sizecolumna);
                                }
                                if (t_tipocolumna == "DateTime")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.DateTime);
                                }
                                if (t_tipocolumna == "Date")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.DateTime);
                                }
                                if (t_tipocolumna == "Time")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Timestamp);
                                }
                                if (t_tipocolumna == "Double")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Decimal, t_sizecolumna);
                                }
                                if (t_tipocolumna == "Bit")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Bit);
                                }
                                if (t_tipocolumna == "Int")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Int64);
                                }
                                if (t_tipocolumna == "Text")
                                {
                                    command_Mysql.Parameters.Add(t_paramcolumna, MySqlDbType.Text);
                                }
                                //----------------

                            }

                        }
                        //...........



                        //INSERT REGISTRO......


                        if (v_columnaxFila.Count > 1)
                        {

                            //for (int i = 1; i < index; i++)
                            //{
                            tmp_valorFila = "";

                            //Columna--------------
                            for (int j = 0; j < rwcolumnas.Length; j++)
                            {

                                er_columna = "";
                                er_tipocolumna = "";
                                er_sizecolumna = "";
                                er_valorcolumna = "";

                                //-------------------------------------------------
                                //Valores de TipoColumna permitido.
                                //VarChar ->size
                                //Char ->size
                                //DateTime
                                //Date
                                //Time
                                //Double
                                //Bit
                                //Int
                                //Text
                                string t_nomcolumna = rwcolumnas[j]["nomcolumna"].ToString();
                                //--------------------
                                int t_index = 0;
                                bool t_existecolum = false;
                                for (int k = 0; k < v_columnaxFila.Count; k++)
                                {
                                    if (v_columnaxFila[k] == t_nomcolumna)
                                    {
                                        t_index = k;
                                        t_existecolum = true;
                                    }
                                }

                                //---------------------
                                string t_tipocolumna = rwcolumnas[j]["tipocolumna"].ToString();
                                Int32 t_sizecolumna = Convert.ToInt32(rwcolumnas[j]["size"].ToString());
                                string t_paramcolumna = "@" + rwcolumnas[j]["nomcolumna"].ToString();
                                string t_valorFila = "";

                                if (!t_existecolum)
                                {
                                    //La columna No Existe...
                                    t_valorFila = "";

                                    //tmp_err = "Error.insert_RPE_archivoimport_mysql(). Error en la No exise la columna. " + "[" + t_nomcolumna + "][" +
                                    //             "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                    //              "] ";

                                    //result = tmp_err;

                                    //_err = tmp_err;
                                    //log.escribirLOG(tmp_err);

                                    //return result;
                                }
                                else
                                {
                                    //La columna Existe...
                                    t_valorFila = v_valorxFila[t_index];
                                }
                                //---------------------


                                er_columna = t_nomcolumna;
                                er_tipocolumna = t_tipocolumna;
                                er_sizecolumna = t_sizecolumna.ToString();
                                er_valorcolumna = t_valorFila;

                                if (t_tipocolumna == "VarChar")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }

                                }
                                if (t_tipocolumna == "Char")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                if (t_tipocolumna == "DateTime")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                if (t_tipocolumna == "Date")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                if (t_tipocolumna == "Time")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DateTime.Parse(t_valorFila.Trim()); ;
                                    }
                                }
                                if (t_tipocolumna == "Double")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = Convert.ToDecimal(t_valorFila);
                                    }
                                }
                                if (t_tipocolumna == "Bit")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = Convert.ToBoolean(t_valorFila);
                                    }
                                }
                                if (t_tipocolumna == "Int")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = Convert.ToInt64(t_valorFila);
                                    }
                                }
                                if (t_tipocolumna == "Text")
                                {
                                    command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_Mysql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                //----------------

                                //log.escribirLOG("command_Mysql:" + t_paramcolumna + ":tipo:"+  command_Mysql.Parameters[t_paramcolumna].MySqlDbType.ToString()+ ":"+
                                //    command_Mysql.Parameters[t_paramcolumna].Value.ToString());

                                if (j == 0)
                                {
                                    tmp_valorFila = "[" + t_paramcolumna + "=" + t_valorFila + "]"; //valor de La filaxColumna.
                                }
                                else
                                {                                    
                                    tmp_valorFila = tmp_valorFila + ", ["  + t_paramcolumna + "=" + t_valorFila + "]"; //valor de La filaxColumna.
                                }

                            }

                            //.......
                            query = @"INSERT INTO " + v_tabla + " ( archivo_venpro,fecha_venpro, fechaprocesamiento_venpro, codtienda_venpro, " + c_columnas + @" ) 
                                    values ( '" + archivo_venpro + "' , '" + fecha_venpro + "' ,'" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "'," + codtienda_venpro + ", " + p_columnas + @" )";

                            //tmp_err = "Error.insert_RPE_archivoimport_mysql()." + "[codevento: " + codevento.ToString() + "\r\n" +
                            //                "nomevento: " + nomevento + "\r\n" +
                            //                "codimportarchivo: " + codimportarchivo + "\r\n" +
                            //                  "nomimportarchivo: " + nomimportarchivo + "\r\n" +
                            //                 "codtabla: " + codtabla + "\r\n" +
                            //                 "tipoconexion: " + tipoconexion + "\r\n" +
                            //                 "codconexion: " + codconexionbd + "\r\n" +
                            //                 "nomconexion: " + nomconexion + "\r\n" +
                            //                 "ValorFILA: " + tmp_valorFila + "\r\n" +
                            //                 "]" + "[" + query + "] ";
                            //------
                            //cnMysql_BD = new MySqlConnection();

                            try
                            {
                                //cnMysql_BD = new MySqlConnection(conexion);
                                //cnMysql_BD.ConnectionString=conexion;
                                //Abriendo conexion...
                                if (cnMysql_BD.State != ConnectionState.Open)
                                    cnMysql_BD.Open();

                                try
                                {
                                    //command_Mysql.Connection = cnMysql_BD;
                                    command_Mysql.CommandText = query;
                                    //tran_Mysql = command_Mysql.Connection.BeginTransaction();
                                    command_Mysql.Transaction = tran_Mysql;
                                    command_Mysql.ExecuteNonQuery();

                                    try
                                    {
                                        //CORRECTO..........
                                        tran_Mysql.Commit();
                                        result = "1";
                                        //tran_Mysql = null;
                                        //command_Mysql = null;
                                        //.................
                                    }
                                    catch (Exception ex)
                                    {
                                        result = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
                                        _err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
                                        log.escribirLOG(tmp_err + " NO se ejecuto la sentencia. " + ex.ToString());
                                        tran_Mysql.Rollback();
                                        //tran_Mysql = null;
                                        //command_Mysql = null;
                                        //break;
                                    }

                                }
                                catch (Exception ex)
                                {
                                    tmp_err = "Error.insert_archivoimport_Mysql(). Error en la sentencia. " + "[" +
                                                 "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                                 "ValorFILA: " + tmp_valorFila + "\r\n" +
                                                 "]" +
                                                 "Archivo:[" + archivo_venpro + "]" + "\r\n" +
                                                 "Fecha: [" + fecha_venpro + "]" + "\r\n" +
                                                 "tienda: [" + codtienda_venpro + "]" + "\r\n" +
                                                 "[" + query + "] ";

                                    result = tmp_err + ". " + ex.ToString();

                                    _err = tmp_err + ". " + ex.Message;
                                    log.escribirLOG(tmp_err + ". " + ex.Message);
                                    //break;
                                    //command_Mysql = null;

                                }


                            }
                            catch (Exception ex)
                            {
                                tmp_err = "Error.insert_archivoimport_Mysql(). Error en la conexion. " + "[" +
                                             "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                             "ValorFILA: " + tmp_valorFila + "\r\n" +
                                             "Archivo:[" + archivo_venpro + "]" + "\r\n" +
                                             "Fecha: [" + fecha_venpro + "]" + "\r\n" +
                                             "tienda: [" + codtienda_venpro + "]" + "\r\n" +
                                             "]";

                                result = tmp_err + ". " + ex.Message;

                                _err = tmp_err + ". " + ex.Message;
                                log.escribirLOG(tmp_err + ". " + ex.Message);
                                //break;
                            }





                            //------

                            //}




                        }

                        //..................

                    }
                }

            }
            catch (Exception ex)
            {
                result = "Error.insert_archivoimport_Mysql()." + "[" +
                                         "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                        "Err Columna: " + er_columna + "\r\n" +
                                        "Err TipoColumna: " + er_tipocolumna + "\r\n" +
                                        "Err SizeColumna: " + er_sizecolumna + "\r\n" +
                                        "Err ValorColumna: " + er_valorcolumna + "\r\n" +
                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
                                         "Archivo:[" + archivo_venpro + "]" +
                                         "Fecha: [" + fecha_venpro + "]" +
                                         "tienda: [" + codtienda_venpro + "]" +
                                         "]" + "[" + query + "]. " +
                                         ex.Message;

                _err = "Error.insert_archivoimport_Mysql()." + "[" +
                                         "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                        "Err Columna: " + er_columna + "\r\n" +
                                        "Err TipoColumna: " + er_tipocolumna + "\r\n" +
                                        "Err SizeColumna: " + er_sizecolumna + "\r\n" +
                                        "Err ValorColumna: " + er_valorcolumna + "\r\n" +
                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
                                         "Archivo:[" + archivo_venpro + "]" + "\r\n" +
                                         "Fecha: [" + fecha_venpro + "]" + "\r\n" +
                                         "tienda: [" + codtienda_venpro + "]" + "\r\n" +
                                         "]" + "[" + query + "]. " +
                                         ex.Message;

                log.escribirLOG("Error.insert_archivoimport_Mysql()." + "[" +
                                         "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                        "Err Columna: " + er_columna + "\r\n" +
                                        "Err TipoColumna: " + er_tipocolumna + "\r\n" +
                                        "Err SizeColumna: " + er_sizecolumna + "\r\n" +
                                        "Err ValorColumna: " + er_valorcolumna + "\r\n" +
                                         "ValorFILA: " + tmp_valorFila + "\r\n" +
                                         "Archivo:[" + archivo_venpro + "]" + "\r\n" +
                                         "Fecha: [" + fecha_venpro + "]" + "\r\n" +
                                         "tienda: [" + codtienda_venpro + "]" + "\r\n" +
                                         "]" + "[" + query + "]. " +
                                         ex.Message
                                         );



            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public string loadfile_Mysql(string filename, string tablename, List<string> columns, string delimiter) {

            string result = "1";
            //string connStr = "server=localhost;user=root;database=test;port=3306;password=******";
            //MySqlConnection conn = new MySqlConnection(connStr);


            //cn = new MySqlConnection(clconexion.conexion);
            //if (cn.State != ConnectionState.Open)
            //    cn.Open();

            //MySqlBulkLoader bl = new MySqlBulkLoader(conn);
            //bl.Local = true;
            //bl.TableName = "Career";
            //bl.FieldTerminator = "\t";
            //bl.LineTerminator = "\n";
            //bl.FileName = "c:/career_data.txt";
            //bl.NumberOfLinesToSkip = 3;

            try
            {



                using (MySqlConnection conn = new MySqlConnection(clconexion.conexion))
                {
                    
                    MySqlBulkLoader bl = new MySqlBulkLoader(conn);
                    bl.Local = true;
                    bl.TableName = tablename;
                    bl.FieldTerminator = delimiter;
                    bl.LineTerminator = "\r\n";
                    bl.FileName =  filename;
                    foreach (string column in columns) {
                        bl.Columns.Add(column);
                    }                    
                    //bl.NumberOfLinesToSkip = 1;

                    //using (MySqlBulkLoader bl = new MySqlBulkLoader(conn))
                    //{

                    //    bl.Local = true;
                    //    bl.TableName = "Career";
                    //    bl.FieldTerminator = "\t";
                    //    bl.LineTerminator = "\n";
                    //    bl.FileName = "c:/career_data.txt";
                    //    bl.NumberOfLinesToSkip = 3;
                    //}

                   

                    try
                    {
                        //Console.WriteLine("Connecting to MySQL...");
                        //conn.Open();
                        if (conn.State != ConnectionState.Open)
                            conn.Open();

                        // Upload data from file
                        int count = bl.Load();
                        //Console.WriteLine(count + " lines uploaded.");
                        //log.escribirLOG("loadfile_Mysql().COLUMNA: \r\n" + String.Join(",", columns.ToArray()) );
                        log.escribirLOG("loadfile_Mysql()." + count + " lines uploaded." + " nomtabla: {" + tablename + "} " +
                          "Archivo:[" + filename + "]. "
                          );

                        //string sql = "SELECT Name, Age, Profession FROM Career";
                        //MySqlCommand cmd = new MySqlCommand(sql, conn);
                        //MySqlDataReader rdr = cmd.ExecuteReader();

                        //while (rdr.Read())
                        //{
                        //    Console.WriteLine(rdr[0] + " -- " + rdr[1] + " -- " + rdr[2]);
                        //}

                        //rdr.Close();

                        //conn.Close();
                        result = "1";
                    }
                    catch (Exception exx)
                    {
                        log.escribirLOG("Error.loadfile_Mysql(). " +  "nomtabla: {" + tablename + "} " +
                          "Archivo:["  + filename + "]. " + exx.Message
                          );
                        result = "Error.loadfile_Mysql(). " + "nomtabla: {" + tablename + "} " +
                          "Archivo:[" + filename + "]. " + exx.Message;
                    }



                }


            }
            catch (Exception ex)
            {
                log.escribirLOG("Error.loadfile_Mysql(). Error general. " +  "nomtabla: {" + tablename + "} " +
                          "Archivo:[" + filename + "]. " + ex.Message
                          );
                result = "Error.loadfile_Mysql(). Error general. " + " nomtabla: {" + tablename + "} " +
                          "Archivo:[" + filename + "]. " + ex.Message;
            }


            return result;
        }
        //.............
        public DataSet cargar_tabla_colum_delete_mysql(MySqlConnection cn)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo
					  from tablaimport t                               
                where  t.estadoactivo=1; ";



                //command.Parameters.Add("@nomtabla", MySqlDbType.VarChar, 100);

                ////...................
                //command.Parameters["@nomtabla"].Value = nomtabla;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tabladelete");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tabla_colum_delete_mysql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.Message;
                log.escribirLOG("Error.cargar_tabla_colum_delete_mysql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_tienda_mysql(MySqlConnection cn)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select codtienda, nomtienda, servidor, ruta, 
                usuario, password, estado from tienda where estado=1
					 Order by codtienda ; ";

                //command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 50);

                ////...................
                //command.Parameters["@nomtienda"].Value = nomtienda;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "tienda");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tienda_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tienda_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }
        
        public bool insert_validacionxml_mysql(MySqlConnection cn, string fecharegistro, string ruta, string archivo, string tag1, string tag2, 
            string tag3, string tag4)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO validacionxml (fecharegistro, ruta, archivo, tag1, tag2, tag3, tag4 ) 
                                    values (@fecharegistro, @ruta, @archivo, @tag1, @tag2, @tag3, @tag4 )";

                command.Parameters.Add("@fecharegistro", MySqlDbType.Date);
                command.Parameters.Add("@ruta", MySqlDbType.VarChar, 500);
                command.Parameters.Add("@archivo", MySqlDbType.VarChar, 300);
                command.Parameters.Add("@tag1", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@tag2", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@tag3", MySqlDbType.VarChar, 250);
                command.Parameters.Add("@tag4", MySqlDbType.VarChar, 250);

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;

                //...................
                command.Parameters["@fecharegistro"].Value = DateTime.Parse(fecharegistro);
                command.Parameters["@ruta"].Value = ruta;
                command.Parameters["@archivo"].Value = archivo;
                command.Parameters["@tag1"].Value = tag1;
                //...................

                if (tag2 == "")
                {
                    command.Parameters["@tag2"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@tag2"].Value = tag2;
                }

                if (tag3 == "")
                {
                    command.Parameters["@tag3"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@tag3"].Value = tag3;
                }

                if (tag4 == "")
                {
                    command.Parameters["@tag4"].Value = DBNull.Value;
                }
                else
                {
                    command.Parameters["@tag4"].Value = tag4;
                }


                //command.Connection.Open();
                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.insert_validacionxml_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_validacionxml_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }

        public bool delete_validacionxml_mysql(MySqlConnection cn)
        {
            bool result = false;

            MySqlCommand command = new MySqlCommand();
            MySqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"delete  from validacionxml;";

                tran = command.Connection.BeginTransaction();
                command.Transaction = tran;               

                //command.Connection.Open();
                command.ExecuteNonQuery();
                tran.Commit();
                result = true;


            }
            catch (Exception ex)
            {
                result = false;
                _err = "Error.insert_validacionxml_mysql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_validacionxml_mysql().[" + command.CommandText + "]. " + ex.ToString());

                try { tran.Rollback(); }
                catch { }

            }
            finally
            {
                //if (command.Connection != null)
                //{
                //    if (command.Connection.State == ConnectionState.Open)
                //        command.Connection.Close();
                //}
            }

            return result;
        }


        public DataSet cargar_validacionxml_mysql(MySqlConnection cn)
        {
            MySqlCommand command = new MySqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new MySqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select distinct  DATE_FORMAT(fecharegistro,'%Y-%m-%d') as fecharegistro,
ruta, archivo, tag1, tag2, tag3, tag4 from validacionxml; ";

                //command.Parameters.Add("@nomtienda", MySqlDbType.VarChar, 50);

                ////...................
                //command.Parameters["@nomtienda"].Value = nomtienda;

                MySqlDataAdapter sqldata = new MySqlDataAdapter(command);
                sqldata.Fill(ds, "validacionxml");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_validacionxml_mysql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_validacionxml_mysql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }




        //---------------------



















    }






}
