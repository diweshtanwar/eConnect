using eConnect.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace eConnect.Logic
{
  public  class EmailLogic
    {
        public static tblMailConfiguration GetActiveMailConfiguration()
        {
            using (var unitOfWork = new UnitOfWork(new eConnectAppEntities()))
            {
                return unitOfWork.Emails.GetAllMailConfiguration().Where(d => d.Status == true).FirstOrDefault();

            }
        }
        public  void SendEmail(string emailToAddress, string subject, string body)
        {
            try
            {
                tblMailConfiguration tblMailConfiguration = GetActiveMailConfiguration();              
                string smtpAddress = tblMailConfiguration.SmtpAddress;
                int portNumber = Convert.ToInt32(tblMailConfiguration.PortNumber);
                bool enableSSL = Convert.ToBoolean(tblMailConfiguration.EnableSSL);
                string emailFromAddress = tblMailConfiguration.EmailFromAddress;
                string password = tblMailConfiguration.Password;               
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(emailFromAddress);
                    mail.To.Add(emailToAddress);
                    //mail.Bcc.Add(emailBccAddress);
                    mail.Subject = subject;
                    mail.Body = body;
                    mail.IsBodyHtml = Convert.ToBoolean(tblMailConfiguration.IsBodyHtml);
                    if (tblMailConfiguration.IsNeedToSendAttachments == true)
                    {
                        mail.Attachments.Add(new Attachment(tblMailConfiguration.AttachmentsPath));
                    }

                    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
                    {
                        smtp.Credentials = new NetworkCredential(emailFromAddress, password);
                        smtp.EnableSsl = enableSSL;
                        smtp.Send(mail);
                    }
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
