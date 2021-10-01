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

        public DownloadDocumentDetailModel GetDownloadDocumentByID( int id)
        {
            DownloadDocumentDetailModel objDownloadDocumentDetailModel =new DownloadDocumentDetailModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            { var data= unitOfWork.DownloadDocument.GetDownloadDocumentByID(id);
                objDownloadDocumentDetailModel.Id = data.Id;
                objDownloadDocumentDetailModel.DocumentName = data.DocumentName;
                objDownloadDocumentDetailModel.DocumentPath = data.DocumentPath;
                objDownloadDocumentDetailModel.Status = data.Status;
                objDownloadDocumentDetailModel.Description = data.Description;
                objDownloadDocumentDetailModel.Priority = data.Priority;
                objDownloadDocumentDetailModel.CreatedDate = data.CreatedDate;
                objDownloadDocumentDetailModel.UpdatedDate=data.UpdatedDate;
                return objDownloadDocumentDetailModel;
                
            }
        }
     
        public void InsertDownloadDocument(DownloadDocumentDetailModel DownloadDocumentDetailModel)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblDownloadDetail tblDownloadDetail = new tblDownloadDetail();
                tblDownloadDetail.DocumentName = DownloadDocumentDetailModel.DocumentName;
                tblDownloadDetail.DocumentPath = DownloadDocumentDetailModel.DocumentPath;
                tblDownloadDetail.Description = DownloadDocumentDetailModel.Description;
                tblDownloadDetail.Priority = DownloadDocumentDetailModel.Priority;
                tblDownloadDetail.Status = Convert.ToBoolean(DownloadDocumentDetailModel.DocumentStatus);
                tblDownloadDetail.CreatedDate = DateTime.Now;
                tblDownloadDetail.UpdatedDate = DateTime.Now;
                unitOfWork.DownloadDocument.InsertDownloadDocument(tblDownloadDetail);

            }
        }


        public void UpdateDownloadDocument(DownloadDocumentDetailModel DownloadDocumentDetailModel)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblDownloadDetail tblDownloadDetail = new tblDownloadDetail();
                tblDownloadDetail.Id = DownloadDocumentDetailModel.Id;
                tblDownloadDetail.DocumentName = DownloadDocumentDetailModel.DocumentName;
                tblDownloadDetail.DocumentPath = DownloadDocumentDetailModel.DocumentPath;
                tblDownloadDetail.Description = DownloadDocumentDetailModel.Description;
                tblDownloadDetail.Priority = DownloadDocumentDetailModel.Priority;
                tblDownloadDetail.Status = Convert.ToBoolean(DownloadDocumentDetailModel.Status);            
                tblDownloadDetail.UpdatedDate = DateTime.Now;
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
