#!/bin/sh
#
# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38605
# Finding ID:	V-38605
# Version:	RHEL-06-000224
# Finding Level:	Medium
#
#     The cron service must be running. Due to its usage for maintenance 
#     and security-supporting tasks, enabling the cron daemon is essential.
#
############################################################

diag_out() {
   echo "${1}"
}

diag_out "----------------------------------"
diag_out "STIG Finding ID: V-38605"
diag_out "  The cron service must be running"
diag_out "----------------------------------"
