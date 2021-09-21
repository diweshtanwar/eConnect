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
        void Save();
    }
}
