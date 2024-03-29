name: scheduled_prod_runs

on: 
  schedule: 
  # Runs " At every hour"
  - cron: '0 0 1 1 *'
  
jobs: 
  build: 
    runs-on: ubuntu-latest 
    env: 
      DBT_USER: ${{ secrets.DBT_USER }} 
      DBT_PASSWORD: ${{ secrets.DBT_PASSWORD }} 

    steps: 
      - uses: actions/checkout@v2 

      - name: Setup Python 
        uses: actions/setup-python@v2 
        with: 
          python-version: '3.9' 

      - name: Install dbt 
        run: pip install dbt-snowflake 

      - name: Run dbt deps
        run: dbt deps --profiles-dir .

      - name: Run dbt build 
        run: dbt build --profiles-dir . 
      
      - name: Run dbt snapshot
        run: dbt build --profiles-dir .
