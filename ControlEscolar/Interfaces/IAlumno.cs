using ControlEscolar.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ControlEscolar.Interfaces
{
    interface IAlumno
    {
        void InsertAlumno(string nombre, string apellidoPaterno, string apellidoMaterno, string contrasenia);
        void UpdateAlumno(int idAlumno, string nombre, string apellidoPaterno, string apellidoMaterno, string contrasenia);
        void DeleteAlumno(int idAlumno);
        DataSet GetAlumnos();
        AlumnoModel GetAlumnoId(int idAlumno);
    }
}
