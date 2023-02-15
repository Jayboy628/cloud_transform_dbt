cloud_transform_dbt:
  outputs:
    dev:
      account: th58624.east-us-2.azure
      database: ANALYTICS_DEV
      password: "{{env_var('DBT_PASSWORD')}}"
      role: TRANSFORM_ROLE
      schema: DBT_SBROWN
      threads: 4
      type: snowflake
      user: "{{env_var('DBT_USER')}}"
      warehouse: TRANSFORM_WH
    prod:
      account: th58624.east-us-2.azure
      database: ANALYTICS
      password: "{{env_var('DBT_PASSWORD')}}"
      role: TRANSFORM_ROLE
      schema: DBT_SBROWN
      threads: 4
      type: snowflake
      user: "{{env_var('DBT_USER')}}"
      warehouse: TRANSFORM_WH
  target: dev