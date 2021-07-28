using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using eConnect.DataAccess;

namespace eConnect.Logic
{
    public class CountryLogic
    {
        public IList<tblCountry> GetAllCountry()
        {
          //  IList<Country> country = null;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var data = unitOfWork.Countriess.GetAllCountry().ToList();
                //foreach (var item in dsds)
                //{
                //    item.CountryID;
                //    country.CountryName = item.CountryName;
                //}
                return data;
            }
        }
    }
}
