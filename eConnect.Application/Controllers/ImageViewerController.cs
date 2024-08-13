using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace eConnect.Application.Controllers
{
    public class ImageViewerController : Controller
    {
        string CSPFilePath = ConfigurationManager.AppSettings["CSPFilePath"].ToString();
        string UserFilePath = ConfigurationManager.AppSettings["UserFilePath"].ToString();
        string DepositFilePath = ConfigurationManager.AppSettings["DepositFilePath"].ToString();
        string TechFilePath = ConfigurationManager.AppSettings["TechFilePath"].ToString();
        public ActionResult GetImage(string Type, string File)
        {
            string dir = "";
            if (Request.UrlReferrer == null)
            {
                var html = "<html><body><center><h2 style =" + "color:red;" + "> Access Denied !!</h2></center></body></html>";
                return Content(html, "text/html");
            }
            else
            {
                if (Type.Trim() == "CSP")
                {
                  dir = CSPFilePath.Remove(0, 1);
                }
                if (Type.Trim() == "User")
                {
                    dir = UserFilePath.Remove(0, 1);
                }
                if (Type.Trim() == "Deposit")
                {
                    dir = DepositFilePath.Remove(0, 1);
                }
                if (Type.Trim() == "DepositIndex") 
                {
                    dir = string.Empty;
                }
                if (Type.Trim() == "TechIndex") 
                {
                    dir = string.Empty;
                }
                if (Type.Trim() == "Tech")
                {
                    dir = TechFilePath.Remove(0, 1);
                }
                //var dir = Server.MapPath("/UploadedFiles");
                var path = dir + File.Trim();
                return base.File(path, "image/jpeg");
            }

        }   
        
    }
}