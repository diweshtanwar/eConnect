using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace eConnect.DataAccess
{
      public class CommissionReportTransactionTypeRepository : Repository<tblCommissionReportTransactionType>, ICommissionReportTransactionTypeRepository
    {
        public CommissionReportTransactionTypeRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();
      

        public IList<tblCommissionReportTransactionType> GetAllCommissionTransactionType()
        {
            return eConnectAppEntities.tblCommissionReportTransactionTypes.ToList();
        }

        public tblCommissionReportTransactionType GetTransactionTypeByID(int id)
        {
            return eConnectAppEntities.tblCommissionReportTransactionTypes.Find(id);
        }

        public void InsertTransactionType(tblCommissionReportTransactionType TransactionType)
        {
            eConnectAppEntities.tblCommissionReportTransactionTypes.Add(TransactionType);
        }

        public void DeleteRecordCommissionTransactionType(int TransactionTypeId)
        {
            tblCommissionReportTransactionType TransactionType = eConnectAppEntities.tblCommissionReportTransactionTypes.Find(TransactionTypeId);
            eConnectAppEntities.tblCommissionReportTransactionTypes.Remove(TransactionType);
        }

        public void UpdateTransactionType(tblCommissionReportTransactionType TransactionType)
        {
            eConnectAppEntities.Entry(TransactionType).State = EntityState.Modified;
        }
        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}