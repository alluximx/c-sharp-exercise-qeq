using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using ControlEscolar.Models;


namespace ControlEscolar.Controllers
{
    public class MateriaController : Controller
    {
        DAL.MateriasDAL materias = new DAL.MateriasDAL();

        public ActionResult Index() 
        {
            return View();
        }

        public ActionResult ListMaterias()
        {
            try
            {
                DataSet ds = materias.GetMaterias();
                ViewBag.materias = ds.Tables[0];
            }
            catch (Exception)
            {

                throw;
            }

            return View();
        }

        public ActionResult NewMateria(MateriaModel m)
        {
            return View();
        }

        [HttpPost]
        public ActionResult SaveMateria(MateriaModel m)
        {
            MateriaModel mat = new MateriaModel();

            try
            {
                mat.Nombre = m.Nombre;
                mat.Costo = m.Costo;

                materias.InsertMateria(mat.Nombre, mat.Costo);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }

        public ActionResult Edit(int id)
        {
            MateriaModel model = materias.GetMateriaId(id);

            try
            {
                var materia = materias.GetMateriaId(id);
                model.IdMateria = materia.IdMateria;
                model.Nombre = materia.Nombre;
            }
            catch (Exception)
            {

                throw;
            }

            return View(model);
        }

        [HttpPost]
        public ActionResult UpdateMateria(MateriaModel m)
        {

            try
            {
                materias.UpdateMateria(m.IdMateria, m.Nombre, m.Costo);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }

        [HttpPost]
        public ActionResult DeleteMateria(int idMateria)
        {
            try
            {
                materias.DeleteMateria(idMateria);
            }
            catch (Exception)
            {

                throw;
            }

            return Content("1");
        }

    }
}