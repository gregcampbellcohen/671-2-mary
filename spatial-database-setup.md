# PostGIS spatial database installation

# Table of Contents
<!-- MarkdownTOC autolink="true" autoanchor="true" bracket="round" depth=0 -->

- [Overview](#overview)
- [Installation](#installation)
	- [Mac OS install](#mac-os-install)
	- [Windows install](#windows-install)
	- [Ubuntu install](#ubuntu-install)
- [Add data to your spatial database](#add-data-to-your-spatial-database)
- [Tutorials and tweaks](#tutorials-and-tweaks)
- [Resources and references](#resources-and-references)

<!-- /MarkdownTOC -->


# Overview

The goal of this document is to help install a PostgreSQL database server on your local machine with the PostGIS extension. PostgreSQL is a popular, full-featured open source database server and PostGIS is the open source extension that adds spatial capabilities to the server. We refer to the setup as just *PostGIS*. Since it is server that continually runs on your machine, it's a little different than apps like QGIS. Let's outline a couple terms we use before we start the install.

* A **user** is called a **role** in PostgreSQL and has selectable privileges. The **superuser** is the first role created and has highest level of privileges. The default user name for the superuser is _postgres_ and requires a password. Some roles don't require passwords. You can create additional roles.
* A **database** contains your data and the default first name of a database is the user name, e.g., _postgres_ role gets a database _postgres_. You can create additional databases.
* A **schema** is an organizational space, a.k.a., a folder or container, inside a database where you collect related data. The default schema is called **public**. Use schemas to organize your data instead of creating new databases since you can query data from different schemas but not different databases. You can easily create new schemas.
* A **database connection** is a set of parameters that define how to connect to a database. Connections require:
	* A username (and possible a password)
	* The database name
	* The **host** name, the unique web address of the server. For us it will always be "localhost"
	* The **port** number is the way to identify you have a PostgreSQL server running and exposed. The default number is **5432**.
* A **graphical client** is a desktop app that manages PostgreSQL installation. This is where you can add new roles, databases, and execute SQL. The popular choice is [**pgAdmin**](https://www.pgadmin.org/) which is free and open source. **DB Manager** is a graphical client, but it can only create new schemas (if the role allows it).

# Installation

Just like QGIS, we have a couple versions from which to select. Any version >= 9.6 is acceptable. Avoid *beta* versions. The current version is PostgreSQL 11 with PostGIS 2.5.


## Mac OS install

Let's show the steps needed to install PostGIS on a Mac.

Step 01: Download the [Postgres.app](http://postgresapp.com/)

![](spatial-database-setup-images-postgis/q01.png)   
Make sure to read and execute all steps before installation. **DO NOT** mix with other installations.
<hr>
Step 02: After install, find your server configuration files. These will be useful for twerking database performance down the road. **Initialize** to start the server.

![](spatial-database-setup-images-postgis/q02.png)   
<hr>

Step 03: Open the **Applications > Utilities > Terminal.app** and copy and paste the following statement:

```bash
sudo mkdir -p /etc/paths.d &&
echo /Applications/Postgres.app/Contents/Versions/latest/bin | sudo tee /etc/paths.d/postgresapp
```
Hit the **return** key and you should see:

![](spatial-database-setup-images-postgis/q03.png)   
<hr>

Step 04: You should see three databases with one for your Mac OS username. **Double-click** the one with your username which should open a new terminal window logging you into your database via the command line. Run the following three statements:

```sql
CREATE EXTENSION postgis;

SELECT PostGIS_version();

\q
```

If you see PostGIS version reported, you're all good:

![](spatial-database-setup-images-postgis/q04.png)   
<hr>

Step 05: Open QGIS Browser Panel and right-click **PostGIS > New Connection** to access your new database

![](spatial-database-setup-images-postgis/q05.png)   
<hr>

Step 06: Supply the following credentials. Since we didn't create a password then it is not needed.

![](spatial-database-setup-images-postgis/q06.png)   
<hr>

<a name="windows-install"></a>
## Windows install

Let's show the steps needed to install PostGIS on Windows OS.

Step 01: Download the latest PostgreSQL version from [EnterpriseDB.com](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). At the time this tutorial was written, the current version was 9.6. 

![](spatial-database-setup-images-postgis/q09.png)   
<hr>

Step 02: Once installed, run **Stack Builder** to add the PostGIS extension:

![](spatial-database-setup-images-postgis/q10.png)   
<hr>

Step 03: Connect to your server and press **Next**:

![](spatial-database-setup-images-postgis/q11.png)   
<hr>

Step 04: Add the Spatial Extension PostGIS bundle and press **Next**:

![](spatial-database-setup-images-postgis/q12.png)   
<hr>

Step 05: Might take awhile...

![](spatial-database-setup-images-postgis/q13.png)   
<hr>

Step 06: Do not skip installation. Make sure the Skip installation is NOT checked and press **Next**:

![](spatial-database-setup-images-postgis/q14.png)   
<hr>

Step 07: Select PostGIS and Create new spatial database and press **Next**:

![](spatial-database-setup-images-postgis/q15.png)   
<hr>

Step 08: Add a password and press **Next**:

![](spatial-database-setup-images-postgis/q16.png)   
<hr>

Step 09: Create a spatial database name and press **Next**:

![](spatial-database-setup-images-postgis/q17.png)   
<hr>

Step 0510: Open QGIS Browser Panel and right-click **PostGIS > New Connection** to access your new database

![](spatial-database-setup-images-postgis/q05.png)   
<hr>

Step 11: Add your credentials and database name you created from the previous steps:

![](spatial-database-setup-images-postgis/q18.png)   
<hr>

<a name="ubuntu-install"></a>
## Ubuntu install


We recommend using Ubuntu/Debian Linux distribution and using [this tutorial from Computing for Geeks](https://computingforgeeks.com/how-to-install-postgis-on-ubuntu-debian/) to get setup with PostgreSQL and PostGIS on your machine. When creating your PostGIS database for this course, name it something like `qgis_data`.

<a name="add-data-to-your-spatial-database"></a>
# Add data to your spatial database

Step 01: Open QGIS and add a vector layer to your **Layers Panel**. Then open **DB Manager** and select your database.  Click on the **Import vector layer** table icon to add data to your database:

![](spatial-database-setup-images-postgis/q07.png)   
<hr>

Step 02: Select an input layer and then click the **Update options** button. Always do this since the import tool will autocomplete the parameters for coordinate system, field names, etc. on import. In most cases, let's also enable the **Convert field names to lowercase** and **Create spatial index** options:

![](spatial-database-setup-images-postgis/q08.png)   
<hr>

After import, look at the **Table** and **Preview** sections in DB Manager to verify your data was imported properly.

<a name="resources-and-references"></a>
# Resources and references

* [PostGIS install](http://www.postgis.net/install/)