using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WinSCP;

namespace eConnect.Application.Controllers
{
    public class TestController : Controller
    {
        // GET: Test
        public ActionResult Index()
        {
            var UploadMyFiles = UploadFileWinscp();
            return View();
        }
        public ActionResult IndexImage()
        {
            return View();
        }

        /// Upload File to Specified FTP Url with username and password and Upload Directory
        //  if need to upload in sub folders ///
        ///Base FtpUrl of FTP Server
        ///Local Filename to Upload
        ///Username of FTP Server
        ///Password of FTP Server
        ///[Optional]Specify sub Folder if any
        /// Status String from Server
         public static string UploadFileWinscp()
        {
            // Setup session options
            SessionOptions sessionOptions = new SessionOptions
            {
                Protocol = Protocol.Ftp,
                HostName = "eConnect.anonyans.com",
                UserName = "econnect.anonyans",
                Password = "*-8zF3bU2HwsK8",
                //SshHostKeyFingerprint = "ssh-rsa 2048 xxxxxxxxxxx...="
            };

            using (Session session = new Session())
            {
                // Connect
                session.Open(sessionOptions);

                // Upload files
                TransferOptions transferOptions = new TransferOptions();
                transferOptions.TransferMode = TransferMode.Binary;

                TransferOperationResult transferResult;
                transferResult =
                    session.PutFiles(@"C:\Users\diwes\Desktop\1.png", "/UploadedFiles/Test/", false, transferOptions);

                // Throw on any error
                transferResult.Check();

                // Print results
                
                foreach (TransferEventArgs transfer in transferResult.Transfers)
                {
                    Console.WriteLine("Upload of {0} succeeded", transfer.FileName);
                }
            }

            return "";
        }
        public static string UploadFile()
        {
            WebClient client = new WebClient();
            client.Credentials = new NetworkCredential("eConnect.anonyans.com", "*-8zF3bU2HwsK8");
            client.UploadFile(
                "ftp://eConnect.anonyans.com", @"C:\Users\diwes\Desktop\1.png");
            string FtpUrl = "eConnect.anonyans.com";
            string fileName = @"C:\Users\diwes\Desktop\1.png";
            string userName = "econnect.anonyans";
            string password = "*-8zF3bU2HwsK8";
            string UploadDirectory = "/UploadedFiles";
            string PureFileName = new FileInfo(fileName).Name;
            String uploadUrl = String.Format("{0}{1}/{2}", FtpUrl, UploadDirectory, PureFileName);
            FtpWebRequest req = (FtpWebRequest)FtpWebRequest.Create(uploadUrl);
            req.Proxy = null;
            req.Method = WebRequestMethods.Ftp.UploadFile;
            req.Credentials = new NetworkCredential(userName, password);
            req.UseBinary = true;
            req.UsePassive = true;
            byte[] data = System.IO.File.ReadAllBytes(fileName);
            req.ContentLength = data.Length;
            Stream stream = req.GetRequestStream();
            stream.Write(data, 0, data.Length);
            stream.Close();
            FtpWebResponse res = (FtpWebResponse)req.GetResponse();
            return res.StatusDescription;
        }

        /// Download File From FTP Server ///
        ///Base url of FTP Server
        ///if file is in root then write FileName Only if is in use like "Dir1/Dir2/filename.ext"
        ///Username of FTP Server
        ///Password of FTP Server
        ///Folderpath where you want to Download the File
        /// Status String from Server
        public static string DownloadFile(string FtpUrl, string FileNameToDownload,
                            string userName, string password, string tempDirPath)
        {
            string ResponseDescription = "";
            string PureFileName = new FileInfo(FileNameToDownload).Name;
            string DownloadedFilePath = tempDirPath + "/" + PureFileName;
            string downloadUrl = String.Format("{0}/{1}", FtpUrl, FileNameToDownload);
            FtpWebRequest req = (FtpWebRequest)FtpWebRequest.Create(downloadUrl);
            req.Method = WebRequestMethods.Ftp.DownloadFile;
            req.Credentials = new NetworkCredential(userName, password);
            req.UseBinary = true;
            req.Proxy = null;
            try
            {
                FtpWebResponse response = (FtpWebResponse)req.GetResponse();
                Stream stream = response.GetResponseStream();
                byte[] buffer = new byte[2048];
                FileStream fs = new FileStream(DownloadedFilePath, FileMode.Create);
                int ReadCount = stream.Read(buffer, 0, buffer.Length);
                while (ReadCount > 0)
                {
                    fs.Write(buffer, 0, ReadCount);
                    ReadCount = stream.Read(buffer, 0, buffer.Length);
                }
                ResponseDescription = response.StatusDescription;
                fs.Close();
                stream.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            return ResponseDescription;
        }

        public static bool DisplayImageFileFromServer(string remotePath)
        {
            // The serverUri parameter should start with the ftp:// scheme.
            //if (serverUri.Scheme != Uri.UriSchemeFtp)
            //{
            //    return false;
            //}
            // Get the object used to communicate with the server.
            WebClient request = new WebClient();
            string ftp = "ftp://eConnect.anonyans.com";
            // This example assumes the FTP site uses anonymous logon.
            request.Credentials = new NetworkCredential("econnect.anonyans", "*-8zF3bU2HwsK8");
            try
            {
                byte[] newFileData = request.DownloadData(ftp + remotePath);
                string fileString = System.Text.Encoding.UTF8.GetString(newFileData);

            }
            catch (WebException e)
            {
                return false;
            }
            return true;
        }
    }
}