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
            eConnectAppEntities.SaveChanges();
        }

        public void UpdateTransactionType(tblCommissionReportTransactionType TransactionType)
        {
            eConnectAppEntities.Entry(TransactionType).State = EntityState.Modified;
        }
        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }


        public IList<tblCommissionReportTransactionType> GetAllCommissionTransactionTypeByCycleId(int cycleid)
        {
            return eConnectAppEntities.tblCommissionReportTransactionTypes.Where(x=>x.CycleID==cycleid).ToList();
        }

    }



    public class CommissionReportTransactionTypeRuralRepository : Repository<tblCommissionReportTransactionTypeRural>, ICommissionReportTransactionTypeRuralRepository
    {
        public CommissionReportTransactionTypeRuralRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();


        public IList<tblCommissionReportTransactionTypeRural> GetAllCommissionTransactionTypeRural()
        {
            return eConnectAppEntities.tblCommissionReportTransactionTypeRurals.ToList();
        }

        public tblCommissionReportTransactionTypeRural GetTransactionTypeRuralByID(int id)
        {
            return eConnectAppEntities.tblCommissionReportTransactionTypeRurals.Find(id);
        }
        public IList<tblCommissionReportTransactionTypeRural> GetAllCommissionTransactionTypeRuralByCycleId(int cycleid)
        {
            return eConnectAppEntities.tblCommissionReportTransactionTypeRurals.Where(x => x.CycleID == cycleid).ToList();
        }
        public void InsertTransactionTypeRural(tblCommissionReportTransactionTypeRural TransactionType)
        {
            eConnectAppEntities.tblCommissionReportTransactionTypeRurals.Add(TransactionType);
        }

        public void DeleteRecordCommissionTransactionTypeRural(int TransactionTypeId)
        {
            tblCommissionReportTransactionTypeRural TransactionType = eConnectAppEntities.tblCommissionReportTransactionTypeRurals.Find(TransactionTypeId);
            eConnectAppEntities.tblCommissionReportTransactionTypeRurals.Remove(TransactionType);
            eConnectAppEntities.SaveChanges();
        }

        public void UpdateTransactionTypeRural(tblCommissionReportTransactionTypeRural TransactionType)
        {
            eConnectAppEntities.Entry(TransactionType).State = EntityState.Modified;
        }
        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }








    public class TransactionTypeCycleRepository : Repository<tblTransactionTypeCycle>, ITransactionTypeCycleRepository
    {
        public TransactionTypeCycleRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }
        private eConnectAppEntities eConnectAppEntities = new eConnectAppEntities();


        public IList<tblTransactionTypeCycle> GetAllCommissionTransactionTypeCycle()
        {
            return eConnectAppEntities.tblTransactionTypeCycles.OrderByDescending(x=>x.CycleID).ToList();
        }

        public tblTransactionTypeCycle GetTransactionTypeCycleByID(int id)
        {
            return eConnectAppEntities.tblTransactionTypeCycles.Find(id);
        }

        public void InsertTransactionTypeCycle(tblTransactionTypeCycle TransactionType)
        {
            eConnectAppEntities.tblTransactionTypeCycles.Add(TransactionType);
        }

        public void DeleteRecordCommissionTransactionTypeCycle(int TransactionTypeId)
        {
            tblTransactionTypeCycle TransactionType = eConnectAppEntities.tblTransactionTypeCycles.Find(TransactionTypeId);
            eConnectAppEntities.tblTransactionTypeCycles.Remove(TransactionType);
        }

        public void UpdateTransactionTypeCycle(tblTransactionTypeCycle TransactionType)
        {
            eConnectAppEntities.Entry(TransactionType).State = EntityState.Modified;
        }
        public void Save()
        {
            eConnectAppEntities.SaveChanges();
        }

    }
}
