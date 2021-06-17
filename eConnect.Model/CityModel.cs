using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Model
{
   public class CityModel
    {
        public int CityID { get; set; }
        public string CityName { get; set; }
        public int StateID { get; set; }
        public bool InActive { get; set; }

        public virtual ICollection<UsersModel> Users { get; set; }
    }
}
