using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
    public class ReportsModel
    {
    }
    public class TransactionCommissionModel
    {
        public long TransactionCommissionId { get; set; }

        public string Circle { get; set; }

        public string CircleName { get; set; }

        public string BCBF_Code { get; set; }

        public string CSPCode { get; set; }

        public string CSPName { get; set; }

        public string TransactionType { get; set; }

        public decimal NoOfTransactions { get; set; }

        public Nullable<decimal> Commission { get; set; }

        public int UploaderId { get; set; }
    }


    public class DownloadTransactionCommissionModel
    {
        public string CSPCode { get; set; }
        public string CSPName { get; set; }
        public string TransactionType { get; set; }
        [DisplayFormat(DataFormatString= "{0:G10}")]
        public Nullable<decimal> NoOfTransaction { get; set; }
        public decimal Commission { get; set; }
        public decimal CommissionIncludingTDS { get; set; }
        public decimal Commissionpercentage { get; set; }
        public decimal TotalCommission { get; set; }
        public decimal Transaction { get; set; }
        public decimal Incentive { get; set; }
        public decimal Rural { get; set; }
        public string Total { get; set; }
        public decimal TDS { get; set; }
        public decimal PayableToCSP { get; set; }
        public string Message { get; set; }
    }

    public class CommissionReportMonthlyModel
    {
        public long MonthlyCommissionReportID { get; set; }
        public string CSPCode { get; set; }
        public string CSPName { get; set; }
        public string CSPCategory { get; set; }
        public decimal Transation { get; set; }
        public Nullable<decimal> Incentive { get; set; }
        public Nullable<decimal> Rural { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<decimal> TDS { get; set; }
        public Nullable<decimal> PayableToCSP { get; set; }
        public Nullable<decimal> NetPayable { get; set; }
        public Nullable<int> Month { get; set; }
        public Nullable<int> Year { get; set; }
        public int UploaderId { get; set; }
        public string Message { get; set; }

        public Nullable<decimal> TotalTransaction { get; set; }

    }
}
