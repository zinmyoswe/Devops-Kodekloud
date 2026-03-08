The Nautilus Development Team is preparing for a major update to their database infrastructure. To ensure a smooth transition and to safeguard data, the team has requested the DevOps team to take a snapshot of the current RDS instance and restore it to a new instance. This process is crucial for testing and validation purposes before the update is rolled out to the production environment. The snapshot will serve as a backup, and the new instance will be used to verify that the backup process works correctly and that the application can function seamlessly with the restored data.

As a member of the Nautilus DevOps Team, your task is to perform the following:

Take a Snapshot: Take a snapshot of the xfusion-rds RDS instance and name it xfusion-snapshot (please wait xfusion-rds instance to be in available state).

Restore the Snapshot: Restore the snapshot to a new RDS instance named xfusion-snapshot-restore.

Configure the New RDS Instance: Ensure that the new RDS instance has a class of db.t3.micro.

Verify the New RDS Instance: The new RDS instance must be in the Available state upon completion of the restoration process.


Note:

1. RDS Database has to be "available" state to take snapshot
2. snapshot name
3. already give Database name to restore snapshot
4. when restore database size has to be db.t3.micro
5. has to wait "available" state for restore thing.

Solution:

RDS > Database > RDS instance (wait to Database to "available state") > actions > take snapshot > snapshot name > take snapshot
settings > off toggle >DB instance or cluster + snapshot create time + DB instance create time > confirm

# restore snapshot mean create new database while backup Database
choose recent created snapshot > actions > restore snapshot > Database name + Burstable classes( Database type db.t3.micro ) > restore DB instance

#it has to wait a little time to restore snapshot

