using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{  
    public interface IEmailRepository : IRepository<tblMailConfiguration>
    {
        IList<tblMailConfiguration> GetAllMailConfiguration();
        IEnumerable<tblMailConfiguration> GetMailConfiguration();
        tblMailConfiguration GetMailConfigurationByID(int id);
        void InsertMailConfiguration(tblMailConfiguration tblMailConfiguration);
        void UpdateMailConfiguration(tblMailConfiguration tblMailConfiguration);
        void DeleteMailConfiguration(int id);       
        void Save();
    }
}
