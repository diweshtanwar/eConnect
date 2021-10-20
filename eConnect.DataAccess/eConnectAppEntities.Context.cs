﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace eConnect.DataAccess
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class eConnectAppEntities : DbContext
    {
        public eConnectAppEntities()
            : base("name=eConnectAppEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblAnnouncement> tblAnnouncements { get; set; }
        public virtual DbSet<tblApplicationSetting> tblApplicationSettings { get; set; }
        public virtual DbSet<tblBranchCode> tblBranchCodes { get; set; }
        public virtual DbSet<tblBusiness> tblBusinesses { get; set; }
        public virtual DbSet<tblCategory> tblCategories { get; set; }
        public virtual DbSet<tblCity> tblCities { get; set; }
        public virtual DbSet<tblCommissionReport> tblCommissionReports { get; set; }
        public virtual DbSet<tblCommissionReportMain> tblCommissionReportMains { get; set; }
        public virtual DbSet<tblCommissionReportMonthly> tblCommissionReportMonthlies { get; set; }
        public virtual DbSet<tblCommissionReportNew> tblCommissionReportNews { get; set; }
        public virtual DbSet<tblCommissionReportTransactionType> tblCommissionReportTransactionTypes { get; set; }
        public virtual DbSet<tblConfiguration> tblConfigurations { get; set; }
        public virtual DbSet<tblCountry> tblCountries { get; set; }
        public virtual DbSet<tblDepartment> tblDepartments { get; set; }
        public virtual DbSet<tblDepositRequest> tblDepositRequests { get; set; }
        public virtual DbSet<tblDesignation> tblDesignations { get; set; }
        public virtual DbSet<tblDocument> tblDocuments { get; set; }
        public virtual DbSet<tblDownloadDetail> tblDownloadDetails { get; set; }
        public virtual DbSet<tblEducation> tblEducations { get; set; }
        public virtual DbSet<tblErrorLog> tblErrorLogs { get; set; }
        public virtual DbSet<tblFolderDetail> tblFolderDetails { get; set; }
        public virtual DbSet<tblFolderImageDetail> tblFolderImageDetails { get; set; }
        public virtual DbSet<tblGalleryCategory> tblGalleryCategories { get; set; }
        public virtual DbSet<tblHoliday> tblHolidays { get; set; }
        public virtual DbSet<tblLatestNew> tblLatestNews { get; set; }
        public virtual DbSet<tblLocation> tblLocations { get; set; }
        public virtual DbSet<tblMailConfiguration> tblMailConfigurations { get; set; }
        public virtual DbSet<tblMenuMain> tblMenuMains { get; set; }
        public virtual DbSet<tblMenuSub> tblMenuSubs { get; set; }
        public virtual DbSet<tblNotification> tblNotifications { get; set; }
        public virtual DbSet<tblProblemType> tblProblemTypes { get; set; }
        public virtual DbSet<tblReportType> tblReportTypes { get; set; }
        public virtual DbSet<tblRequestType> tblRequestTypes { get; set; }
        public virtual DbSet<tblRoleMaster> tblRoleMasters { get; set; }
        public virtual DbSet<tblScreen> tblScreens { get; set; }
        public virtual DbSet<tblScreenRole> tblScreenRoles { get; set; }
        public virtual DbSet<tblState> tblStates { get; set; }
        public virtual DbSet<tblStatu> tblStatus { get; set; }
        public virtual DbSet<tblTechRequest> tblTechRequests { get; set; }
        public virtual DbSet<tblUploader> tblUploaders { get; set; }
        public virtual DbSet<tblUserCSPDetail> tblUserCSPDetails { get; set; }
        public virtual DbSet<tblUserDetail> tblUserDetails { get; set; }
        public virtual DbSet<tblUser> tblUsers { get; set; }
        public virtual DbSet<tblUserStatu> tblUserStatus { get; set; }
        public virtual DbSet<tblWebFeedback> tblWebFeedbacks { get; set; }
        public virtual DbSet<tblWithdrawalRequest> tblWithdrawalRequests { get; set; }
        public virtual DbSet<tblAbsentismReport> tblAbsentismReports { get; set; }
        public virtual DbSet<tblHolidaysMaster> tblHolidaysMasters { get; set; }
        public virtual DbSet<tblUserLoginLog> tblUserLoginLogs { get; set; }
        public virtual DbSet<tblEnquiry> tblEnquiries { get; set; }
        public virtual DbSet<tblBusinessDetailReport> tblBusinessDetailReports { get; set; }
    
        public virtual int sp_DeleteRequest(Nullable<int> id, Nullable<int> type)
        {
            var idParameter = id.HasValue ?
                new ObjectParameter("Id", id) :
                new ObjectParameter("Id", typeof(int));
    
            var typeParameter = type.HasValue ?
                new ObjectParameter("Type", type) :
                new ObjectParameter("Type", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_DeleteRequest", idParameter, typeParameter);
        }
    
        public virtual int sp_DeleteUploadedReport(Nullable<int> uploadedId, Nullable<int> statusID, Nullable<int> reportType)
        {
            var uploadedIdParameter = uploadedId.HasValue ?
                new ObjectParameter("UploadedId", uploadedId) :
                new ObjectParameter("UploadedId", typeof(int));
    
            var statusIDParameter = statusID.HasValue ?
                new ObjectParameter("StatusID", statusID) :
                new ObjectParameter("StatusID", typeof(int));
    
            var reportTypeParameter = reportType.HasValue ?
                new ObjectParameter("ReportType", reportType) :
                new ObjectParameter("ReportType", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_DeleteUploadedReport", uploadedIdParameter, statusIDParameter, reportTypeParameter);
        }
    
        public virtual ObjectResult<sp_GetAppMenuWithSubMenu_Result> sp_GetAppMenuWithSubMenu(Nullable<int> roleId)
        {
            var roleIdParameter = roleId.HasValue ?
                new ObjectParameter("RoleId", roleId) :
                new ObjectParameter("RoleId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetAppMenuWithSubMenu_Result>("sp_GetAppMenuWithSubMenu", roleIdParameter);
        }
    
        public virtual ObjectResult<sp_GetBusinessReportByYearMonthandCSPCode_Result> sp_GetBusinessReportByYearMonthandCSPCode(Nullable<int> year, Nullable<int> month, string cSPCode, string cSPCategory)
        {
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            var monthParameter = month.HasValue ?
                new ObjectParameter("Month", month) :
                new ObjectParameter("Month", typeof(int));
    
            var cSPCodeParameter = cSPCode != null ?
                new ObjectParameter("CSPCode", cSPCode) :
                new ObjectParameter("CSPCode", typeof(string));
    
            var cSPCategoryParameter = cSPCategory != null ?
                new ObjectParameter("CSPCategory", cSPCategory) :
                new ObjectParameter("CSPCategory", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetBusinessReportByYearMonthandCSPCode_Result>("sp_GetBusinessReportByYearMonthandCSPCode", yearParameter, monthParameter, cSPCodeParameter, cSPCategoryParameter);
        }
    
        public virtual ObjectResult<sp_GetCommissionReportByYearMonthandCSPName_Result> sp_GetCommissionReportByYearMonthandCSPName(Nullable<int> year, Nullable<int> month, string cSPCode)
        {
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            var monthParameter = month.HasValue ?
                new ObjectParameter("Month", month) :
                new ObjectParameter("Month", typeof(int));
    
            var cSPCodeParameter = cSPCode != null ?
                new ObjectParameter("CSPCode", cSPCode) :
                new ObjectParameter("CSPCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetCommissionReportByYearMonthandCSPName_Result>("sp_GetCommissionReportByYearMonthandCSPName", yearParameter, monthParameter, cSPCodeParameter);
        }
    
        public virtual ObjectResult<sp_GetCommissionReportByYearMonthandCSPName_Test_Result> sp_GetCommissionReportByYearMonthandCSPName_Test(Nullable<int> year, Nullable<int> month, string cSPCode)
        {
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            var monthParameter = month.HasValue ?
                new ObjectParameter("Month", month) :
                new ObjectParameter("Month", typeof(int));
    
            var cSPCodeParameter = cSPCode != null ?
                new ObjectParameter("CSPCode", cSPCode) :
                new ObjectParameter("CSPCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetCommissionReportByYearMonthandCSPName_Test_Result>("sp_GetCommissionReportByYearMonthandCSPName_Test", yearParameter, monthParameter, cSPCodeParameter);
        }
    
        public virtual ObjectResult<sp_GetManageDepositRequestDetails_Result> sp_GetManageDepositRequestDetails()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetManageDepositRequestDetails_Result>("sp_GetManageDepositRequestDetails");
        }
    
        public virtual ObjectResult<sp_GetManageTechSupportRequestDetails_Result> sp_GetManageTechSupportRequestDetails()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetManageTechSupportRequestDetails_Result>("sp_GetManageTechSupportRequestDetails");
        }
    
        public virtual ObjectResult<sp_GetManageWithdrawalRequestDetails_Result> sp_GetManageWithdrawalRequestDetails()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetManageWithdrawalRequestDetails_Result>("sp_GetManageWithdrawalRequestDetails");
        }
    
        public virtual ObjectResult<sp_GetMonthlyCommissionReportByYearMonthandCSPCode_Result> sp_GetMonthlyCommissionReportByYearMonthandCSPCode(Nullable<int> year, Nullable<int> month, string cSPCode)
        {
            var yearParameter = year.HasValue ?
                new ObjectParameter("Year", year) :
                new ObjectParameter("Year", typeof(int));
    
            var monthParameter = month.HasValue ?
                new ObjectParameter("Month", month) :
                new ObjectParameter("Month", typeof(int));
    
            var cSPCodeParameter = cSPCode != null ?
                new ObjectParameter("CSPCode", cSPCode) :
                new ObjectParameter("CSPCode", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<sp_GetMonthlyCommissionReportByYearMonthandCSPCode_Result>("sp_GetMonthlyCommissionReportByYearMonthandCSPCode", yearParameter, monthParameter, cSPCodeParameter);
        }
    
        public virtual int sp_PublishCommissionReport(Nullable<int> uploaderId)
        {
            var uploaderIdParameter = uploaderId.HasValue ?
                new ObjectParameter("UploaderId", uploaderId) :
                new ObjectParameter("UploaderId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_PublishCommissionReport", uploaderIdParameter);
        }
    
        public virtual int sp_Get_AbsentismReportDetails(string cSPCode, string startDate, string endDate, Nullable<int> absentismCountFrom, Nullable<int> absentismCountFTo, string reportType, Nullable<int> continueos, string filterType)
        {
            var cSPCodeParameter = cSPCode != null ?
                new ObjectParameter("CSPCode", cSPCode) :
                new ObjectParameter("CSPCode", typeof(string));
    
            var startDateParameter = startDate != null ?
                new ObjectParameter("StartDate", startDate) :
                new ObjectParameter("StartDate", typeof(string));
    
            var endDateParameter = endDate != null ?
                new ObjectParameter("EndDate", endDate) :
                new ObjectParameter("EndDate", typeof(string));
    
            var absentismCountFromParameter = absentismCountFrom.HasValue ?
                new ObjectParameter("AbsentismCountFrom", absentismCountFrom) :
                new ObjectParameter("AbsentismCountFrom", typeof(int));
    
            var absentismCountFToParameter = absentismCountFTo.HasValue ?
                new ObjectParameter("AbsentismCountFTo", absentismCountFTo) :
                new ObjectParameter("AbsentismCountFTo", typeof(int));
    
            var reportTypeParameter = reportType != null ?
                new ObjectParameter("ReportType", reportType) :
                new ObjectParameter("ReportType", typeof(string));
    
            var continueosParameter = continueos.HasValue ?
                new ObjectParameter("Continueos", continueos) :
                new ObjectParameter("Continueos", typeof(int));
    
            var filterTypeParameter = filterType != null ?
                new ObjectParameter("FilterType", filterType) :
                new ObjectParameter("FilterType", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("sp_Get_AbsentismReportDetails", cSPCodeParameter, startDateParameter, endDateParameter, absentismCountFromParameter, absentismCountFToParameter, reportTypeParameter, continueosParameter, filterTypeParameter);
        }
    }
}
