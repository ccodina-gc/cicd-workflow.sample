# A script that checks the state of the workflow execution

# Sample output:
# argument: 'null'
# endTime: '2022-08-09T12:18:10.837347955Z'
# name: projects/629518376971/locations/us-central1/workflows/workflows-gitops-2dda62e/executions/3e1f206e-c9a0-4fcc-84ce-3883d98626cc
# result: '"Hello World"'
# startTime: '2022-08-09T12:18:10.783673335Z'
# state: SUCCEEDED
# workflowRevisionId: 000001-2ae

FILE="/workspace/testoutput.log"

# Check state
STATE_EXPECTED="state: SUCCEEDED"
STATE_ACTUAL=$(grep "state: " $FILE)
if [[ $STATE_EXPECTED == $STATE_EXPECTED ]]; then
  echo "State test passed"
else
  echo "State test failed. Expected: $STATE_EXPECTED Actual: $STATE_ACTUAL"; exit 1;
fi
