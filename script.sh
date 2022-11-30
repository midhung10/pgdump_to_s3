#!/bin/bash

DUMPFILE=dumpfile.sql
pg_dump --username postgres -d hrms_htic -f /var/lib/postgresql/backupbd/$DUMPFILE
aws --profile backup_user s3 sync /var/lib/postgresql/backupbd/ s3://hrms.hticglobal.com/$(date +%a)/dbbackup
rm  /var/lib/postgresql/backupbd/$DUMPFILE
