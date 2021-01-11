using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ControlEscolar.Models;

namespace ControlEscolar.Controllers
{
    public class AlumnosController : Controller
    {
        DAL.AlumnosDAL alumnos = new DAL.AlumnosDAL();

        // GET: Alumnos
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListAlumnos()
        {
            try
            {
                DataSet ds = alumnos.GetAlumnos();
                ViewBag.alumnos = ds.Tables[0];
            }
            catch (Exception)
            {

                throw;
            }

            return View();
        }

        public ActionResult NewAlumno(AlumnoModel a)
        {
            return View();
        }

        [HttpPost]
        public ActionResult SaveAlumno(AlumnoModel a)
        {
            AlumnoModel alumn = new AlumnoModel();

            try
            {
                alumn.Nombre = a.Nombre;
                alumn.ApellidoPaterno = a.ApellidoPaterno;
                alumn.ApellidoMaterno = a.ApellidoMaterno;
                alumn.Contrasenia = a.Contrasenia;

                alumnos.InsertAlumno(alumn.Nombre, alumn.ApellidoPaterno, alumn.ApellidoMaterno, alumn.Contrasenia);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }

        public ActionResult Edit(int id)
        {
            AlumnoModel model = new AlumnoModel();

            try
            {
                var alumno = alumnos.GetAlumnoId(id);
                model.IdAlumno = alumno.IdAlumno;
                model.Nombre = alumno.Nombre;
                model.ApellidoPaterno = alumno.ApellidoPaterno;
                model.ApellidoMaterno = alumno.ApellidoMaterno;
                model.Contrasenia = alumno.Contrasenia;
            }
            catch (Exception)
            {

                throw;
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult UpdateAlumno([Bind(Exclude = "Usuario")] AlumnoModel a)
        {

            try
            {
                alumnos.UpdateAlumno(a.IdAlumno, a.Nombre, a.ApellidoPaterno, a.ApellidoMaterno, a.Contrasenia);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }

        [HttpPost]
        public ActionResult DeleteAlumno(int idAlumno)
        {
            try
            {
                alumnos.DeleteAlumno(idAlumno);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }
    }
}