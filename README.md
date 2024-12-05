# Bash Script Race Condition

This repository demonstrates a race condition bug in a bash script that iterates over files in a directory and deletes them.  The script introduces a delay which, in a concurrent environment, could cause unexpected behavior.  See `bug.sh` for the buggy code and `bugSolution.sh` for a corrected version.