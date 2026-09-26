#!/bin/bash
# Signature: run_convergence_check.sh <playbook_path>
# Exit codes: 0 = Idempotent, 1 = Not Idempotent, 2 = Execution Failed

PLAYBOOK_PATH="$1"

if [ -z "$PLAYBOOK_PATH" ] || [ ! -f "$PLAYBOOK_PATH" ]; then
  echo "ERROR: Valid playbook path required."
  exit 2
fi

RESULTS_DIR="/tmp/convergence_$(date +%s)"
mkdir -p "$RESULTS_DIR"

CHANGED_COUNTS=()

for run in 1 2 3; do
  LOG_FILE="$RESULTS_DIR/run_${run}.log"
  echo "Executing Run $run for $PLAYBOOK_PATH..."
  
  ansible-playbook "$PLAYBOOK_PATH" > "$LOG_FILE" 2>&1
  EXIT_CODE=$?
  
  if [ $EXIT_CODE -ne 0 ]; then
    echo "FAIL: Playbook execution failed on run $run with exit code $EXIT_CODE"
    cat "$LOG_FILE"
    exit 2
  fi
  
  # Parse changed count using POSIX grep and sed
  CHANGED=$(grep -E "localhost\s+:" "$LOG_FILE" | sed -E 's/.*changed=([0-9]+).*/\1/')
  if [ -z "$CHANGED" ]; then
    # Fallback parsing for alternative layout outputs
    CHANGED=$(grep "changed=" "$LOG_FILE" | tail -n 1 | sed -E 's/.*changed=([0-9]+).*/\1/')
  fi
  
  CHANGED_COUNTS+=("$CHANGED")
  echo "Run $run completed with changed=$CHANGED"
done

RUN2_CHANGED=${CHANGED_COUNTS[1]}
RUN3_CHANGED=${CHANGED_COUNTS[2]}

if [ "$RUN2_CHANGED" -eq 0 ] && [ "$RUN3_CHANGED" -eq 0 ]; then
  echo "PASS: Playbook $PLAYBOOK_PATH converged successfully (Runs 2 & 3 changed=0)."
  exit 0
else
  echo "FAIL: Playbook $PLAYBOOK_PATH is NOT idempotent! (Run 2 changed=$RUN2_CHANGED, Run 3 changed=$RUN3_CHANGED)"
  exit 1
fi
