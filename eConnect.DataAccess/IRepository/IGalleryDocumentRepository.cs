using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface IGalleryDocumentRepository : IRepository<tblGalleryCategory>
    {
        IList<tblGalleryCategory> GeAllGalleryDocument();
        IEnumerable<tblGalleryCategory> GetGalleryDocument();
        tblGalleryCategory GetGalleryDocumentByID(int id);
        void InsertGalleryDocument(tblGalleryCategory tblGalleryCategory);
        void UpdateGalleryDocument(tblGalleryCategory tblGalleryCategory);
        void DeleteGalleryDocument(int id);
        void Save();
    }
}
