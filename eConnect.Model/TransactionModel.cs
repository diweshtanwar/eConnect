using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using System.Web;

namespace eConnect.Model
{
    public class TransactionModel
    {
    }

    public class Deposit
    {
        public string Receipt { get; set; }
        public int Amount { get; set; }

        public string FileName { get; set; }
    }
    public class Withdraw
    {
        public string WStatus { get; set; }
        public int WAmount { get; set; }
        public Int64 AccDetails { get; set; }
    }
}
