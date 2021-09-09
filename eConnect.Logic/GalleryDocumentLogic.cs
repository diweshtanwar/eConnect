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
    public class GalleryDocumentLogic
    {
        public IList<tblGalleryCategory> GeAllGalleryDocument()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.GalleryDocument.GeAllGalleryDocument().ToList();
            }
        }

        public tblGalleryCategory GetGalleryDocumentByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.GalleryDocument.GetGalleryDocumentByID(id);
            }
        }

        public void InsertGalleryDocument(tblGalleryCategory tblGalleryCategory)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.GalleryDocument.InsertGalleryDocument(tblGalleryCategory);
            }
        }


        public void UpdateGalleryDocument(tblGalleryCategory tblGalleryCategory)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.GalleryDocument.UpdateGalleryDocument(tblGalleryCategory);
            }
        }

        public void DeleteGalleryDocument(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.GalleryDocument.DeleteGalleryDocument(id);
            }
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.GalleryDocument.Save();

            }
        }
    }
}
