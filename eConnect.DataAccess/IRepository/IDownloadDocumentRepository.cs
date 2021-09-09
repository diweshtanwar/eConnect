using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IDownloadDocumentRepository : IRepository<tblDownloadDetail>
    {
        IList<tblDownloadDetail> GeAllDownloadDocument();
        IEnumerable<tblDownloadDetail> GetDownloadDocument();
        tblDownloadDetail GetDownloadDocumentByID(int id);
        void InsertDownloadDocument(tblDownloadDetail tblDownloadDetail);
        void UpdateDownloadDocument(tblDownloadDetail tblDownloadDetail);
        void DeleteDownloadDocument(int id);
        void Save();
    }
}
