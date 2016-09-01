#!/bin/bash
curl -X POST -u $DHIS_USER:$DHIS_PASS http://localhost:8084/dhis2/api/resourceTables
echo "Sleeping for 2 mins to let resource rebuild task complete"
sleep 120
sudo -S -u postgres psql -f /usr/share/dhis2-datim/all_dataset_assignments_and_orgunit_group_memberships.sql dhis2
sleep 2
curl -s -o /dev/null -X PUT -u $DHIS_USER:$DHIS_PASS http://localhost:8084/dhis2/api/maintenance/cacheClear
