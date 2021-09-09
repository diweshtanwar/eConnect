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
   public class DownloadDocumentLogic
    {
        public IList<tblDownloadDetail> GeAllDownloadDocument()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.DownloadDocument.GeAllDownloadDocument().ToList();
               
            }
        }

        public tblDownloadDetail GetApplicationSettingByID( int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
               return unitOfWork.DownloadDocument.GetDownloadDocumentByID(id);
                
            }
        }
     
        public void InsertDownloadDocument(tblDownloadDetail tblDownloadDetail)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.DownloadDocument.InsertDownloadDocument(tblDownloadDetail);

            }
        }


        public void UpdateDownloadDocument(tblDownloadDetail tblDownloadDetail)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.DownloadDocument.UpdateDownloadDocument(tblDownloadDetail);
            }
        }

        public void DeleteSubMainWithMenuMenu(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.DownloadDocument.DeleteDownloadDocument(id);
            }
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.DownloadDocument.Save();

            }
        }
    }
}
