using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class DownloadDocumentRepository : Repository<tblDownloadDetail>, IDownloadDocumentRepository
    {

        public DownloadDocumentRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();
        //public eConnectAppEntities eConnectAppEntities
        //{
        //    get { return new eConnectAppEntities(); }
        //}

        public IList<tblDownloadDetail> GeAllDownloadDocument()
        {
            return eConnectAppEntities.tblDownloadDetails.ToList();
        }

        public IEnumerable<tblDownloadDetail> GetDownloadDocument()
        {
            return eConnectAppEntities.tblDownloadDetails.ToList();
        }

        public tblDownloadDetail GetDownloadDocumentByID(int id)
        {
            return eConnectAppEntities.tblDownloadDetails.Find(id);
        }

        public void InsertDownloadDocument(tblDownloadDetail tblDownloadDetail)
        {
            eConnectAppEntities.tblDownloadDetails.Add(tblDownloadDetail);
            Save();
        }

        public void DeleteDownloadDocument(int id)
        {
            tblDownloadDetail tblDownloadDetail = eConnectAppEntities.tblDownloadDetails.Find(id);
            eConnectAppEntities.tblDownloadDetails.Remove(tblDownloadDetail);
        }

        public void UpdateDownloadDocument(tblDownloadDetail tblDownloadDetail)
        {
            eConnectAppEntities.Entry(tblDownloadDetail).State = EntityState.Modified;
            Save();
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
