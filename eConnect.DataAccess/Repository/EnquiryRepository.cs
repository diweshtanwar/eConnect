using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class EnquiryRepository : Repository<tblEnquiry>, IEnquiryRepository
    {

        public EnquiryRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();
  
        public IList<tblEnquiry> GetAllEnquiry()
        {
            return eConnectAppEntities.tblEnquiries.ToList();
        }

        public IEnumerable<tblEnquiry> GetEnquiry()
        {
            return eConnectAppEntities.tblEnquiries.ToList();
        }

        public tblEnquiry GetEnquiryByID(int id)
        {
            return eConnectAppEntities.tblEnquiries.Find(id);
        }

        public void InsertEnquiry(tblEnquiry tblEnquiry)
        {
            eConnectAppEntities.tblEnquiries.Add(tblEnquiry);
        }

        public void DeleteEnquiry(int id)
        {
            tblEnquiry tblEnquiry = eConnectAppEntities.tblEnquiries.Find(id);
            eConnectAppEntities.tblEnquiries.Remove(tblEnquiry);
        }

        public void UpdateEnquiry(tblEnquiry tblEnquiry)
        {
            eConnectAppEntities.Entry(tblEnquiry).State = EntityState.Modified;
            eConnectAppEntities.SaveChanges();
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
