# Finding ID:	RHEL-07-030670
# Version:	RHEL-07-030670_rule
# SRG ID:	SRG-OS-000471-GPOS-00216
# Finding Level:	medium
# 
# Rule Summary:
#	All uses of the init_module command must be audited.
#
# CCI-000172 
#    NIST SP 800-53 :: AU-12 c 
#    NIST SP 800-53A :: AU-12.1 (iv) 
#    NIST SP 800-53 Revision 4 :: AU-12 c 
#
#################################################################
{%- set stig_id = 'RHEL-07-030670' %}
{%- set helperLoc = 'ash-linux/el7/STIGbyID/cat2/files' %}

script_{{ stig_id }}-describe:
  cmd.script:
    - source: salt://{{ helperLoc }}/{{ stig_id }}.sh
    - cwd: /root

