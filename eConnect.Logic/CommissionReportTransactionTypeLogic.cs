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
                data.CycleID = model.CycleID;
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
                TransType.CycleID = model.CycleID;
                unitOfWork.TransactionTypes.Add(TransType);
                int id = TransType.CommissionReportTransactionTypeId;

                return id;
            }

        }


        public IList<tblCommissionReportTransactionType> GetTransactionTypeByCycleID(int id)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.TransactionTypes.GetAllCommissionTransactionTypeByCycleId(id);

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


/// <summary>
/// /
/// </summary>
public class CommissionReportTransactionTypeRuralLogic
{
    public IList<tblCommissionReportTransactionTypeRural> GetAllTransactionTypeRural()
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            return unitOfWork.TransactionTypesRural.GetAllCommissionTransactionTypeRural().ToList();

        }
    }

    public tblCommissionReportTransactionTypeRural GetTransactionTypeRuralByID(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            return unitOfWork.TransactionTypesRural.GetTransactionTypeRuralByID(id);

        }
    }

    public IList<tblCommissionReportTransactionTypeRural> GetTransactionTypeRuralByCycleID(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            return unitOfWork.TransactionTypesRural.GetAllCommissionTransactionTypeRuralByCycleId(id);

        }
    }
    public void UpdateTransactionTypeRural(CommissionReportTransactionTypeRuralModel model)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            var data = unitOfWork.TransactionTypesRural.Find(x => x.CommissionReportTransactionTypeId == model.CommissionReportTransactionTypeId).FirstOrDefault();
            data.Name = model.Name;
            data.HOCommission = model.HOCommission;
            data.CSPCommission = model.CSPCommission;
            data.Status = model.Status;
            data.CycleID = model.CycleID;

            unitOfWork.TransactionTypesRural.Update(data);
            unitOfWork.TransactionTypesRural.Save();
        }
    }
    public void Save()
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            unitOfWork.TransactionTypesRural.Save();

        }
    }

    public int InsertTransactionTypeRural(CommissionReportTransactionTypeRuralModel model)
    {
        int id = 0;
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {


            tblCommissionReportTransactionTypeRural TransTypeRural = new tblCommissionReportTransactionTypeRural();
            TransTypeRural.Name = model.Name;
            TransTypeRural.HOCommission = model.HOCommission;
            TransTypeRural.CSPCommission = model.CSPCommission;
            TransTypeRural.Status = model.Status;
            TransTypeRural.CycleID = model.CycleID;
            
            unitOfWork.TransactionTypesRural.Add(TransTypeRural);
            id = TransTypeRural.CommissionReportTransactionTypeId;

        }
        return id;


    }
    public void DeleteTransationTypeRural(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {

            unitOfWork.TransactionTypesRural.DeleteRecordCommissionTransactionTypeRural(id);

        }
    }




}

public class TransactionTypeCycleLogic
{
    public IList<tblTransactionTypeCycle> GetAllCommissionTransactionTypeCycle()
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            return unitOfWork.TransactionTypeCycle.GetAllCommissionTransactionTypeCycle().ToList();

        }
    }

    public tblTransactionTypeCycle GetTransactionTypeCycleByID(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            return unitOfWork.TransactionTypeCycle.GetTransactionTypeCycleByID(id);

        }
    }
    public void UpdateTransactionTypeRural(TransactionTypeCycleModel model)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            var data = unitOfWork.TransactionTypeCycle.Find(x => x.CycleID == model.CycleID).FirstOrDefault();
            data.CycleName = model.CycleName;

            unitOfWork.TransactionTypeCycle.Update(data);
            unitOfWork.TransactionTypeCycle.Save();
        }
    }
    public void Save()
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            unitOfWork.TransactionTypeCycle.Save();

        }
    }

    public int InsertTransactionTypeRural(TransactionTypeCycleModel model)
    {
        int id = 0;
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {
            tblTransactionTypeCycle TransTypeRural = new tblTransactionTypeCycle();
            TransTypeRural.CycleName = model.CycleName;
            unitOfWork.TransactionTypeCycle.Add(TransTypeRural);
            id = TransTypeRural.CycleID;

        }
        return id;

    }
    public void DeleteTransationTypeRural(int id)
    {
        using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
        {

            unitOfWork.TransactionTypeCycle.DeleteRecordCommissionTransactionTypeCycle(id);

        }
    }
}