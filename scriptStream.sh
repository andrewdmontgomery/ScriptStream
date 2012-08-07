## Managing Open Directory

# Backup ODM
# creates a sparseimage with the name 'odbackup' in /var/backups
slapconfig -backupdb /var/backups/odbackup

# Restore ODM
# specifcy the path to the sparseimage archive
slapconfig -restoredb /Volumes/Backup/odbackup.sparseimage

# Preflight for OD Master
/usr/sbin/slapconfig -preflightmaster --certAuthName "Acme, Inc. Open Directory Certification Authority" --certAdminEmail "support@example.com" acmediradmin 1000

# Create OD Master
/usr/sbin/slapconfig -createldapmasterandadmin --certAuthName "Acme, Inc. Open Directory Certification Authority" --certAdminEmail "support@example.com" --certOrgName "Acme, Inc." acmediradmin "Acme LDAP-Admin" 1000 "dc=corp,dc=acme,dc=com" CORP.ACME.COM