# Install the DuckDB R package like so: R CMD INSTALL tools/rpkg
# The DuckDB R interface follows the R DBI specification
library("DBI")

# create a DuckDB driver, either as a temporary in-memory database (default) or with a file 
drv <- duckdb::duckdb(":memory:")

# create a connection, you can have many of those
con <- dbConnect(drv)

# write a data.frame to the database
dbWriteTable(con, "iris", iris)

# now we have a table called mtcars with the contents of the data frame
dbListTables(con)
dbListFields(con, "iris")

# we can read the entire table back into R
iris2 <- dbReadTable(con, "iris")

# we can also run arbitray SQL commands on this table
iris3 <- dbGetQuery(con, 'SELECT "Species", MIN("Sepal.Width") FROM iris GROUP BY "Species"')

# delete the table again
dbRemoveTable(con, "iris")

# close the connection
dbDisconnect(con)

# shutdown the database 
duckdb::duckdb_shutdown(drv)