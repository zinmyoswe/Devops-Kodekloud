Day 4 Script Execution Permissions

In a bid to automate backup processes, the xFusionCorp Industries sysadmin team has developed a new bash script named xfusioncorp.sh. While the script has been distributed to all necessary servers, it lacks executable permissions on App Server 1 within the Stratos Datacenter.



Your task is to grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 1. Additionally, ensure that all users have the capability to execute it.

Solution:

STEP 1 — Login to App Server 1
ssh tony@stapp01

STEP 2 — Check script file exists
ls -l /tmp/xfusioncorp.sh

STEP 3 — Add executable permission for ALL users
Everyone should be able to execute → use:

sudo chmod a+x /tmp/xfusioncorp.sh


or

sudo chmod 755 /tmp/xfusioncorp.sh

✔ Verification

Run:

ls -l /tmp/xfusioncorp.sh


Expected:

-rwxr-xr-x 1 root root 1234 /tmp/xfusioncorp.sh


Try executing:

/tmp/xfusioncorp.sh