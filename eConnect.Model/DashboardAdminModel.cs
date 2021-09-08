using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Model
{
  public class DashboardAdminModel
    {
        public int WithdrawOpenCount { get; set; }      
        public int WithdrawInProgressCount { get; set; }
        public int WithdrawCompletedCount { get; set; }
        public int DepositOpenCount { get; set; }       
        public int DepositInProgressCount { get; set; }
        public int DepositCompletedCount { get; set; }
        public int TechOpenCount { get; set; }
        public int TechInProgressCount { get; set; }
        public int TechCompletedCount { get; set; }
        public int CSPActiveCount { get; set; }
        public int CSPInActiveCount { get; set; }
        public int CSPBlockedCount { get; set; }
        public int CSPTotalCount { get; set; }
        public int UserActiveCount { get; set; }
        public int UserInActiveCount { get; set; }
        public int UserBlockedCount { get; set; }
        public int UserTotalCount { get; set; }
    }
}
