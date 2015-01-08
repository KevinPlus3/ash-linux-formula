# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38521
# Finding ID:	V-38521
# Version:	RHEL-06-000137
# Finding Level:	Medium
#
#     The operating system must support the requirement to centrally manage 
#     the content of audit records generated by organization defined 
#     information system components. A log server (loghost) receives syslog 
#     messages from one or more systems. This data can be used as an 
#     additional log source in the event a system is compromised and its 
#     local logs are suspect. ...
#
#  CCI: CCI-000169
#  NIST SP 800-53 :: AU-12 a
#  NIST SP 800-53A :: AU-12.1 (ii)
#  NIST SP 800-53 Revision 4 :: AU-12 a
#
############################################################

script_V38521-describe:
  cmd.script:
  - source: salt://STIGbyID/cat2/files/V38521.sh

# Only look for rsyslog configuration if rsyslog is installed
{% if salt['pkg.version']('rsyslog') %}

  # Check if UDP-logging to loghost
  {% if salt['file.search']('/etc/rsyslog.conf', '\*\.\*[ 	]*@[a-z0-9]') %}
notify_V38521-extLogging:
  cmd.run:
  - name: 'printf "Info: System is configured to do UDP-based logging to an\n\texternal host"'

  # Check if TCP-logging to loghost
  {% elif salt['file.search']('/etc/rsyslog.conf', '^\*\.\*[ 	]*@@[a-z0-9]') %}
notify_V38521-extLogging:
  cmd.run:
  - name: 'printf "Info: System is configured to do TCP-based logging to an\n\texternal host"'

  # Check if RELP-logging to loghost
  {% elif salt['file.search']('/etc/rsyslog.conf', '^\*\.\*[ 	]*:omrelp:[a-z0-9]') %}
notify_V38521-extLogging:
  cmd.run:
  - name: 'printf "Info: System is configured to do RELP-based logging to an\n\texternal host\n"'

  # No remote-logging configured
  {% else %}
notify_V38521-extLogging:
  cmd.run:
  - name: 'printf "WARNING: System does not appear to be configured to log\n\tto an external host.\n" ; exit 1'
  {% endif %}
{% else %}
notify_V38521-extLogging:
  cmd.run:
  - name: 'printf "NOTICE: The ''rsyslog'' service is not installed.\n\tUnable to test for remote-logging"'
{% endif %}
