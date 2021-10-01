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

        public GalleryCategoryModel GetGalleryDocumentByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                GalleryCategoryModel GalleryCategoryModel = new GalleryCategoryModel();
                var data = unitOfWork.GalleryDocument.GetGalleryDocumentByID(id);
                GalleryCategoryModel.Id = data.Id;
                GalleryCategoryModel.CategoryTittle = data.CategoryTittle;
                GalleryCategoryModel.CategoryImagesPath = data.CategoryImagesPath;
                GalleryCategoryModel.Priority = data.Priority;
                GalleryCategoryModel.Status = data.Status;
                return GalleryCategoryModel;
            }
        }

        public void InsertGalleryDocument(GalleryCategoryModel GalleryCategoryModel)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblGalleryCategory tblGalleryCategory = new tblGalleryCategory();
                tblGalleryCategory.CategoryTittle = GalleryCategoryModel.CategoryTittle;
                tblGalleryCategory.CategoryImagesPath = GalleryCategoryModel.CategoryImagesPath;
                tblGalleryCategory.Priority = GalleryCategoryModel.Priority;
                tblGalleryCategory.Status = GalleryCategoryModel.Status;
                tblGalleryCategory.CreatedDate = DateTime.Now;
                tblGalleryCategory.UpdatedDate = DateTime.Now;
                unitOfWork.GalleryDocument.InsertGalleryDocument(tblGalleryCategory);
            }
        }


        public void UpdateGalleryDocument(GalleryCategoryModel GalleryCategoryModel)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblGalleryCategory tblGalleryCategory = new tblGalleryCategory();
                tblGalleryCategory.CategoryTittle = GalleryCategoryModel.CategoryTittle;
                tblGalleryCategory.CategoryImagesPath = GalleryCategoryModel.CategoryImagesPath;
                tblGalleryCategory.Priority = GalleryCategoryModel.Priority;
                tblGalleryCategory.Status = GalleryCategoryModel.Status;               
                tblGalleryCategory.UpdatedDate = DateTime.Now;
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
