using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;

namespace ControlEscolar.Models
{
    public class AlumnoModel
    {
        #region Private Data
        private int _IdAlumno;
        private string _Nombre;
        private string _ApellidoPaterno;
        private string _ApellidoMaterno;
        private string _Usuario;
        private string _Contrasenia;
        #endregion

        #region Properties
        [DisplayName("ID")]
        public int IdAlumno { get => _IdAlumno; set => _IdAlumno = value; }

        [DisplayName("Nombre")]
        [StringLength(20)]
        [RegularExpression(@"^[a-zA-Z ]{2,254}$", ErrorMessage = "Introducir solo letras")]
        public string Nombre { get => _Nombre; set => _Nombre = value; }

        [DisplayName("Apellido Paterno")]
        [RegularExpression(@"^[A-Za-z]{1}-[0-9]{5}$", ErrorMessage = "Introducir solo letras")]
        public string ApellidoPaterno { get => _ApellidoPaterno; set => _ApellidoPaterno = value; }

        [DisplayName("Apellido Materno")]
        [RegularExpression(@"^[A-Za-z]{1}-[0-9]{5}$", ErrorMessage = "Introducir solo letras")]
        public string ApellidoMaterno { get => _ApellidoMaterno; set => _ApellidoMaterno = value; }
        [DisplayName("Usuario")]
        public string Usuario { get => _Usuario; set => _Usuario = value; }

        [RegularExpression(@"^[A-Za-z]{1}-[0-9]{5}$", ErrorMessage = "Debe contener minimo una letra mayuscula y un numero")]
        [DisplayName("Contraseña")]
        public string Contrasenia { get => _Contrasenia; set => _Contrasenia = value; }
        #endregion

        public AlumnoModel()
        {
            IdAlumno = 0;
            Nombre = "";
            ApellidoPaterno = "";
            ApellidoMaterno = "";
            Usuario = "";
            Contrasenia = "";
        }

        public AlumnoModel(DataRow dr)
        {
            IdAlumno = int.Parse(dr["idAlumno"].ToString());
            Nombre = dr["nombre"].ToString();
            ApellidoPaterno = dr["apellidoPaterno"].ToString();
            ApellidoMaterno = dr["apellidoMaterno"].ToString();
            Usuario = dr["usuario"].ToString();
            Contrasenia = dr["contrasenia"].ToString();
        }
    }
}