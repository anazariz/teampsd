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

**Microsoft SQL Server** is a **Relational Database Management System (RDBMS)**. As an **RDBMS**, it is a software product with the primary function of storing and retrieving data as requested by other software applications, which may run either on the same computer or on another computer across a network, including the Internet. CDW was built on SQL Server. 

Although not the only choice, majority of SQL Server users, including **Database Administrators (DBA)** use a Microsoft tool called **SQL Server Management Studio (SSMS)** to interact with the RDBMS. 

Following is a simplistic view of the components of SQL Server. 

![SQL_SERVER](https://user-images.githubusercontent.com/39805164/82942471-d9491e00-9f4c-11ea-8c9c-df1f8bd3a7f6.jpg)

**2. Current Data Platform** 

In our scripts we use a lot of **Temp Tables** to store intermediate results. Although Temp Tables can help break up long queries into smaller, more managable chuncks, they have a single database-session lifetime. Once your current connection to the database ends, the Temp Table data has to be reconstructed from scratch. As shown below, if f6() has dependency on previous transformations, all parent dependencies have to be recreated so that f6() can be reconstructed. Another challenage is that RStudio, as our critical IDE (Integrated Development Platform), consumes data is from extracted CSV files rather than directly from the database. So the problems to be solved are:

 1. Each time a new data element is needed from CDW, a new extract has to be created
 2. **End-to-End Visibility** from the point data is extracted (CDW) to the point data is consumed (RStudio) is difficult to establish 

![SQL_SERVER_2](https://user-images.githubusercontent.com/39805164/83077225-d40ed080-a02b-11ea-86a6-aba7b83f4c68.jpg)

**3. Two Enhancement Methods**  

1-When a connection is made to the database the session must be kept alive during the run or the temporary results are lost. A **Stored Procedure** acts as a single container that can keep the Temp Table results intact while the script (now residing in a Stored Procedure) is running. While this does not resolve the dependency problem, it improved the overall process. This method is suitable for production jobs that need to execute from beginning to end such as monthly jobs.

![SQL_SERVER_3](https://user-images.githubusercontent.com/39805164/83077237-da9d4800-a02b-11ea-8912-cc02ea5a1aa3.jpg)

2-Intermediate **Views** can be used to eliminate the dependency issue. Once built, each view is always live and can be queried for view into intermediate results. This method is suitable if intermediate results have to examined.

![SQL_SERVER_4](https://user-images.githubusercontent.com/39805164/83077245-de30cf00-a02b-11ea-8bdc-eb0235dfb4f1.jpg)

**4. Enhanced Data Platform** 

Data Consumers can interact with the database in **Real-time** via **ODBC (open database connectivity)**. R Datasets can be constructed using Real-Time data and **End-to-End Visibility** is achieved.

![SQL_SERVER_5](https://user-images.githubusercontent.com/39805164/83078045-809d8200-a02d-11ea-872b-724dfe5d6843.jpg)
 
 **5. End-to=End Data Lineage Visibility** 

SQL and R code and results can be views side by side in RStudio. This will result visibility into how data was extracted, transformed and consumed (in datasets and visuals).

![SQL_SERVER_6](https://user-images.githubusercontent.com/39805164/82942459-d64e2d80-9f4c-11ea-8ebc-422ca5100d8d.jpg)

**6. Transportable Code** 

SQL code can be tested in SQL Server Management Studio (SSMS) and copied to RStudio.

![SQL_SERVER_7](https://user-images.githubusercontent.com/39805164/82942464-d817f100-9f4c-11ea-9600-ef2b25205a71.jpg)
