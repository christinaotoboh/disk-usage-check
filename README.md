# Linux-machine-health-monitor

#  Storage Check Script

This Bash script monitors disk storage usage for a specified partition and logs the results to a file. It’s designed to run automatically (e.g., via a cron job) and help system administrators detect when disk usage reaches warning or critical levels.

---

##  Features
- Checks disk usage for a specific partition.
- Logs storage reports to `/var/log/storage_report.txt`.
- Displays `[OK]`, `[WARNING]`, or `[CRITICAL]` messages based on usage thresholds.
- Ensures the script is executed with root privileges.
- Easily integrates with cron for automated monitoring.

---

## How It Works
1. The script first verifies it’s running as **root**.
2. It logs a new report section with the current date and time.
3. It checks the usage of the defined partition (e.g., `/dev/sde`).
4. Based on usage thresholds:
   - **OK**: Usage below 50%
   - **WARNING**: Usage between 50% and 89%
   - **CRITICAL**: Usage 90% and above
5. Results are appended to `/var/log/storage_report.txt`.

---

##  Example Log Output

Storage Check Report Sun Nov  9 08:18:00 WAT 2025
-----------------------------------
[OK] Disk usage is at 1%!. No action required
[OK] Disk usage is at 1%!. No action required



---

##  Requirements
- Linux environment with Bash
- Root access
- Commands: `df`, `awk`, `grep`, `tee`, `tr`

---

##  Usage

1. **Make the script executable:**
   ```bash
   chmod +x storage-check.sh

