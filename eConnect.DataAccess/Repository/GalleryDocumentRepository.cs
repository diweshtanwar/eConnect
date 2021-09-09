using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public class GalleryDocumentRepository : Repository<tblGalleryCategory>, IGalleryDocumentRepository
    {

        public GalleryDocumentRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();
   

        public IList<tblGalleryCategory> GeAllGalleryDocument()
        {
            return eConnectAppEntities.tblGalleryCategories.ToList();
        }

        public IEnumerable<tblGalleryCategory> GetGalleryDocument()
        {
            return eConnectAppEntities.tblGalleryCategories.ToList();
        }

        public tblGalleryCategory GetGalleryDocumentByID(int id)
        {
            return eConnectAppEntities.tblGalleryCategories.Find(id);
        }

        public void InsertGalleryDocument(tblGalleryCategory tblGalleryCategory)
        {
            eConnectAppEntities.tblGalleryCategories.Add(tblGalleryCategory);
        }

        public void DeleteGalleryDocument(int id)
        {
            tblGalleryCategory tblGalleryCategory = eConnectAppEntities.tblGalleryCategories.Find(id);
            eConnectAppEntities.tblGalleryCategories.Remove(tblGalleryCategory);
        }

        public void UpdateGalleryDocument(tblGalleryCategory tblGalleryCategory)
        {
            eConnectAppEntities.Entry(tblGalleryCategory).State = EntityState.Modified;
        }

        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
