#!/bin/bash
dhis2-shutdown dhis2
sleep 10
sudo -u postgres psql -f /usr/share/dhis2-datim/all_dataset_assignments_and_orgunit_group_memberships.sql dhis2
dhis2-startup dhis2
sleep 30
curl -s -o /dev/null -X PUT -u $DHIS_USER:$DHIS_PASS http://localhost:8084/dhis2/api/maintenance/cacheClear
