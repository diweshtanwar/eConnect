using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{  
    public interface IEnquiryRepository : IRepository<tblEnquiry>
    {
        IList<tblEnquiry> GetAllEnquiry();
        IEnumerable<tblEnquiry> GetEnquiry();
        tblEnquiry GetEnquiryByID(int enquiryId);
        void InsertEnquiry(tblEnquiry tblEnquiry);
        void UpdateEnquiry(tblEnquiry tblEnquiry);
        void DeleteEnquiry(int id);       
        void Save();
    }
}
