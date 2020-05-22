<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600"> 
     
## prototype

This document explain the steps involved in this prototype and the instructions  for completing those steps

Please note that some steps can be skipped within the VA environment, with access to VA databases.  

|step  |can skip?  |
|--|--|
|step 1-what do you need to get started|Y  |
|step 2-setting up SQL Server|Y  |
|step 3-setting up ODBC  |N  |
|step 4-setting up R and RStudio|N  |
|step 5-how to consume SQL Server data in RStudio |N  |
|step 6-R datasets, Notebooks and visualization |N  |
|step 7-putting it altogether - END-TO-END visibility |N  |

**step 1-what do you need to get started**

To complete the testing of this prototype we will need SQL Server, SQL Server Management Studio (SSMS), a working SQL Server database, ODBC, R, RStudio and several R Package.  

**step 2-setting up SQL Server**

Attention Image
**Please DO NOT download or install SQL Server on a VA machine.** 

SQL Server can be downloaded [here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads). 

Choose **SQL Server 2019 on-premises** for your Operating system version. This will be a test database instance and can be removed from your machine when this exercise is complete. Please follow the installation procedures provided on the site. 

Once the installation of the SQL Server is complete, the installation process will ask you if you want to install the SQL Server Management Studio (SSMS). As we will need that component to interact with the database, please install it as well. Don't worry if you forget to install SSMS because it can be installed separately as well. 

Now you'll need a sample data database, which you can find [here](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15).

Download [AdventureWorksDW2017.bak](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak).

Once you've downloaded the file, please follow the instruction on that site to restore the database into the SQL Server you just installed.  
Login to the server and make sure that you see a database in the 
**SSMS Object Explorer** (left side panel of SSMS).

  
