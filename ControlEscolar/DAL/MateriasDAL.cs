using ControlEscolar.Interfaces;
using ControlEscolar.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ControlEscolar.DAL
{
    public class MateriasDAL : IMateria
    {
        static SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
        
        public void InsertMateria(string nombre, decimal costo)
        {
            try
            {
                string Query = "InsertMateria";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@costo", costo);
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

        public void UpdateMateria(int idMateria, string nombre, decimal costo)
        {
            try
            {
                string Query = "UpdateMateria";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idMateria", idMateria);
                cmd.Parameters.AddWithValue("@nombre", nombre);
                cmd.Parameters.AddWithValue("@costo", costo);
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

        public void DeleteMateria(int idMateria)
        {
            try
            {
                string Query = "DeleteMateria";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idMateria", idMateria);
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

        public MateriaModel GetMateriaId(int idMateria)
        {
            try
            {
                string Query = "GetMateriasById";
                SqlCommand cmd = new SqlCommand(Query, conn);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idMateria", idMateria);

                DataSet dsMateria = new DataSet();
                adapter.Fill(dsMateria);

                if (dsMateria.Tables[0].Rows.Count > 0)
                {
                    DataRow dr = dsMateria.Tables[0].Rows[0];
                    MateriaModel Materia = new MateriaModel(dr);
                    return Materia;
                }
                else
                {
                    MateriaModel Materia = new MateriaModel();
                    return Materia;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }//GET MATERIA BY ID

        public DataSet GetMaterias()
        {
            string Query = "GetMaterias";
            SqlCommand cmd = new SqlCommand(Query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet dsMaterias = new DataSet();

            try
            {
                adapter.Fill(dsMaterias);
                return dsMaterias;
            }
            catch (Exception)
            {

                throw;
            }
        }//GET ALL MATERIAS

        public List<MateriaModel> GetMateriasIns()
        {
            string Query = "GetMaterias";
            SqlCommand cmd = new SqlCommand(Query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            DataSet dsMaterias = new DataSet();

            try
            {
                adapter.Fill(dsMaterias);

                List<MateriaModel> LstMaterias = new List<MateriaModel>();

                foreach (DataRow dr in dsMaterias.Tables[0].Rows)
                {
                    LstMaterias.Add(new MateriaModel(dr));
                }

                return LstMaterias;
            }
            catch (Exception)
            {

                throw;
            }
        }//GET ALL MATERIAS

        public DataSet GetMateriasByAlumnoId(int idAlumno)
        {
            string Query = "GetMateriasByAlumnoId";
            SqlCommand cmd = new SqlCommand(Query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idAlumno", idAlumno);

            DataSet dsMaterias = new DataSet();

            try
            {
                adapter.Fill(dsMaterias);
                return dsMaterias;
            }
            catch (Exception)
            {

                throw;
            }
        }//GET MATERIAS BY ALUMNO ID

        public DataSet SumCostos(int idAlumno)
        {

            string Query = "SumCostos";
            SqlCommand cmd = new SqlCommand(Query, conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@idAlumno", idAlumno);

            DataSet dsTotal = new DataSet();

            try
            {
                adapter.Fill(dsTotal);
                return dsTotal;
            }
            catch (Exception)
            {

                throw;
            }
        }//GET MATERIAS BY ALUMNO ID

        public void SaveInscripcion(int idAlumno, int idMateria)
        {
            try
            {
                string Query = "InsertInscripcion";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idAlumno", idAlumno);
                cmd.Parameters.AddWithValue("@idMateria", idMateria);
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
        }

        public void DeleteInscripcion(int idMateria)
        {
            try
            {
                string Query = "DeleteInscripcion";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idMateria", idMateria);
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
        }//DELETE INSCRIPCION
    }
}