using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace eConnect.Model
{
  public class CommissionReportTransactionTypeModel
    {
        public int CommissionReportTransactionTypeId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public Nullable<decimal> HOCommission { get; set; }
        [Required]
        public Nullable<decimal> CSPCommission { get; set; }
        public Nullable<bool> Status { get; set; }

        [Required]
        public int CycleID { get; set; }

        public string CycleName { get; set; }

    }

    public class CommissionReportTransactionTypeRuralModel
    {
        public int CommissionReportTransactionTypeId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public Nullable<decimal> HOCommission { get; set; }
        [Required]
        public Nullable<decimal> CSPCommission { get; set; }
        public Nullable<bool> Status { get; set; }

        [Required]
        public int CycleID { get; set; }

    }



    public class TransactionTypeCycleModel
    {
        public int CycleID { get; set; }
        [Required]
        public string CycleName { get; set; }


    }
}
