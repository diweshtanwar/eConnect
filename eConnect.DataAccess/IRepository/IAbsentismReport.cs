using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace eConnect.DataAccess
{
    public interface IAbsentismReport
    {
        IList<tblAbsentismReport> GetAbsentismReportsSearch(string CSP, string Requestedfromdte, string Requestedtodte, string Type, int AbsFrom, int AbsTo, int Ctecount);
    }
}
