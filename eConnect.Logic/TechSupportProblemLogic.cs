using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using eConnect.DataAccess;
using eConnect.Model;

namespace eConnect.Logic
{
    public class TechSupportProblemLogic
    {
        public IList<tblProblemType> GetAllTechSupportProblems()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var TechSupportProb = unitOfWork.TechSupportProblemss.GetAll().ToList();
                return TechSupportProb;
            }
        }
    }


    public class TechSupportRequestLogic
    {
        public IEnumerable<tblUser> GetUsersInfoByStatus(int id)
        {
            UsersModel um = new UsersModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var usersList = unitOfWork.Userss.GetAllUsersByStatus(id).ToList();
                if (usersList != null)
                {
                    foreach (var item in usersList)
                    {
                        um.UserID = item.UserId;
                        //um.CSPName = item.tblCSPDetails.CSPName;
                        //um.StateID = item.StateID;
                        //um.EMailID = item.EMailID;
                        //um.CityID = item.CityID;
                        //um.CityName = item.City.CityName;
                        //um.StateName = item.State.StateName;
                        //um.CountryName = item.Country.CountryName;
                    }
                }
                return usersList;
            }
        }

        public IList<tblTechRequest> GetAllTechSupportRequests()
        {
            TechSupportRequestModel sr = new TechSupportRequestModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var TechSupportReq = unitOfWork.TechSupportRequestss.GetAll().ToList();
                foreach (var model in TechSupportReq)
                {
                    //sr.TechProblemTypeID = model.TechProblemTypeID;
                    //sr.Description = model.Description;
                    //sr.Screenshot = model.Screenshot;
                    //sr.MobileNumber = model.MobileNumber;
                    //sr.DeskDetail = model.DeskDetail;
                    //sr.UserID = model.UserID;
                    //sr.UserName = model.User.CSPName;
                    //sr.TechProbName = model.TechSupportProblem.TechProblemName;


                }
                return TechSupportReq;
            }
        }
        public void InsertTechSupportRequest(TechSupportRequestModel model)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblTechRequest sr = new tblTechRequest();
                //  sr.TechProblemTypeID = model.TechProblemTypeID;
                sr.Description = model.Description;
                //sr.Screenshot = model.Screenshot;
                //sr.MobileNumber = model.MobileNumber;
                //sr.DeskDetail = model.DeskDetail;
                //sr.UserID = model.UserID;
                unitOfWork.TechSupportRequestss.Add(sr);
            }
        }
        public IList<tblTechRequest> GetAllTechSupportRequestsByFilter(string ReqID, string CSPName, string CSPID, string Reqtype, string Status, string From, string To)
        {
            TechSupportRequestModel sr = new TechSupportRequestModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var TechSupportReq = unitOfWork.TechSupportRequestss.GetAll().ToList();

                if (!string.IsNullOrEmpty(ReqID))
                {
                    TechSupportReq = TechSupportReq.Where(m => m.TechRequestId == Convert.ToInt64(ReqID)).ToList();
                }
                if (!string.IsNullOrEmpty(CSPName))
                {
                    //    TechSupportReq = TechSupportReq.Where(m => m.tblUser.CSPName == CSPName).ToList();
                }
                if (!string.IsNullOrEmpty(CSPID))
                {
                    TechSupportReq = TechSupportReq.Where(m => m.RaisedBy == Convert.ToInt64(CSPID)).ToList();
                }
                if (!string.IsNullOrEmpty(Reqtype))
                {
                    if (Reqtype == "1")
                    {
                        CultureInfo culture = new CultureInfo("en-US");
                        DateTime ToDate = Convert.ToDateTime(To, culture);
                        DateTime FromDate = Convert.ToDateTime(From, culture);
                        DateTime addDate = ToDate.AddDays(1);

                        //if (ToDate == FromDate)
                        //{
                        //    TechSupportReq = TechSupportReq.Where(i => Convert.ToDateTime(i.RequestedDate) >= Convert.ToDateTime(FromDate) &&
                        //                 Convert.ToDateTime(i.RequestedDate) <= Convert.ToDateTime(addDate)).ToList();
                        //}
                        //else
                        //{
                        TechSupportReq = TechSupportReq.Where(i => Convert.ToDateTime(i.RequestedDate) >= Convert.ToDateTime(FromDate) &&
          Convert.ToDateTime(i.RequestedDate) <= Convert.ToDateTime(ToDate)).ToList();
                        // }

                    }

                    else
                    {
                        TechSupportReq = TechSupportReq.Where(m => m.RequestedDate == Convert.ToDateTime(To)).ToList();
                    }
                }
                if (!string.IsNullOrEmpty(Status) && Status != "--Select--")
                {
                    TechSupportReq = TechSupportReq.Where(m => m.Status == Convert.ToInt32(Status)).ToList();
                }
                foreach (var model in TechSupportReq)
                {
                    sr.ProblemType = model.ProblemType;
                    sr.TechSupportReqID = model.TechRequestId;
                    sr.Description = model.Description;
                    //  sr.Screenshot = model.Screenshot;
                    sr.MobileNo = model.MobileNo;
                    //sr.DeskDetail = model.DeskDetail;
                    //sr.RaisedByName = model.tblUserCSPDetail.CSPCode;
            ////        sr.StatusName = model.tblStatu.Name;
                   // sr.RaisedByName = model.tblUser.UserName;
                    //  sr.UserName = model.User.CSPName;
                    //sr.TechProbName = model.tblProblemType.Name;
                }
                return TechSupportReq;
            }
        }

        public tblTechRequest GetTechSupportRequestsByTReqId(long ReqID)
        {
            TechSupportRequestModel sr = new TechSupportRequestModel();
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var model = unitOfWork.TechSupportRequestss.GetTechRequestByTReqId(Convert.ToInt64(ReqID));
                if (model != null)
                {
                   // foreach (var model in TechSupportReq)
                    {
                        sr.ProblemType = model.ProblemType;
                        sr.TechSupportReqID = model.TechRequestId;
                        sr.Description = model.Description;
                        //  sr.Screenshot = model.Screenshot;
                        sr.MobileNo = model.MobileNo;
                        //sr.DeskDetail = model.DeskDetail;
                        //sr.RaisedByName = model.tblUserCSPDetail.CSPCode;
                     ////   sr.StatusName = model.tblStatu.Name;
                        // sr.RaisedByName = model.tblUser.UserName;
                        //  sr.UserName = model.User.CSPName;
                        //sr.TechProbName = model.tblProblemType.Name;
                        sr.ResolutionDetail = model.ResolutionDetail;
                    }
                    return model;
                }
                else
                {
                    return null;
                }
            }
        }
        public void UpdateTechSupportRequest(TechSupportRequestModel model)
        {
           
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblTechRequest sr = unitOfWork.TechSupportRequestss.GetTechRequestByTReqId(Convert.ToInt64(model.TechSupportReqID));
                sr.TechRequestId = model.TechSupportReqID;
                 sr.ProblemType = model.ProblemType;
                sr.Summary = model.Summary;
                sr.Description = model.Description;
                sr.MobileNo = model.MobileNo;
                 sr.Status = (byte)model.Status;
                sr.ResolutionDetail = model.ResolutionDetailx;
                unitOfWork.TechSupportRequestss.Update(sr);
            }
        }



    }
}
