Day 5 SElinux Installation and Configuration

Following a security audit, the xFusionCorp Industries security team has opted to enhance application and server security with SELinux. To initiate testing, the following requirements have been established for App server 1 in the Stratos Datacenter:



Install the required SELinux packages.

Permanently disable SELinux for the time being; it will be re-enabled after necessary configuration changes.

No need to reboot the server, as a scheduled maintenance reboot is already planned for tonight.

Disregard the current status of SELinux via the command line; the final status after the reboot should be disabled.


Solution:

STEP 1 — Login to App Server 1
ssh tony@stapp01

STEP 2 — Install SELinux packages

CentOS/RHEL based servers → use:

sudo yum install -y selinux-policy selinux-policy-targeted


OR if full package required:

sudo yum install -y policycoreutils selinux-policy-targeted

STEP 3 — Edit SELinux config file (Permanent Disable)

Open the SELinux config file:

sudo vi /etc/selinux/config


Find this line:

SELINUX=enforcing


OR

SELINUX=permissive


Change it to:

SELINUX=disabled


✔ Verification (optional)

Check current status:

sestatus