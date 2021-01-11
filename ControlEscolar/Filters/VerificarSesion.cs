using ControlEscolar.Controllers;
using ControlEscolar.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ControlEscolar.Filters
{
    public class VerificarSesion : ActionFilterAttribute
    {
        private AlumnoModel alumno;
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            try
            {
                base.OnActionExecuting(filterContext);

                alumno = (AlumnoModel)HttpContext.Current.Session["Usuario"];
                
                if (alumno == null)
                {
                    if (filterContext.Controller is AccesoController == false)
                    {
                        filterContext.HttpContext.Response.Redirect("~/Acceso/Login");
                    }
                }
            }
            catch (Exception)
            {

                filterContext.HttpContext.Response.Redirect("~/Acceso/Login");
            }

        }
    }
}