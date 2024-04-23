FROM quay.io/astronomer/astro-runtime:11.1.0

# Set the working directory inside the Docker container
WORKDIR /usr/local/airflow/dags/dbt/data_pipeline

# Copy the dbt_project.yml file from your local machine into the Docker container
COPY dags/dbt/data_pipeline/dbt_project.yml /app/data_pipeline/dbt_project.yml

# Install dbt and its dependencies
RUN python -m venv /usr/local/airflow/dbt_venv && source /usr/local/airflow/dbt_venv/bin/activate && \
    pip install --no-cache-dir dbt-snowflake && deactivate
