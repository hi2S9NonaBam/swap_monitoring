#!/bin/bash
TOP_LOG=top.log
SWAP_MONITORING_LOG=swap_monitoring.log
WORKING_DIR=/opt/data/popovy/swap_monitoring/
cd ${WORKING_DIR}
rm ${SWAP_MONITORING_LOG}
rm ${TOP_LOG}
echo "all tables deleted"
