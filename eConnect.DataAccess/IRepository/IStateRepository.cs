using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IStateRepository : IRepository<tblState>
    {
        IList<tblState> GetAllState();
        IEnumerable<tblState> GetAllStatesByCountryID(long id);

    }

  
}
