using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using ControlEscolar.Interfaces;
using ControlEscolar.Models;

namespace ControlEscolar.DAL
{
    public class AlumnosDAL : IAlumno
    {
        static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);

        public void InsertAlumno(string nombre, string apellidoPaterno, string apellidoMaterno, string contrasenia)
        {
            try
            {
                string Query = "InsertAlumno";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@apellidoPaterno", apellidoPaterno);
                cmd.Parameters.AddWithValue("@apellidoMaterno", apellidoMaterno);
                //Encrypt Password
                string encryptPass = Encrypt.GetSHA256(contrasenia);
                cmd.Parameters.AddWithValue("@contrasenia", encryptPass);
                //
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                conn.Close();
            }
        }//INSERT

        public void UpdateAlumno(int idAlumno, string nombre, string apellidoPaterno, string apellidoMaterno, string contrasenia)
        {
            try
            {
                string Query = "UpdateAlumno";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idAlumno", idAlumno);
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@apellidoPaterno", apellidoPaterno);
                cmd.Parameters.AddWithValue("@apellidoMaterno", apellidoMaterno);
                //Encrypt Password
                string encryptPass = Encrypt.GetSHA256(contrasenia);
                cmd.Parameters.AddWithValue("@contrasenia", encryptPass);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                conn.Close();
            }
        }//UPDATE

        public void DeleteAlumno(int idAlumno)
        {
            try
            {
                string Query = "DeleteAlumno";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idAlumno", idAlumno);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                conn.Close();
            }
        }//DELETE 

        public AlumnoModel GetAlumnoId(int idAlumno)
        {
            try
            {
                string Query = "GetAlumnoById";
                SqlCommand cmd = new SqlCommand(Query, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idAlumno", idAlumno);

                DataSet dsAlumno = new DataSet();
                adapter.Fill(dsAlumno);

                if (dsAlumno.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsAlumno.Tables[0].Rows[0];
                    AlumnoModel Alumno = new AlumnoModel(dr);
                    return Alumno;
                }
                else
                {
                    AlumnoModel Alumno = new AlumnoModel();
                    return Alumno;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }//GET ALUMNO BY ID

        public DataSet GetAlumnos()
        {
            string Query = "GetAlumnos";
            SqlCommand cmd = new SqlCommand(Query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet dsAlumnos = new DataSet();

            try
            {
                adapter.Fill(dsAlumnos);
                return dsAlumnos;
            }
            catch (Exception)
            {

                throw;
            }
        }//GET ALL ALUMNOS


    }
}