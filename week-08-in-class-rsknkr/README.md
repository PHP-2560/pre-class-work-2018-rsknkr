

## SQL

We will have 2 stages of lab today. The first stage will be to practice SQL. Then you use RStudio to access a database. 


You will have to turn in the following:


- Screenshot to prove SQL Teaching complete.
- Complete titanic database lab.

***All of These must be knit into the same document and turned in.***


## Stage 1

For this stage complete the course at:

- [SQL Teaching](https://www.sqlteaching.com/)




## Stage 2


For this stage, I have created an RStudio Server for all of you to use. You can access this server:

- [rstudio.sullivanstatistics.com](https://rstudio.sullivanstatistics.com)

For sign in:

- **Username**: is your github username
- **Password**: everyone has the same password: password


For the setup of this, I have created a database called titanic. The goal will be to use this lab to work on the titanic dataset. The code below will let you connect to the database. Create a Markdown with the following code and work through the lab. 

```{R}
library(RMySQL)
con2 <- dbConnect(MySQL(),
                 user = 'testing',
                 password = 'password',
                 host = '127.0.0.1',
                 dbname='titanic')
```

We can run any of these commands as follow:

```
query <- "show tables;" # This will be your SQL command
dbGetQuery(con, query) # This sends the command to the SQL server
```


1. What tables are in this database?


2. Load the titanic data:

```{r}
titanic <- read.table("/home/php2511/titanic.csv", header=TRUE, sep=",")
```

3. Create a table in MySQL from this data. Name it `titanic_yourlastname`:

```{r}
dbWriteTable(con, "titanic_yourlastname", titanic)
```

4. Now what tables are in this database?



### Basic usage of commands

We will start to use a list of commands that would be commonly used in MySQL:

These are:

- show tables;
- describe titanic_yourlastname;
- select name, pclass, age, sex from titanic limit 10;
 




Try these commands and test this out. 


### R and MySQL

5. Run the following SQL command. Before doing so describe what this is asking
```
select pclass, survived, avg(age) as avg_age from titanic_yourlastname   
   group by pclass, survived;
```


6.  Run the following SQL command. Before doing so describe what this is asking
```
select pclass, survived, avg(age) as avg_age from titanic_yourlastname
   where survived=1
   group by pclass, survived;
```


7. Run the following SQL command. Before doing so describe what this is asking
```
select name, pclass, survived, age from titanic_yourlastname 
   where name regexp '^.sen.+';
   ```

8. Run the following SQL command. Before doing so describe what this is asking
```
select name, pclass, survived, age from titanic_yourlastname 
   where name regexp 'Jakob.*$';
```

9.  Run the following SQL commands. What is different about them? What do they return?
```
select name, pclass, survived, age from titanic_yourlastname 
   where name regexp 'Ivar.*$';
   ```
   
```
select name, pclass, survived, age from titanic_yourlastname 
   where name regexp ',.*Ivar.*$';
```


10. We can also plot data from this:
```{r}
myQuery <- "select pclass, avg(fare) as avg_fare from titanic_yourlastname
              group by pclass;"
myData <- dbGetQuery(con, myQuery)
library(ggplot2)
ggplot(myData, aes(pclass, avg_fare)) + geom_bar(stat="identity")
```



### More challenging

11. Create a data frame with:
- `pclass`
- `sex`
- `age`
- `fare`
- `survived`
- `parch`
Only for people who did not survive. 

12. Create a graph of the average survival over the different classes. Make two distinct lines for male and female passengers. Create this plot using ggplot. 




