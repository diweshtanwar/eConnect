using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using eConnect.Model;
using System.Configuration;

namespace eConnect.Model
{
    public class EmailNotification
    {
        string Email = ConfigurationManager.AppSettings["Emailid"].ToString();
        string Pass = ConfigurationManager.AppSettings["Password"].ToString();

        public void SendEmail(string ToMailAddress, int Type, UserCSPDetail CSPDetail, string Amtount, string Depositdate, string TechMobile, string ProblemType, string AuthorizedAmount)
        {
            try
            {
                string Subject_Withdrawal = "LIMIT TRANSFER(WITHDRAWAL) REQUEST";
                string Subject_Deposit = "LIMIT UPDATE(DEPOSIT) REQUEST";
                string Subject_Tech = "TECHNICAL SUPPORT REQUEST";
                string Subject_MngWithdrawal = "LIMIT TRANSFER (WITHDRAWAL) REQUEST CLOSED";
                string Subject_MngDeposit = " LIMIT UPDATE (DEPOSIT) REQUEST CLOSED";
                string MailSubject = "", htmlString = "";
                string Footer = "Regards,<br>E - Gramin Services<br>39, Sapta Swahid Path, Dispur, Guwahati<br>Assam - 06";

                decimal Amount = Convert.ToDecimal(Amtount);
                if (Type == 1)//Withdrawl
                {
                    MailSubject = Subject_Withdrawal;
                    htmlString = "<html><body> Hi ,<br> <br>You have a Limit Transfer request. Details are mentioned below -  <br><br>Name : " + CSPDetail.CSPName + "<br>KO ID : " + CSPDetail.CSPCode + "<br>Amount : " + Math.Round(Amount, 2) + "<br>A/c No : " + CSPDetail.BankAccount + "<br>Branch Code : " + CSPDetail.BranchCode + " <br><br>" + Footer + "</body></html>";
                }
                if (Type == 2)//Deposit
                {
                    MailSubject = Subject_Deposit;
                    htmlString = "<html><body> Hi ,<br><br>You have a Limit Update request. Details are mentioned below -  <br><br>Name : " + CSPDetail.CSPName + "<br>KO ID:" + CSPDetail.CSPCode + " <br>Amount : " + Math.Round(Amount, 2) + "<br>Branch Code : " + CSPDetail.BranchCode + " <br>Deposit Date :" + Depositdate + "<br><br>" + Footer + "</body></html>";

                }
                if (Type == 3)//Tech
                {
                    MailSubject = Subject_Tech;
                    htmlString = "<html><body> Hi ,<br><br>You have a Technical Support request. Details are mentioned below  -  <br><br>Name : " + CSPDetail.CSPName + "<br>KO ID : " + CSPDetail.CSPCode + "<br>Contact No : " + TechMobile + "<br>Problem Type:" + ProblemType + "<br><br>" + Footer + "</body></html>";

                }
                if (Type == 4)//ManageWithdrawl
                {
                    MailSubject = Subject_MngWithdrawal;
                    htmlString = "<html><body> Hi " + CSPDetail.CSPName + " , <br><br> Your withdrawal request of " + Math.Round(Amount, 2) + " is authorized and transferred " + AuthorizedAmount + "to " + CSPDetail.BankAccount + " .<br><br>For any complaints.Kindly contact your BC <br><br>" + Footer + "</body></html>";
                }
                if (Type == 5)//ManageDeposit
                {
                    MailSubject = Subject_MngDeposit;
                    htmlString = "<html><body> Hi " + CSPDetail.CSPName + " , <br><br>Your Deposit request of " + Math.Round(Amount, 2) + " is authorized and updated to your holding. <br><br>For any complaints.Kindly contact your BC <br><br>" + Footer + "</body></html>";

                }
                if (Type == 6)//ManageTech
                {
                    MailSubject = Subject_Tech;
                    htmlString = "<html><body> Hi " + CSPDetail.CSPName + " , <br><br>Your support request for " + ProblemType + " is closed. <br><br>For any complaints.Kindly contact your BC <br><br>" + Footer + "</body></html>";

                }
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress(Email);
                message.To.Add(new MailAddress(ToMailAddress));
                message.Subject = MailSubject;
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = htmlString;
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential(Email, Pass);
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);

            }
            catch (Exception ex) { }
        }
    }
}