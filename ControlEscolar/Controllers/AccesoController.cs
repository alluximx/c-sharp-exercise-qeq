using ControlEscolar.DAL;
using ControlEscolar.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;


namespace ControlEscolar.Controllers
{
    public class AccesoController : Controller
    {

        DAL.AlumnosDAL alumnos = new DAL.AlumnosDAL();

        // GET: Acceso
        public ActionResult Login()
        {
            
            return View();
        }
        
        [HttpPost]
        public ActionResult Login(AlumnoModel a)
        {
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            string encryptPass = Encrypt.GetSHA256(a.Contrasenia);

            try
            {
                conn.Open();
                cmd.Connection = conn;
                cmd.CommandText = "select * from alumnos where usuario='" + a.Usuario + "' and contrasenia='" + encryptPass + "'";
                dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    AlumnoModel alum = new AlumnoModel();

                    alum.IdAlumno = Convert.ToInt32(dr[0]);
                    alum.Nombre = Convert.ToString(dr[1]);
                    alum.ApellidoPaterno = Convert.ToString(dr[2]);
                    alum.ApellidoMaterno = Convert.ToString(dr[3]);
                    alum.Usuario = Convert.ToString(dr[4]);
                    alum.Contrasenia = Convert.ToString(dr[5]);

                    Session["Usuario"] = alum;
                    return RedirectToAction("Index", "Alumnos");
                }
                else
                {
                    ViewBag.Error = "Usuario o Contraseña no validos";
                    return View();
                }
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
    }
}