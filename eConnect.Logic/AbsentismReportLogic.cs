using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using eConnect.DataAccess;
using eConnect.Model;


namespace eConnect.Logic
{
    public  class AbsentismReportLogic
    {
        public IList<tblAbsentismReport> GetAbsentismReportsSearch(string CSP, string Requestedfromdte, string Requestedtodte, string Type, int AbsFrom, int AbsTo, int Ctecount)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.AbsentismReport.GetAbsentismReportsSearch(CSP, Requestedfromdte, Requestedtodte, Type, AbsFrom, AbsTo, Ctecount).ToList();
            }
               
        }
    }
}
