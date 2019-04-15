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
    class cldatos_sql
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
        public DataSet cargar_tipoconexion_sql(SqlConnection cn, Int64 codtipoconexion)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
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

                
                command.Parameters.Add("@codtipoconexion", SqlDbType.BigInt);

                //...................
                command.Parameters["@codtipoconexion"].Value = codtipoconexion;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tipoconexion");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tipoconexion_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tipoconexion_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public bool insert_conexionbd_sql(SqlConnection cn, string nomtipoconexion, string nomconexion,
   string conexion)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO conexionbd (codtipoconexion, nomconexion, conexion) 
                                  select  (select codtipoconexion from tipoconexion where nomtipoconexion=@nomtipoconexion), @nomconexion, @conexion ";

                command.Parameters.Add("@nomtipoconexion", SqlDbType.VarChar, 50);
                command.Parameters.Add("@nomconexion", SqlDbType.VarChar, 50);
                command.Parameters.Add("@conexion", SqlDbType.Text);

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
                _err = "Error.insert_conexionbd_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_conexionbd_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public bool update_conexionbd_sql(SqlConnection cn, Int64 codconexionbd, string nomtipoconexion, string nomconexion,
          string conexion)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update conexionbd  set codtipoconexion=(select codtipoconexion from tipoconexion where nomtipoconexion=@nomtipoconexion), 
                        nomconexion=@nomconexion, conexion=@conexion where codconexionbd=@codconexionbd";

                command.Parameters.Add("@codconexionbd", SqlDbType.BigInt);
                command.Parameters.Add("@nomtipoconexion", SqlDbType.VarChar, 50);
                command.Parameters.Add("@nomconexion", SqlDbType.VarChar, 50);
                command.Parameters.Add("@conexion", SqlDbType.Text);

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
                _err = "Error.update_conexionbd_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_conexionbd_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public DataSet cargar_conexionbd_sql(SqlConnection cn)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"   select c.codconexionbd, tc.nomtipoconexion, c.nomconexion, c.conexion  from conexionbd c, tipoconexion tc 
                where c.codtipoconexion=tc.codtipoconexion Order By c.nomconexion asc;";



                //command.Parameters.Add("@codtipoconexion", SqlDbType.BigInt);

                ////...................
                //command.Parameters["@codtipoconexion"].Value = codtipoconexion;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "conexionbd");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_conexionbd_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_conexionbd_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_conexionbd_sql(SqlConnection cn, string nomtipoconexion)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select c.codconexionbd, tc.nomtipoconexion, c.nomconexion, c.conexion  
                from conexionbd c inner join tipoconexion tc on  c.codtipoconexion=tc.codtipoconexion
                where nomtipoconexion=@nomtipoconexion;";



                command.Parameters.Add("@nomtipoconexion", SqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtipoconexion"].Value = nomtipoconexion;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "conexionbd");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_conexionbd_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_conexionbd_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        //---------

        public bool insert_tienda_sql(SqlConnection cn, Int64 codtienda,  string nomtienda, string servidor, string ruta, 
            string usuario, string password, Boolean estado)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO tienda (codtienda, nomtienda, servidor, ruta, usuario, password, estado ) 
                                    values (@codtienda, @nomtienda, @servidor, @ruta, @usuario, @password, @estado )";

                command.Parameters.Add("@codtienda", SqlDbType.BigInt);
                command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 100);
                command.Parameters.Add("@servidor", SqlDbType.VarChar, 100);
                command.Parameters.Add("@ruta", SqlDbType.VarChar, 200);
                command.Parameters.Add("@usuario", SqlDbType.VarChar, 100);
                command.Parameters.Add("@password", SqlDbType.VarChar, 100);
                command.Parameters.Add("@estado", SqlDbType.Bit);

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
                _err = "Error.insert_tienda_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_tienda_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public bool update_tienda_sql(SqlConnection cn, Int64 codtienda, string nomtienda, string servidor, string ruta,
            string usuario, string password, Boolean estado)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update tienda set  nomtienda=@nomtienda, servidor=@servidor, ruta=@ruta, usuario=@usuario,
                                        password=@password, estado=@estado  
                                        where codtienda=@codtienda;";

                command.Parameters.Add("@codtienda", SqlDbType.BigInt);
                command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 100);
                command.Parameters.Add("@servidor", SqlDbType.VarChar, 100);
                command.Parameters.Add("@ruta", SqlDbType.VarChar, 200);
                command.Parameters.Add("@usuario", SqlDbType.VarChar, 100);
                command.Parameters.Add("@password", SqlDbType.VarChar, 100);
                command.Parameters.Add("@estado", SqlDbType.Bit);

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
                _err = "Error.update_tienda_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_tienda_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public bool update_tiendaestado_sql(SqlConnection cn, Int64 codtienda, Boolean estado)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update tienda set estado=@estado  
                                        where codtienda=@codtienda;";

                command.Parameters.Add("@codtienda", SqlDbType.BigInt);
                command.Parameters.Add("@estado", SqlDbType.Bit);

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
                _err = "Error.update_tiendaestado_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_tiendaestado_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public DataSet cargar_tienda_sql(SqlConnection cn, string nomtienda)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = "select * from tienda  where nomtienda like '%" + nomtienda + "%'";

                command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 50);

                //...................
                command.Parameters["@nomtienda"].Value = nomtienda;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tienda");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tienda_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tienda_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        //-----------------------

        //--
        public bool insert_columnasimport_sql(SqlConnection cn, string nomcolumna, string nomcolumnaxml, string tipocolumna,
           Double size, string formato)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO columnasimport (nomcolumna, nomcolumnaxml, tipocolumna, size, formato ) 
                                    values (@nomcolumna, @nomcolumnaxml, @tipocolumna, @size, @formato )";

                command.Parameters.Add("@nomcolumna", SqlDbType.VarChar, 250);
                command.Parameters.Add("@nomcolumnaxml", SqlDbType.VarChar, 250);
                command.Parameters.Add("@tipocolumna", SqlDbType.VarChar, 50);
                command.Parameters.Add("@size", SqlDbType.Float, 10);
                command.Parameters.Add("@formato", SqlDbType.VarChar, 50);

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
                _err = "Error.insert_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public bool update_columnasimport_sql(SqlConnection cn, Int64 codcolumna, string nomcolumna, string nomcolumnaxml, string tipocolumna,
           Double size, string formato)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"update columnasimport set nomcolumna=@nomcolumna, nomcolumnaxml=@nomcolumnaxml,
                                        tipocolumna=@tipocolumna, size=@size, formato=@formato  
                                    where codcolumna=@codcolumna;";

                command.Parameters.Add("@codcolumna", SqlDbType.BigInt);
                command.Parameters.Add("@nomcolumna", SqlDbType.VarChar, 250);
                command.Parameters.Add("@nomcolumnaxml", SqlDbType.VarChar, 250);
                command.Parameters.Add("@tipocolumna", SqlDbType.VarChar, 50);
                command.Parameters.Add("@size", SqlDbType.Float, 10);
                command.Parameters.Add("@formato", SqlDbType.VarChar, 50);

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
                _err = "Error.update_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public DataSet cargar_columnasimport_sql(SqlConnection cn, string nomcolumna)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = "select * from columnasimport  where nomcolumna like '%" + nomcolumna + "%'";

                command.Parameters.Add("@nomcolumna", SqlDbType.VarChar, 50);

                //...................
                command.Parameters["@nomcolumna"].Value = nomcolumna;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "columnasimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_columnasimport_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_columnasimport_sql(SqlConnection cn, string nomcolumna, string nomcolumnaxml)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
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
                

                command.Parameters.Add("@nomcolumna", SqlDbType.VarChar, 250);

                //...................
                command.Parameters["@nomcolumna"].Value = nomcolumna;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "columnasimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_columnasimport_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_columnasimport_sql(SqlConnection cn, Int64 codcolumna)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select codcolumna, nomcolumna, nomcolumnaxml, tipocolumna,size, formato from columnasimport
                where codcolumna=@codcolumna;";

                command.Parameters.Add("@codcolumna", SqlDbType.BigInt);

                //...................
                command.Parameters["@codcolumna"].Value = codcolumna;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "columnasimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_columnasimport_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_columnasimport_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        //--

        //--

        public bool insert_tablaimport_sql(SqlConnection cn, string nomtabla, string nomtablaxml,  int col_posicion_update,
            int col_posicion_update1, int col_posicion_update2, int col_posicion_update3, int col_posicion_update4,
            int col_posicion_update5, int col_posicion_update6, int col_posicion_update7, string modoactualizacion, Boolean estadoactivo,
       string[] columna, int[] posicion)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


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

                command.Parameters.Add("@nomtabla", SqlDbType.VarChar, 250);
                command.Parameters.Add("@nomtablaxml", SqlDbType.VarChar, 250);
                command.Parameters.Add("@col_posicion_update", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update1", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update2", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update3", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update4", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update5", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update6", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update7", SqlDbType.Int);
                command.Parameters.Add("@modoactualizacion", SqlDbType.VarChar, 50);
                command.Parameters.Add("@estadoactivo", SqlDbType.Bit);
                command.Parameters.Add("@nomconexion", SqlDbType.VarChar, 100);

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
                    command.Parameters.Add("@codtabla", SqlDbType.BigInt);
                    command.Parameters.Add("@nomcolumna", SqlDbType.VarChar, 50);
                    command.Parameters.Add("@posicion", SqlDbType.Int);

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
                _err = "Error.insert_tablaimport_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_tablaimport_sql().[" + command.CommandText + "]. " + ex.ToString());

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


        public bool update_tablaimport_sql(SqlConnection cn, Int64 codtabla, string nomtabla, string nomtablaxml, int col_posicion_update,
            int col_posicion_update1, int col_posicion_update2, int col_posicion_update3, int col_posicion_update4,
            int col_posicion_update5, int col_posicion_update6, int col_posicion_update7, string modoactualizacion, Boolean estadoactivo,
       string[] columna, int[] posicion)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


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

                command.Parameters.Add("@codtabla", SqlDbType.BigInt);
                command.Parameters.Add("@nomtabla", SqlDbType.VarChar, 250);
                command.Parameters.Add("@nomtablaxml", SqlDbType.VarChar, 250);
                command.Parameters.Add("@col_posicion_update", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update1", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update2", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update3", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update4", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update5", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update6", SqlDbType.Int);
                command.Parameters.Add("@col_posicion_update7", SqlDbType.Int);
                command.Parameters.Add("@modoactualizacion", SqlDbType.VarChar, 50);
                command.Parameters.Add("@estadoactivo", SqlDbType.Bit);
                command.Parameters.Add("@nomconexion", SqlDbType.VarChar, 100);

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
                    command.Parameters.Add("@nomcolumna", SqlDbType.VarChar, 50);
                    command.Parameters.Add("@posicion", SqlDbType.Int);
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
                _err = "Error.update_tablaimport_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.update_tablaimport_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public DataSet cargar_tablaimport_sql(SqlConnection cn, string nomtabla)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, Count(c.nomcolumna) as cantcolumnas, t.modoactualizacion from
                                tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna
                                where nomtabla like '%" + nomtabla + @"%' group by t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7,t.modoactualizacion;";

                command.Parameters.Add("@nomtabla", SqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tablaimport_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tablaimport_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_tablaimport_sql(SqlConnection cn, string nomtabla, string nomtablaxml)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
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
                                where nomtablaxml like '%" + nomtablaxml + @"%' group by t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, t.modoactualizacion;";

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
                                where nomtabla like '%" + nomtabla + @"%' group by t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, t.modoactualizacion;";

                    }
                    else
                    {
                        command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, Count(c.nomcolumna) as cantcolumnas, t.modoactualizacion from
                                tablaimport t inner join tablaimport_columnaimport tc on  t.codtabla=tc.codtabla
										  inner join  columnasimport c on tc.codcolumna=c.codcolumna
                                where nomtabla like '%" + nomtabla + "%'  or nomtablaxml like '%" + nomtablaxml + "%'" + 
                                                      @" group by t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo, 
  t.col_posicion_update, t.col_posicion_update1, t.col_posicion_update2, t.col_posicion_update3, t.col_posicion_update4, t.col_posicion_update5, 
                t.col_posicion_update6, t.col_posicion_update7, t.modoactualizacion;";

                    }


                }

                command.Parameters.Add("@nomtabla", SqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tablaimport_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tablaimport_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }


        public DataSet cargar_nomcolumna_sql(SqlConnection cn, string nomtabla)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select tc.posicion, c.nomcolumna, c.nomcolumnaxml from tablaimport t,tablaimport_columnaimport tc, columnasimport c
                where  t.codtabla=tc.codtabla and tc.codcolumna=c.codcolumna
                and  nomtabla=@nomtabla Order by tc.posicion asc;";

                command.Parameters.Add("@nomtabla", SqlDbType.VarChar, 100);

                //...................
                command.Parameters["@nomtabla"].Value = nomtabla;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_nomcolumna_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_nomcolumna_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }


        //--

        //Importar.....
        public DataSet cargar_tablaxml_import_sql(SqlConnection cn)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
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



                //command.Parameters.Add("@nomtablaxml", SqlDbType.VarChar, 100);

                //...................
                //command.Parameters["@nomtablaxml"].Value = nomtablaxml;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tablaimport");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tablaxml_import_sql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.Message;
                log.escribirLOG("Error.cargar_tablaxml_import_sql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.ToString());
                return ds;
            }


        }


        public string delete_archivoimport_antes(SqlConnection cnSql_BD, Int64 codtabla, string archivo, string nomtabla, string modoactualizacion,
            int colposicionupdate, int colposicionupdate1, int colposicionupdate2, int colposicionupdate3,
            int colposicionupdate4, int colposicionupdate5, int colposicionupdate6, int colposicionupdate7,
            DataTable dtcolumnas, List<String> v_columnaxFila, List<String> v_valorxFila )
        {
            string result = "0";

            SqlCommand command_sql = new SqlCommand();
            SqlTransaction tran_sql = null;

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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                        tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + tmp_col + "][" +
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
                //SqlConnection cnSql_BD;
                //OleDbConnection cnOleDb_BD;
                //OdbcConnection cnOdbc_BD;

                //cnSql_BD = new SqlConnection(conexion);
                //Abriendo conexion...
                if (cnSql_BD.State != ConnectionState.Open)
                    cnSql_BD.Open();
                command_sql.Connection = cnSql_BD;
                command_sql.CommandText = query;
                tran_sql = command_sql.Connection.BeginTransaction();
                command_sql.Transaction = tran_sql;
                command_sql.ExecuteNonQuery();

                try
                {
                    tran_sql.Commit();
                    result = "1";
                }
                catch (Exception ex)
                {
                    result = tmp_err + ". " + ex.ToString();
                    _err = tmp_err + ". " + ex.ToString();
                    log.escribirLOG(tmp_err + ". " + ex.ToString());
                    tran_sql.Rollback();
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
                //        cnSql_BD = new SqlConnection(conexion);
                //        //Abriendo conexion...
                //        if (cnSql_BD.State != ConnectionState.Open)
                //            cnSql_BD.Open();
                //        command_sql.Connection = cnSql_BD;
                //        command_sql.CommandText = query;
                //        tran_sql = command_sql.Connection.BeginTransaction();
                //        command_sql.Transaction = tran_sql;
                //        command_sql.ExecuteNonQuery();

                //        try
                //        {
                //            tran_sql.Commit();
                //            result = "1";
                //        }
                //        catch (Exception ex)
                //        {
                //            result = tmp_err + ". " + ex.ToString();
                //            _err = tmp_err + ". " + ex.ToString();
                //            log.escribirLOG(tmp_err + ". " + ex.ToString());
                //            tran_sql.Rollback();
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

        public string delete_archivoimport_sql(SqlConnection cn, string tabla,  string columfecha, string valfecha,
           string columcodtienda, Int64 codtienda, string columarchivo, string archivo)
        {
            string result = "1";

            //SqlCommand command = new SqlCommand();
            //SqlTransaction tran = null;
            String query = "";

            try
            {

                using (SqlCommand command = new SqlCommand())
                {
                    if (cn.State != ConnectionState.Open)
                        cn.Open();
                    command.Connection = cn; 

                    using (SqlTransaction tran = command.Connection.BeginTransaction())
                    {




                        //cn = new SqlConnection(clconexion.conexion);
                        //if (cn.State != ConnectionState.Open)
                        //    cn.Open();
                        //command.Connection = cn;

                        query = @"delete from " + tabla + @" where " + columfecha + "='" + valfecha + "'" + " and " +
                                        columcodtienda + "=" + codtienda + "" + " and " + columarchivo + "='" + archivo + "' ;";

                        command.CommandText = query;

                        //log.escribirLOG("Eliminando.delete_archivoimport_sql().[" + command.CommandText + "]. ");

                        //command.Parameters.Add("@codtienda", SqlDbType.BigInt);
                        //command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 100);


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
                            log.escribirLOG("Error.delete_archivoimport_sql.commit(). " + exx.ToString());
                        }


                    }

                }

            }
            catch (Exception ex)
            {
                result = "Error.delete_archivoimport_sql().[" + query + "]. " + ex.ToString();
                _err = "Error.delete_archivoimport_sql().[" + query + "]. " + ex.ToString();
                log.escribirLOG("Error.delete_archivoimport_sql().[" + query + "]. " + ex.ToString());


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

        public string delete_archivoimport_sql(SqlConnection cn, string tabla, string columfecha, string valfecha,
   string columcodtienda, Int64 codtienda)
        {
            string result = "1";

            //SqlCommand command = new SqlCommand();
            //SqlTransaction tran = null;

            String query = "";

            try
            {

                using (SqlCommand command = new SqlCommand())
                {
                    if (cn.State != ConnectionState.Open)
                        cn.Open();
                    command.Connection = cn;                    

                    using (SqlTransaction tran = command.Connection.BeginTransaction())
                    {


                        //cn = new SqlConnection(clconexion.conexion);
                        //if (cn.State != ConnectionState.Open)
                        //    cn.Open();
                        //command.Connection = cn;


                        if (codtienda > 0)
                        {
                            //Borra todas los registros de una tienda y fecha determinada...
                            query=@"delete from " + tabla + @" where " + columfecha + "='" + valfecha + "'" + " and " +
                                            columcodtienda + "=" + codtienda + "" + " ;";
                            command.CommandText = query;
                        }
                        else
                        {
                            //Borra todas los registros de una fecha determinada...
                            query = @"delete from " + tabla + @" where " + columfecha + "='" + valfecha + "'" + " ;";
                            command.CommandText = query;
                        }



                        //command.Parameters.Add("@codtienda", SqlDbType.BigInt);
                        //command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 100);


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
                            log.escribirLOG("Error.delete_archivoimport_sql.commit(). " + exx.ToString());
                        }


                    }
                }

            }
            catch (Exception ex)
            {
                result = "Error.delete_archivoimport_sql().[" + query + "]. " + ex.ToString();
                _err = "Error.delete_archivoimport_sql().[" + query + "]. " + ex.ToString();
                log.escribirLOG("Error.delete_archivoimport_sql().[" + query + "]. " + ex.ToString());

                

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


        public string insert_archivoimport_sql(SqlConnection cnSql_BD, string fecha_venpro, Int64 codtienda_venpro, string archivo_venpro,
            Int64 codtabla, string nomtabla, string modoactualizacion, int colposicionupdate, int colposicionupdate1, int colposicionupdate2, int colposicionupdate3,
            int colposicionupdate4, int colposicionupdate5, int colposicionupdate6, int colposicionupdate7,
            DataRow[] rwcolumnas, List<String> v_columnaxFila, List<String> v_valorxFila)
        {
            string  result = "";

            //SqlCommand command_sql = new SqlCommand();
            //SqlTransaction tran_sql = null;

            //SqlCommand command_Sql = new SqlCommand();
            //SqlTransaction tran_Sql = null;

            //OdbcCommand command_Odbc = new OdbcCommand();
            //OdbcTransaction tran_Odbc = null;

            //CONEXION MULTIPLE-----------------------------------
            //SqlConnection cnSql_BD;
            //SqlConnection cnSql_BD;
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

                //SqlCommand command_sql = new SqlCommand();
                //SqlTransaction tran_sql = null;

                using (SqlCommand command_sql = new SqlCommand())
                {
                    if (cnSql_BD.State != ConnectionState.Open)
                        cnSql_BD.Open();
                    command_sql.Connection = cnSql_BD;

                    using (SqlTransaction tran_sql = command_sql.Connection.BeginTransaction())
                    {

                        //command_sql.Connection = cnSql_BD;
                        //command_sql.CommandText = query;
                        //tran_sql = command_sql.Connection.BeginTransaction();
                        //command_sql.Transaction = tran_sql;
                        //command_sql.ExecuteNonQuery();


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
                        //       tmp_err = "Error.insert_RPE_archivoimport_sql().[No se pudo eliminar el registro][Tabla: " + nomtabla  + "] ";
                        //       result = "Error.insert_RPE_archivoimport_sql().[No se pudo eliminar el registro][Tabla: " + nomtabla + "] " + tmp_delete;
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
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.VarChar, t_sizecolumna);
                                }
                                if (t_tipocolumna == "Char")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.VarChar, t_sizecolumna);
                                }
                                if (t_tipocolumna == "DateTime")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.DateTime);
                                }
                                if (t_tipocolumna == "Date")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.DateTime);
                                }
                                if (t_tipocolumna == "Time")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.DateTime);
                                }
                                if (t_tipocolumna == "Double")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.Decimal, t_sizecolumna);
                                }
                                if (t_tipocolumna == "Bit")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.Bit);
                                }
                                if (t_tipocolumna == "Int")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.BigInt);
                                }
                                if (t_tipocolumna == "Text")
                                {
                                    command_sql.Parameters.Add(t_paramcolumna, SqlDbType.Text);
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

                                    //tmp_err = "Error.insert_RPE_archivoimport_sql(). Error en la No exise la columna. " + "[" + t_nomcolumna + "][" +
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
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }

                                }
                                if (t_tipocolumna == "Char")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                if (t_tipocolumna == "DateTime")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                if (t_tipocolumna == "Date")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                if (t_tipocolumna == "Time")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DateTime.Parse(t_valorFila.Trim()); ;
                                    }
                                }
                                if (t_tipocolumna == "Double")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = Convert.ToDecimal(t_valorFila);
                                    }
                                }
                                if (t_tipocolumna == "Bit")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = Convert.ToBoolean(t_valorFila);
                                    }
                                }
                                if (t_tipocolumna == "Int")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = Convert.ToInt64(t_valorFila);
                                    }
                                }
                                if (t_tipocolumna == "Text")
                                {
                                    command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    //...................
                                    if (t_valorFila == "")
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = DBNull.Value;
                                    }
                                    else
                                    {
                                        command_sql.Parameters[t_paramcolumna].Value = t_valorFila;
                                    }
                                }
                                //----------------

                                //log.escribirLOG("command_sql:" + t_paramcolumna + ":tipo:"+  command_sql.Parameters[t_paramcolumna].SqlDbType.ToString()+ ":"+
                                //    command_sql.Parameters[t_paramcolumna].Value.ToString());

                                if (j == 0)
                                {
                                    tmp_valorFila = "[" + t_valorFila + "]"; //valor de La filaxColumna.
                                }
                                else
                                {
                                    tmp_valorFila = tmp_valorFila + ", [" + t_valorFila + "]"; //valor de La filaxColumna.
                                }

                            }

                            //.......
                            query = @"INSERT INTO " + v_tabla + " ( archivo_venpro,fecha_venpro, codtienda_venpro, " + c_columnas + @" ) 
                                    values ( '" + archivo_venpro + "' , '" + fecha_venpro + "' ," + codtienda_venpro + ", " + p_columnas + @" )";

                            //tmp_err = "Error.insert_RPE_archivoimport_sql()." + "[codevento: " + codevento.ToString() + "\r\n" +
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
                            //cnSql_BD = new SqlConnection();

                            try
                            {
                                //cnSql_BD = new SqlConnection(conexion);
                                //cnSql_BD.ConnectionString=conexion;
                                //Abriendo conexion...
                                if (cnSql_BD.State != ConnectionState.Open)
                                    cnSql_BD.Open();

                                try
                                {
                                    //command_sql.Connection = cnSql_BD;
                                    command_sql.CommandText = query;
                                    //tran_sql = command_sql.Connection.BeginTransaction();
                                    command_sql.Transaction = tran_sql;
                                    command_sql.ExecuteNonQuery();

                                    try
                                    {
                                        //CORRECTO..........
                                        tran_sql.Commit();
                                        result = "1";
                                        //tran_sql = null;
                                        //command_sql = null;
                                        //.................
                                    }
                                    catch (Exception ex)
                                    {
                                        result = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
                                        _err = tmp_err + " NO se ejecuto la sentencia. " + ex.ToString();
                                        log.escribirLOG(tmp_err + " NO se ejecuto la sentencia. " + ex.ToString());
                                        tran_sql.Rollback();
                                        //tran_sql = null;
                                        //command_sql = null;
                                        //break;
                                    }

                                }
                                catch (Exception ex)
                                {
                                    tmp_err = "Error.insert_archivoimport_sql(). Error en la sentencia. " + "[" +
                                                 "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                                 "ValorFILA: " + tmp_valorFila + "\r\n" +
                                                 "]" +
                                                 "Archivo:[" + archivo_venpro + "]" + "\r\n" +
                                                 "Fecha: [" + fecha_venpro + "]" + "\r\n" +
                                                 "tienda: [" + codtienda_venpro + "]" + "\r\n" +
                                                 "[" + query + "] ";

                                    result = tmp_err + ". " + ex.ToString();

                                    _err = tmp_err + ". " + ex.ToString();
                                    log.escribirLOG(tmp_err + ". " + ex.ToString());
                                    //break;
                                    //command_sql = null;

                                }


                            }
                            catch (Exception ex)
                            {
                                tmp_err = "Error.insert_archivoimport_sql(). Error en la conexion. " + "[" +
                                             "codtabla: {" + codtabla + "} - nomtabla: {" + nomtabla + "}\r\n" +
                                             "ValorFILA: " + tmp_valorFila + "\r\n" +
                                             "Archivo:[" + archivo_venpro + "]" + "\r\n" +
                                             "Fecha: [" + fecha_venpro + "]" + "\r\n" +
                                             "tienda: [" + codtienda_venpro + "]" + "\r\n" +
                                             "]";

                                result = tmp_err + ". " + ex.ToString();

                                _err = tmp_err + ". " + ex.ToString();
                                log.escribirLOG(tmp_err + ". " + ex.ToString());
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
                result = "Error.insert_archivoimport_sql()." + "[" +
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
                                         ex.ToString();

                _err = "Error.insert_archivoimport_sql()." + "[" +
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
                                         ex.ToString();

                log.escribirLOG("Error.insert_archivoimport_sql()." + "[" +
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

        //.............
        public DataSet cargar_tabla_colum_delete_sql(SqlConnection cn)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"select t.codtabla, t.nomtabla, t.nomtablaxml, t.estadoactivo
					  from tablaimport t                               
                where  t.estadoactivo=1; ";



                //command.Parameters.Add("@nomtabla", SqlDbType.VarChar, 100);

                ////...................
                //command.Parameters["@nomtabla"].Value = nomtabla;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tabladelete");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tabla_colum_delete_sql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.Message;
                log.escribirLOG("Error.cargar_tabla_colum_delete_sql().[" + command.CommandText + "][conexion: " + cn.ConnectionString + "]." + ex.ToString());
                return ds;
            }


        }

        public DataSet cargar_tienda_sql(SqlConnection cn)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select codtienda, nomtienda, servidor, ruta, 
                usuario, password, estado from tienda where estado=1
					 Order by codtienda ; ";

                //command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 50);

                ////...................
                //command.Parameters["@nomtienda"].Value = nomtienda;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "tienda");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_tienda_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_tienda_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }
        
        public bool insert_validacionxml_sql(SqlConnection cn, string fecharegistro, string ruta, string archivo, string tag1, string tag2, 
            string tag3, string tag4)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


            try
            {

                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                command.CommandText = @"INSERT INTO validacionxml (fecharegistro, ruta, archivo, tag1, tag2, tag3, tag4 ) 
                                    values (@fecharegistro, @ruta, @archivo, @tag1, @tag2, @tag3, @tag4 )";

                command.Parameters.Add("@fecharegistro", SqlDbType.Date);
                command.Parameters.Add("@ruta", SqlDbType.VarChar, 500);
                command.Parameters.Add("@archivo", SqlDbType.VarChar, 300);
                command.Parameters.Add("@tag1", SqlDbType.VarChar, 250);
                command.Parameters.Add("@tag2", SqlDbType.VarChar, 250);
                command.Parameters.Add("@tag3", SqlDbType.VarChar, 250);
                command.Parameters.Add("@tag4", SqlDbType.VarChar, 250);

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
                _err = "Error.insert_validacionxml_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_validacionxml_sql().[" + command.CommandText + "]. " + ex.ToString());

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

        public bool delete_validacionxml_sql(SqlConnection cn)
        {
            bool result = false;

            SqlCommand command = new SqlCommand();
            SqlTransaction tran = null;


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
                _err = "Error.insert_validacionxml_sql().[" + command.CommandText + "]. " + ex.ToString();
                log.escribirLOG("Error.insert_validacionxml_sql().[" + command.CommandText + "]. " + ex.ToString());

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


        public DataSet cargar_validacionxml_sql(SqlConnection cn)
        {
            SqlCommand command = new SqlCommand();
            ds = new DataSet();
            try
            {
                //cn = new SqlConnection(clconexion.conexion);
                //if (cn.State != ConnectionState.Open)
                //    cn.Open();
                command.Connection = cn;

                //tiposeleccion: año,mes,semana,fecha
                command.CommandText = @"select distinct  DATE_FORMAT(fecharegistro,'%Y-%m-%d') as fecharegistro,
ruta, archivo, tag1, tag2, tag3, tag4 from validacionxml; ";

                //command.Parameters.Add("@nomtienda", SqlDbType.VarChar, 50);

                ////...................
                //command.Parameters["@nomtienda"].Value = nomtienda;

                SqlDataAdapter sqldata = new SqlDataAdapter(command);
                sqldata.Fill(ds, "validacionxml");
                //cn.Close();
                return ds;
            }
            catch (Exception ex)
            {
                _err = "Error.cargar_validacionxml_sql().[" + command.CommandText + "]. " + ex.Message;
                log.escribirLOG("Error.cargar_validacionxml_sql().[" + command.CommandText + "]. " + ex.ToString());
                return ds;
            }


        }




        //---------------------



















    }






}
