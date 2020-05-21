## hypothesis

**TeamPSD data consumers can use RStudio as a viable IDE (Integrated Development Environment) for interacting with MTL data.**

 1. Integrates seemliness with the R language and the R interpreter
 2.  The R is an Object Oriented scripting language used predominantly by the scientific community for its robust statistical packages and visualization
 3. R is part of an open source platform with numerous contributors
 4. RStudio integrates well with the GitHub platform and can be used to create GitHub Actions
 5. **RStudio can be integrated seamlessly with SQL Server databases used by the TeamPSD platform**

The focus of the documents in this folder is on **item #5**. The objective is to demonstrate the viability of using **RStudio** as a medium for establishing an **"end-to-end data lineage"** view starting from the data extraction point (**VA CDW data warehouse**) to the data consumption point (**R datasets and visualizations**). Easy access to end-to-end data lineage is critical when validating and certifying extracted data and the transformation functions operating on that data throughout its journey to an endpoint. 

**Who should test it:**.
The hypothesis can be tested by those who are stakeholders in the validity of data used in a research, which includes data owners, data engineers and modelers, data analysts, data validators, data stewards, data scientists and  support personnel.     

**Why:** Why should those users test your **hypothesis**
Data stakeholders would examine the feasibility and availability of the proposed solution and prototype from the perspective of their own usage. 

 1. Is the solution simple enough to use or does it have a steep
    learning curve?
    
 2. Does the solution address the tester's current
    requirements?  
    
 3. Does the solution close any of the tester's requirement
    gaps?  
    
 4. Does the tester consider the solution scalable enough to
    potentially meet his/her future needs?

**How**: How to provide feedback

a) **written:**
Tester can leave a ".md" markdown file in this folder with the following naming convention, <user first_mid_last name>_<date: mmddyyyy>.md. 

example: ash_nazarizadeh_05_31_2020.md  
 
b) **observational:**
User can leave a video of his/her experience with the instruction provide in this folder. 
 
 **Where:** Where is this prototype on **GitHub**?
prototype files are located in this folder and the steps to be followed are enumerated in the file names as follows:

|step  |can skip  |
|--|--|
|step 1-what do you need to get started|Y  |
|step 2-setting up SQL Server|Y  |
|step 3-setting up R and RStudio|Y  |
|step 4-setting up ODBC  |Y  |
|step 5-how to consume SQL Server data in RStudio using R Notebooks |Y  |
|step 6-R datasets and visualizations |Y  |
|step 7-putting it altogether   |Y  |

**When:** When should they provide **feedback** for it to be 
Please provide your feedback by 05/31/2020.
