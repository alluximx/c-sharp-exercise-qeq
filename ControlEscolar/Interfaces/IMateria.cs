using ControlEscolar.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ControlEscolar.Interfaces
{
    interface IMateria
    {
        void InsertMateria(string nombre, decimal costo);
        void UpdateMateria(int idMateria, string nombre, decimal costo);
        void DeleteMateria(int idMateria);
        DataSet GetMaterias();
        MateriaModel GetMateriaId(int idMateria);
    }
}
