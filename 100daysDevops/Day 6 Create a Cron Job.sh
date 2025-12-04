
Day 6 Create a Cron Job

The Nautilus system admins team has prepared scripts to automate several day-to-day tasks. They want them to be deployed on all app servers in Stratos DC on a set schedule. Before that they need to test similar functionality with a sample cron job. Therefore, perform the steps below:



a. Install cronie package on all Nautilus app servers and start crond service.


b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.

Solution:

TEP-BY-STEP SOLUTION (Run on ALL 3 app servers)
STEP 1 — Install cronie

CentOS/RHEL based servers use:

sudo yum install -y cronie

STEP 2 — Enable and start crond service
sudo systemctl enable crond
sudo systemctl start crond


Verify:

sudo systemctl status crond


Should show active (running).

STEP 3 — Add cron job for root user

Open root’s crontab:

sudo crontab -e


Add this line at the bottom:

*/5 * * * * echo hello > /tmp/cron_text

STEP 4 — Verify cron job saved
sudo crontab -l