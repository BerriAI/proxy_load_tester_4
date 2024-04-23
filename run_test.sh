#!/bin/bash

# Function to run Locust test

function run_cache_off_locust_test() {
    locust -f no_cache.py --headless -u 20 -r 20 -H https://litellm-main-latest.onrender.com/  -t 100 --csv load_test
}


# Deploy your project (assuming deployment commands are here)
# Replace the following line with your deployment commands
echo "Deploying your project..."

# print content in current dir 
ls -lAh

# Run tests indefinitely
while true; do
    echo "Running tests..."

    # Cache off test
    run_cache_off_locust_test

    python3 interpret_load_test.py cache_off_test

done
