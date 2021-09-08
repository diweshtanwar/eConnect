using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.DataAccess
{
    public  class AbsentismReportRepository: Repository<tblAbsentismReport>, IAbsentismReport
    {
        public AbsentismReportRepository(eConnectAppEntities appcontext) : base(appcontext)
        {

        }

        public eConnectAppEntities eConnectAppEntities
        {
            get { return new eConnectAppEntities(); }
        }

        public IList<tblAbsentismReport> GetAbsentismReportsSearch(string CSP, string Requestedfromdte, string Requestedtodte, string Type, int AbsFrom, int AbsTo, int Ctecount)
        {
           
            if (!string.IsNullOrEmpty(CSP) && AbsFrom == 0 && AbsTo == 0 && Ctecount ==0)
            {
                eConnectAppEntities.sp_Get_AbsentismReportDetails(CSP, Convert.ToDateTime(Requestedfromdte).ToString("yyyy-MM-dd"), Convert.ToDateTime(Requestedtodte).ToString("yyyy-MM-dd"), AbsFrom, AbsTo, Type, Ctecount, "1");
            }
            else if (AbsFrom != 0 && AbsTo != 0 )
            {
                
                eConnectAppEntities.sp_Get_AbsentismReportDetails(CSP, Convert.ToDateTime(Requestedfromdte).ToString("yyyy-MM-dd"), Convert.ToDateTime(Requestedtodte).ToString("yyyy-MM-dd"), AbsFrom, AbsTo, Type, Ctecount, "3");
            }
            else if (Ctecount != 0 )
            {
                eConnectAppEntities.sp_Get_AbsentismReportDetails(CSP, Convert.ToDateTime(Requestedfromdte).ToString("yyyy-MM-dd"), Convert.ToDateTime(Requestedtodte).ToString("yyyy-MM-dd"), AbsFrom, AbsTo, Type, Ctecount, "4");
            }
            else if(!string.IsNullOrEmpty(Requestedfromdte) && !string.IsNullOrEmpty(Requestedtodte))
            {
                eConnectAppEntities.sp_Get_AbsentismReportDetails(CSP, Convert.ToDateTime(Requestedfromdte).ToString("yyyy-MM-dd"), Convert.ToDateTime(Requestedtodte).ToString("yyyy-MM-dd"), AbsFrom, AbsTo, Type, Ctecount, "5");
            }
            return eConnectAppEntities.tblAbsentismReports.ToList();
        }
    }
}
