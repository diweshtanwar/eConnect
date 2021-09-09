using eConnect.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.Model;
using System.Web;

namespace eConnect.Logic
{
    public class EnquiryLogic
    {
        public IList<tblEnquiry> GetAllEnquiry()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.Enquiries.GetAllEnquiry().ToList();

            }
        }

        public tblEnquiry GetEnquiryByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.Enquiries.GetEnquiryByID(id);

            }
        }

        public void InsertEnquiry(tblEnquiry tblEnquiry)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Enquiries.InsertEnquiry(tblEnquiry);

            }
        }


        public void UpdateEnquiry(tblEnquiry tblEnquiry)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblEnquiry.UpdatedDate = DateTime.Now;
                tblEnquiry.UpdatedBy= HttpContext.Current.Session["UserId"].ToString();
                tblEnquiry.Status = true;
                unitOfWork.Enquiries.UpdateEnquiry(tblEnquiry);
            }
        }

        public void DeleteEnquiry(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Enquiries.DeleteEnquiry(id);
            }
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.Enquiries.Save();

            }
        }
    }
}
