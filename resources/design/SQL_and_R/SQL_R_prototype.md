<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600"> 
     
## prototype

The objective of this **Prototype** is to establish a minimal connection from RStudio to SQL Server using ODBC.

Notes:

1. If you have access to a VA SQL Server test database, skip step 2
2. If you have a VA R (version 4.0.0) and RStudio installed on your machine, skip step 3
3. steps 6 through 8 provide additional information and are optional
  
Please note that some steps can be skipped within the VA environment, with access to VA databases, R and RStudio.  

| step | can skip? |
|--|--|
|step 1-what you need to get started| N |
|step 2-setting up SQL Server| Y |
|step 3-setting up R and RStudio| Y |
|step 4-setting up ODBC  | N |
|step 5-how to consume SQL Server data in RStudio | N |
**Advanced Optional Steps**
|step 6-supplemental.md file  | Y |
|step 7-SQL_R_prototype.sql file  | Y |
|step 8-SQL_R_prototype.Rmd file | Y |

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

**step 3-setting up R and RStudio**  

Download and install the latest version of R for your version of Operating System from [here](https://www.r-project.org/).  

Download and install the latest version of RStudio for your version of Operating System from [here](https://rstudio.com/).  

**step 4-setting up ODBC**

Please choose "User DSN" instead of "System DSN" as instructed in the following links. Name your User DSN: R_SQL_SERVER. 

For Windows follow [these instructions](https://www.firehousesoftware.com/webhelp/FHCADMonitor/Content/InstallationGuide/03_Create64-bitODBCDataSource.htm).

For MAC follow [these instructions](http://dcx.sap.com/1200/en/dbadmin/connect-s-3731160.html). 

**step 5-how to consume SQL Server data in RStudio**


## Advanced Optional Steps

**step 6-how to consume SQL Server data in RStudio**

The supplemental.md file in this folder talks about the importance of **End-to-End Data Lineage Visibility**. There are no user actions in this file.

**step 7-SQL_R_prototype.sql** 
The SQL_R_prototype.sql file in this folder contains the changes we made to the Microsoft test database to show some advanced concepts in step 8 (RStudio/Shiny). 

 1. In SSMS click "New Query" and in the blank query tab paste the contents of this file. 
 2. Copy the content of the SQL_R_prototype.sql
 3. Paste the content to the New Query tab
 4. Click Execute
 5. Right Click on Views and choose Refresh
 6. Expand Programmability then Right Click on Stored Procedures and choose Refresh  
You should now see the new views and stored procedures you just created.

**step 8-SQL_R_prototype.Rmd** 
Users wanting to dive into additional data capabilities provided by R, RStudio and [Shiny](https://shiny.rstudio.com/)  can complete this step
1. In RStudio click on File choose New File then R Notebook 
 2. Copy the content of the SQL_R_prototype.Rmd
 3. Paste the content into your blank new R Notebook
 4. Establish a database connection as you did in stepss 1 through 5
 5. Click on Run 

Once the script runs, you should be seeing several data output and shiny screen pop up with various data elements and charts (please see a sample out put in step 6. 

If something goes wrong, please check that the following packages are loaded:

 - Base
 - Datasets 
 - Graphics 
 - grDevices 
 - methods 
 - odbc 
 - stats 
 - utils
