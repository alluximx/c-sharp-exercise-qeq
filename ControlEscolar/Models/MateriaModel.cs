using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ControlEscolar.Models
{
    public class MateriaModel
    {
        #region Private Data
        private int _IdMateria;
        private string _Nombre;
        private decimal _Costo;
        #endregion

        public int IdMateria { get => _IdMateria; set => _IdMateria = value; }
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public decimal Costo { get => _Costo; set => _Costo = value; }

        public MateriaModel()
        {
            IdMateria = 0;
            Nombre = "";
            Costo = 0;
        }

        public MateriaModel(DataRow dr)
        {
            IdMateria = int.Parse(dr["idMateria"].ToString());
            Nombre = dr["nombre"].ToString();
            Costo = decimal.Parse(dr["costo"].ToString());
        }
    }
}