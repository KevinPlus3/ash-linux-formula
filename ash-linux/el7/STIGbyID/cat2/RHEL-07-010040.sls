# Finding ID:	RHEL-07-010040
# Version:	RHEL-07-010040_rule
# SRG ID:	SRG-OS-000023-GPOS-00006
# Finding Level:	medium
# 
# Rule Summary:
#	The operating system must display the Standard Mandatory DoD
#	Notice and Consent Banner before granting local or remote
#	access to the system via a command line user logon.
#
# CCI-000048 
#    NIST SP 800-53 :: AC-8 a 
#    NIST SP 800-53A :: AC-8.1 (ii) 
#    NIST SP 800-53 Revision 4 :: AC-8 a 
#
#################################################################
{%- set stig_id = 'RHEL-07-010040' %}
{%- set helperLoc = 'ash-linux/el7/STIGbyID/cat2/files' %}
{%- import_text "ash-linux/el7/banner-consent_full.txt" as default_banner %}
{%- set bannerText = salt.pillar.get('ash-linux:lookup:banner-plain', default_banner) %}

script_{{ stig_id }}-describe:
  cmd.script:
    - source: salt://{{ helperLoc }}/{{ stig_id }}.sh
    - cwd: /root

file_{{ stig_id }}:
  file.managed:
    - name: '/etc/issue'
    - user: root
    - group: root
    - mode: 0644
    - contents: {{ bannerText|yaml(False)|indent(8) }}

