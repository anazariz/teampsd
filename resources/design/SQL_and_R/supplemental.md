<img src = "https://github.com/lzim/teampsd/blob/teampsd_style/teampsd_logo/team_psd_logo_sm.png"
     height = "200" width = "600"> 

## supplemental

 1. What is SQL Server
 2. Current Data Platform
 3. Two Enhancement Methods
 4. Enhanced Data Platform
 5. End-to=End Data Lineage Visibility
 6. Transportable Code

**1. What is SQL Server**  

**Microsoft SQL Server** is a **Relational Database Management System (RDBMS)** developed by Microsoft. As an **RDBMS**, it is a software product with the primary function of storing and retrieving data as requested by other software applications, which may run either on the same computer or on another computer across a network, including the Internet. CDW is build on SQL Server. 

Although not the only choice, majority of SQL Server users, including **Database Administrators (DBA)** use a Microsoft tool called **SQL Server Management Studio (SSMS)** to interact with the DBMS. 

Following is a simplistic view of the components of SQL Server. 

![SQL_SERVER](https://user-images.githubusercontent.com/39805164/82762705-5f336080-9db7-11ea-9390-3bbf781b5437.jpg)

**2. Current Data Platform** 

In our scripts we use a lot of **Temp Tables** to store intermediate results. Temp Tables have a single database-session lifetime. Once your current connection to the database ends, the Temp Table data has to be reconstructed from scratch. As shown below, if f6() has dependency on previous transformations, all parent dependencies have to be recreated so that f6() can be reconstructed. Also, within RStudio, as our critical IDE (Integrated Development Platform) the data is consumed from extracted CSV files. So the problems to be solved are:

 1. Each time a new data element is needed from CDW, a new extract has to be created
 2. An **End-to-End Visibility** from the point data is extracted (CDW) to the point data is consumed (RStudio) is needed   

![SQL_SERVER_2](https://user-images.githubusercontent.com/39805164/82763248-25645900-9dbb-11ea-97d2-8e5ae84db180.jpg)

**3. Two Enhancement Methods**  

1-When a connection is made to the database the session must be kept alive during the run or the temporary results are lost. A **Stored Procedure** acts as a single container that can keep the Temp Tables results intact while the script (now residing in a Stored Procedure) is running. While this does not resolve the dependency problem, it improved the overall process. This method is suitable for production jobs that need to execute from beginning to end such as monthly jobs.

![SQL_SERVER_3](https://user-images.githubusercontent.com/39805164/82763643-0c10dc00-9dbe-11ea-884e-834ed0fea33a.jpg)

2-Intermediate **Views** can be used to eliminate the dependency issue. Once built, each view is always live and can be queried for view into intermediate results. This method is suitable if intermediate results have to examined.

![SQL_SERVER_4](https://user-images.githubusercontent.com/39805164/82763821-344d0a80-9dbf-11ea-9a5e-3453cff93e47.jpg)

**4. Enhanced Data Platform** 

Data Consumers can interact with the database in **Real-time** via **ODBC (open database connectivity)**. R Datasets can be constructed using Real-Time data and **End-to-End Visibility is achieved.

![SQL_SERVER_5](https://user-images.githubusercontent.com/39805164/82763972-44191e80-9dc0-11ea-8dd1-a02e0b650df7.jpg)
 
 **5. End-to=End Data Lineage Visibility** 

SQL and R code and results can be views side by side in RStudio. This will result visibility into how data was extracted, transformed and consumed (in datasets and visuals).

![SQL_SERVER_6](https://user-images.githubusercontent.com/39805164/82764361-f7831280-9dc2-11ea-8683-070c2e4ba2f7.jpg)

**6. Transportable Code** 

SQL code can be tested in SQL Server Management Studio (SSMS) and copied to RStudio.

![SQL_SERVER_7](https://user-images.githubusercontent.com/39805164/82764502-04543600-9dc4-11ea-9279-be6328450e25.jpg)
