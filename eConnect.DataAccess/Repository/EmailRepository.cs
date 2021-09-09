using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class EmailRepository : Repository<tblMailConfiguration>, IEmailRepository
    {

        public EmailRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();
  
        public IList<tblMailConfiguration> GetAllMailConfiguration()
        {
            return eConnectAppEntities.tblMailConfigurations.ToList();
        }

        public IEnumerable<tblMailConfiguration> GetMailConfiguration()
        {
            return eConnectAppEntities.tblMailConfigurations.ToList();
        }

        public tblMailConfiguration GetMailConfigurationByID(int id)
        {
            return eConnectAppEntities.tblMailConfigurations.Find(id);
        }

        public void InsertMailConfiguration(tblMailConfiguration tblMailConfiguration)
        {
            eConnectAppEntities.tblMailConfigurations.Add(tblMailConfiguration);
        }

        public void DeleteMailConfiguration(int id)
        {
            tblMailConfiguration tblMailConfiguration = eConnectAppEntities.tblMailConfigurations.Find(id);
            eConnectAppEntities.tblMailConfigurations.Remove(tblMailConfiguration);
        }

        public void UpdateMailConfiguration(tblMailConfiguration tblMailConfiguration)
        {
            eConnectAppEntities.Entry(tblMailConfiguration).State = EntityState.Modified;
            eConnectAppEntities.SaveChanges();
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
