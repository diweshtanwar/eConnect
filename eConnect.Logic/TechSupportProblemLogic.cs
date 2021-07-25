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
                var TechSupportReq = unitOfWork.RaiseRequest.GetTechDetail().ToList();
                return TechSupportReq;
            }
        }

        public IList<tblTechRequest> GetTechDetailsSearch(int Requestid, int RequestType, string Requesteddte, string Completiondte)
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                var result = unitOfWork.RaiseRequest.GetTechDetail().ToList();

                if (Requestid != 0)
                {
                    result = result.Where(d => d.TechRequestId == Requestid).ToList();
                }
                if (RequestType != 0)
                {
                    result = result.Where(d => d.ProblemType == RequestType).ToList();
                }
                if (!string.IsNullOrEmpty(Requesteddte))
                {

                    result = result.Where(d => d.RequestedDate == Convert.ToDateTime(Requesteddte)).ToList();
                }
                if (!string.IsNullOrEmpty(Completiondte))
                {
                    result = result.Where(d => d.CompletionDate == Convert.ToDateTime(Completiondte)).ToList();
                }

                return result;
            }
        }
        public long InsertTechSupportRequest(TechSupportRequest model, int UserId)
        {
            var dateAndTime = DateTime.Now;
            var date = dateAndTime.Date;
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblTechRequest sr = new tblTechRequest();
                sr.ProblemType = model.TechProblemType;
                sr.Description = model.Description;
                sr.AttachmentSource = model.Screenshot != null
                            ? Path.GetFileName(model.Screenshot.FileName).ToString() : null;
                sr.MobileNo = model.PhoneNumber.ToString();
                sr.AnyDeskDetail = model.AnyDeskDetail;
                sr.Status = model.Status;
                sr.CreatedBy = UserId;
                sr.RequestedDate = date;
                sr.CreatedDate= DateTime.Now;
                sr.CompletionDate = null;
                sr.UpdatedDate = DateTime.Now;
                unitOfWork.TechSupportRequestss.Add(sr);
                 long id = sr.TechRequestId;
                return id;
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

        public TechSupportRequest GetTechSupportRequestsByTReqId(long ReqID)
        {
           
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                TechSupportRequest sr = new TechSupportRequest();
                var tblTechRequest = unitOfWork.TechSupportRequestss.GetTechRequestByTReqId(Convert.ToInt64(ReqID));
                sr.TechProblemType = Convert.ToInt32(tblTechRequest.ProblemType);
                sr.Description = tblTechRequest.Description;
                sr.AnyDeskDetail = tblTechRequest.AnyDeskDetail;
                sr.PhoneNumber =tblTechRequest.MobileNo;
                sr.Status = Convert.ToInt32(tblTechRequest.Status);
                sr.Screenpic = tblTechRequest.AttachmentSource;
                sr.ID = Convert.ToInt32(tblTechRequest.TechRequestId);
                return sr;
            }
           
        }
        public void UpdateTechSupportRequest(TechSupportRequest model,int Id)
        {
           
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                tblTechRequest sr = unitOfWork.TechSupportRequestss.GetTechRequestByTReqId(Convert.ToInt64(model.ID));
                sr.ProblemType = model.TechProblemType;
                sr.Description = model.Description;
                sr.MobileNo = model.PhoneNumber.ToString();
                sr.Status = model.Status;
                sr.AnyDeskDetail = model.AnyDeskDetail;
                sr.AttachmentSource = model.Screenshot != null
                                  ? Path.GetFileName(model.Screenshot.FileName).ToString() : model.Screenpic; ;
                sr.UpdatedDate = DateTime.Now;
                sr.UpdatedBy =Id ;
                unitOfWork.TechSupportRequestss.Update(sr);
            }
        }
    }
}
