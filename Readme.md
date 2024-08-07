# Project ETL
Project ETL is a bundle collection of data extraction, translation and loading solutions, along with visualization and monitoring tools to work with.

It is simple, handy and fast solutions, but will be volerable on internet. Please consider your own security measures.

## Installation

Use git to clone the latest source code.

```bash
# using git
git clone https://github.com/jxiang168/ETL

# or with github official CLI
# gh repo clone jxiang168/ETL
```

You may required to download your own softwares or components like:

- mssql: https://www.microsoft.com/zh-cn/sql-server/sql-server-downloads
- finereport: https://www.finereport.com/product/download
- KETTLE: https://pentaho.com/pentaho-community-edition/


## Usage

1. Run MSSQL/create_table.sql and create_procedure.sql to create the required tables and procedures.
2. Refer to scripts in MSSQL/Data to composite your own ETL scripts.
3. Open your finereport instance, and import  .cpt template file in FineReport folder. Set the datasource to your own MSSQL instance, and run the reports on your Finereport instance.


## Full Category of the project

### Design
Schemas for the projects.

### KETTLE (Deprecated)
Only for reference and backward compatiblility.

### MSSQL
A fast, link server based solution for internal safe network environment.

### DataX(TBD)
For linux platforms in the future.

### FineReport
Mapping manipulate, ETL configuration and monitoring screens.

### Metabase(TBD)
A opensource BI product to visualize data.

### Kafka(TBD)
A distributed message queue that can be used for synchronizing data between databases.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Code of conduct

- Be friendly and patient.
- Be welcoming.
- Be considerate. 
- Be respectful.
- Be careful in the words that you choose. 
- When we disagree, try to understand why.

## License

[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.txt)