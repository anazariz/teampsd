<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600"> 
     
## prototype

This document explain the steps involved in this prototype and the instructions  for completing those steps

Please note that some steps can be skipped within the VA environment, with access to VA databases, R and RStudio.  

|step  |can skip?  |
|--|--|
|step 1-what you need to get started|Y  |
|step 2-setting up SQL Server|Y  |
|step 4-setting up R and RStudio|Y  |
|step 3-setting up ODBC  |N  |
|step 5-how to consume SQL Server data in RStudio |N  |


**step 1-what you need to get started**

To complete the testing of this prototype we will need SQL Server, SQL Server Management Studio (SSMS), a working SQL Server database, ODBC, R, RStudio and several R Package.  

**step 2-setting up SQL Server**

![attention](https://user-images.githubusercontent.com/39805164/82708362-e86d5a80-9c32-11ea-8361-9b78d9ddeaf8.png)

**Please DO NOT download or install SQL Server, SQL Server Management Studio, R and RStudio on a VA machine.** 

SQL Server can be downloaded [here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads). 

Choose **SQL Server 2019 on-premises** for your Operating system version. This will be a test database instance and can be removed from your machine when this exercise is complete. Please follow the installation procedures provided on the site. 

Once the installation of the SQL Server is complete, the installation process will ask you if you want to install the SQL Server Management Studio (SSMS). As we will need that component to interact with the database, please install it as well. Don't worry if you forget to install SSMS because it can be installed separately as well. 

Now you'll need a sample data database, which you can find [here](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15).

Download [AdventureWorksDW2017.bak](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak).

Once you've downloaded the file, please follow the instruction on that site to restore the database into the SQL Server you just installed.  
Login to the server and make sure that you see a database in the 
**SSMS Object Explorer** (left side panel of SSMS).

**step 3-setting up ODBC**

Please choose "User DSN" instead of "System DSN" as instructed in the following links. Name your User DSN: R_SQL_SERVER. 

For Windows follow [these instructions](https://www.firehousesoftware.com/webhelp/FHCADMonitor/Content/InstallationGuide/03_Create64-bitODBCDataSource.htm).

For MAC follow [these instructions](http://dcx.sap.com/1200/en/dbadmin/connect-s-3731160.html). 

**step 4-setting up R and RStudio**  

Download and install the latest version of R for your version of Operating System from [here](https://www.r-project.org/).  

Download and install the latest version of RStudio for your version of Operating System from [here](https://rstudio.com/).  

