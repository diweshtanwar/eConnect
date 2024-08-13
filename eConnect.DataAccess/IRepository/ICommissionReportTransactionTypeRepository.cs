using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public interface ICommissionReportTransactionTypeRepository : IRepository<tblCommissionReportTransactionType>
    {
        IList<tblCommissionReportTransactionType> GetAllCommissionTransactionType();
        tblCommissionReportTransactionType GetTransactionTypeByID(int TransactionTypeId);
        void InsertTransactionType(tblCommissionReportTransactionType TransactionType);
        void UpdateTransactionType(tblCommissionReportTransactionType TransactionType);
        void DeleteRecordCommissionTransactionType(int id);
        IList<tblCommissionReportTransactionType> GetAllCommissionTransactionTypeByCycleId(int cycleid);
        void Save();
    }

    //******************************************10 July ****************************************************************************
    public interface ICommissionReportTransactionTypeRuralRepository : IRepository<tblCommissionReportTransactionTypeRural>
    {
        IList<tblCommissionReportTransactionTypeRural> GetAllCommissionTransactionTypeRural();
        tblCommissionReportTransactionTypeRural GetTransactionTypeRuralByID(int TransactionTypeRId);
        void InsertTransactionTypeRural(tblCommissionReportTransactionTypeRural TransactionTypeR);
        void UpdateTransactionTypeRural(tblCommissionReportTransactionTypeRural TransactionTypeR);
        void DeleteRecordCommissionTransactionTypeRural(int id);

        IList<tblCommissionReportTransactionTypeRural> GetAllCommissionTransactionTypeRuralByCycleId(int cycleid);
        void Save();
    }


    public interface ITransactionTypeCycleRepository : IRepository<tblTransactionTypeCycle>
    {
        IList<tblTransactionTypeCycle> GetAllCommissionTransactionTypeCycle();
        tblTransactionTypeCycle GetTransactionTypeCycleByID(int CycleId);
        void InsertTransactionTypeCycle(tblTransactionTypeCycle CycleId);
        void UpdateTransactionTypeCycle(tblTransactionTypeCycle CycleId);
        void DeleteRecordCommissionTransactionTypeCycle(int CycleId);
        void Save();
    }
}
