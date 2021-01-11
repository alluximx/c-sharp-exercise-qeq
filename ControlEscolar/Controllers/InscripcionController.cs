using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls;
using ControlEscolar.Models;

namespace ControlEscolar.Controllers
{
    public class InscripcionController : Controller
    {
        DAL.AlumnosDAL alumnos = new DAL.AlumnosDAL();
        DAL.MateriasDAL materias = new DAL.MateriasDAL();

        // GET: Inscripcion
        public ActionResult Index()
        {

            return View();
        }

        public ActionResult Inscripcion()
        {
            AlumnoModel alumno = (AlumnoModel)Session["Usuario"];

            ViewBag.Nombre = alumno.Nombre + " " + alumno.ApellidoPaterno + " " + alumno.ApellidoMaterno;

            var materiasByAlumno = materias.GetMateriasIns();

            List<SelectListItem> listaMaterias = materiasByAlumno.ConvertAll(d =>
            {
                return new SelectListItem()
                {
                    Text = d.Nombre.ToString(),
                    Value = d.IdMateria.ToString(),
                    Selected = false
                };
            });

            ViewBag.lista = listaMaterias;

            return View();
        }

        [HttpPost]
        public ActionResult SaveInscripcion(int idMateria)
        {
            AlumnoModel alumno = (AlumnoModel)Session["Usuario"];

            try
            {
                materias.SaveInscripcion(alumno.IdAlumno, idMateria);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }



        public ActionResult ListMateriasByAlumno()
        {
            AlumnoModel alumno = (AlumnoModel)Session["Usuario"];

            try
            {
                DataSet ds = materias.GetMateriasByAlumnoId(alumno.IdAlumno);

                DataSet total = materias.SumCostos(alumno.IdAlumno);

                ViewBag.materiasByAlumno = ds.Tables[0];
                ViewBag.total = total.Tables[0];

            }
            catch (Exception)
            {

                throw;
            }

            return View();
        }

        [HttpPost]
        public ActionResult DeleteInscripcion(int idMateria)
        {
            try
            {
                materias.DeleteInscripcion(idMateria);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }
    }
}