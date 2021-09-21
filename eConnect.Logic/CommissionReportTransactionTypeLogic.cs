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
   public class CommissionReportTransactionTypeLogic
    {
        public IList<tblCommissionReportTransactionType> GetAllTransactionType()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.TransactionTypes.GetAllCommissionTransactionType().ToList();

            }
        }

        public tblCommissionReportTransactionType GetTransactionTypeByID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.TransactionTypes.GetTransactionTypeByID(id);

            }
        }
        public void UpdateTransactionType(CommissionReportTransactionTypeModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.TransactionTypes.Find(x => x.CommissionReportTransactionTypeId == model.CommissionReportTransactionTypeId).FirstOrDefault();
                data.Name = model.Name;
                data.HOCommission = model.HOCommission;
                data.CSPCommission = model.CSPCommission;
                data.Status = model.Status;
                 unitOfWork.TransactionTypes.Update(data);
                unitOfWork.TransactionTypes.Save();
            }
        }
        public void Save()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                unitOfWork.TransactionTypes.Save();

            }
        }

        public int InsertTransactionType(CommissionReportTransactionTypeModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblCommissionReportTransactionType TransType = new tblCommissionReportTransactionType();
                TransType.Name = model.Name;
                TransType.HOCommission = model.HOCommission;
                TransType.CSPCommission = model.CSPCommission;
                TransType.Status = model.Status;
                unitOfWork.TransactionTypes.Add(TransType);
                int id = TransType.CommissionReportTransactionTypeId;
                return id;
            }

        }
        public void DeleteTransationType(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {

                unitOfWork.TransactionTypes.DeleteRecordCommissionTransactionType(id);

            }
        }
    }
    }
