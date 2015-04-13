# STIG URL: http://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2014-06-11/finding/V-38555
# Finding ID:	V-38555
# Version:	RHEL-06-000113
# Finding Level:	Medium
#
#     The system must employ a local IPv4 firewall. The "iptables" service 
#     provides the system's host-based firewalling capability for IPv4 and 
#     ICMP.
#
#  CCI: CCI-001118
#  NIST SP 800-53 :: SC-7 (12)
#  NIST SP 800-53A :: SC-7 (12).1
#
############################################################

{%- set stig_id = '38555' %}

script_V{{ stig_id }}-describe:
  cmd.script:
    - source: salt://ash-linux/STIGbyID/cat2/files/V{{ stig_id }}.sh
    - cwd: '/root'

service_V{{ stig_id }}:
  service.running:
    - name: iptables
    - enable: True
