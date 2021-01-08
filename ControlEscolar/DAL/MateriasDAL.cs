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
        
        public void InsertMateria(MateriaModel mat)
        {
            try
            {
                string Query = "InsertMateria";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", mat.Nombre);
                cmd.Parameters.AddWithValue("@costo", mat.Costo);
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

        public void UpdateMateria(MateriaModel mat)
        {
            try
            {
                string Query = "UpdateMateria";
                SqlCommand cmd = new SqlCommand(Query, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idMateria", mat.IdMateria);
                cmd.Parameters.AddWithValue("@nombre", mat.Nombre);
                cmd.Parameters.AddWithValue("@costo", mat.Costo);
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
                string Query = "GetMateriaById";
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

    }
}