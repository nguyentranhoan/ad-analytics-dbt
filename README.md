
# Advertising Data Pipeline with dbt

## Overview

This project models and transforms advertising data collected from Google BigQuery and GCS, managed via AWS, and finally stored and analyzed in Snowflake. It demonstrates how to efficiently handle **raw** data, **syndicated** cleaned data, and **curated** insights—using dbt as the core transformation tool.

---

## Architecture Diagram

```

Raw Data (GCP BigQuery / GCS)
|
v
AWS Glue / Athena external tables (partitioned by date)
|
v
Transformations in Snowflake (or data warehouse)
|
v
Export curated results back to S3 (partitioned by date) via external scripts

````

> **Note:** Raw data is only stored in S3 (partitioned by date). Glue/Crawler discover external tables pointing to these folders for query.

---

## Core Components

- **Raw Layer:** Data stored on S3 (partitioned by date: `year=YYYY/month=MM/day=DD`)
- **Syndicated Layer:** Cleaned and deduplicated data in Snowflake
- **Curated Layer:** Business KPIs, segments, and reports in Snowflake
- **Data Export:** Final curated data exported back to S3, partitioned by date

---

## Technologies Used

- **AWS S3:** Raw data storage  
- **AWS Glue & Athena:** External table discovery on S3  
- **Snowflake:** Data transformations and storage  
- **dbt:** Transformation framework and metadata management  
- **Scripts/Schedulers:** To run daily and export data  

---

## Getting Started

### Prerequisites

- AWS account with permission to manage Glue, S3, Athena, and Snowflake  
- Snowflake account with permissions to create schemas, tables, and unload data  
- Python environment for running dbt and scripts  

---

### 1. Clone the repo

```bash
git clone git@github.com:nguyentranhoan/data-engineering-with-dbt.git
cd your-repo
````

---

### 2. Configure dbt

Create and edit your `~/.dbt/profiles.yml`:

```yaml
your_profile_name:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your_account
      user: your_user
      password: your_password
      role: your_role
      warehouse: your_warehouse
      database: your_db
      schema: your_schema
```

---

### 3. Setup AWS Glue + Athena External Tables

* Use AWS Glue crawler to discover external tables pointing to your S3 folders for raw, syndicated, and curated data.
* Ensure directories follow `year=YYYY/month=MM/day=DD/` format.
* Once the crawler runs, external tables will be available for querying.

---

### 4. Run dbt models

```bash
# Install dependencies
pip install dbt-core dbt-snowflake

# Run transformations for a specific date
dbt run --vars '{"date": "2025-03-20"}'

# Or dynamically pass date
DATE=$(date -u '+%Y-%m-%d')
dbt run --vars "{\"date\": \"$DATE\"}"
```

---

### 5. Run tests

```bash
dbt test
```

---

### 6. Generate and serve docs

```bash
dbt docs generate
dbt docs serve
# Then open http://localhost:8000 in your browser
```

---

## Models Overview

* **Raw Data Models:** Query external tables with dynamic date filters

* **Syndicated Models:** Deduplicate raw data

* **Curated Models:**

  * Daily KPIs
  * User Segments

* **Exports:** External scripts to unload curated data back to S3 partitioned folders

---

## Extending and Customizing

* Add new models for additional KPIs or segmentation
* Expand tests for data quality and integrity
* Automate daily runs with cron, Airflow, or your scheduler of choice
* Export results into S3 partitions using Snowflake `COPY INTO` commands or external scripts

---

## Additional Tips

* **Variables:** Pass date dynamically at runtime
* **Partitioning:** Keep your raw, syndicated, and curated data partitioned in S3 following consistent folder structures
* **Automations:** Schedule `dbt run` and unload/export scripts for daily pipelines

---