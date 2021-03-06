## Managing Open Directory
# Backup ODM
# creates a sparseimage with the name 'odbackup' in /var/backups
/usr/sbin/slapconfig -backupdb /var/backups/odbackup

# Restore ODM
# specifcy the path to the sparseimage archive
/usr/sbin/slapconfig -restoredb /Volumes/Backup/odbackup.sparseimage

# Start/Stop LDAP Server
/usr/sbin/slapconfig -stopldapserver
/usr/sbin/slapconfig -startldapserver

# Start/Stop Password Service
/usr/sbin/slapconfig -startpasswordserver
/usr/sbin/slapconfig -stoppasswordserver

## OD Master
# Preflight for OD Master
/usr/sbin/slapconfig -preflightmaster --certAuthName "Acme, Inc. Open Directory Certification Authority" --certAdminEmail "support@example.com" acmediradmin 1000

# Create OD Master
/usr/sbin/slapconfig -createldapmasterandadmin --certAuthName "Acme, Inc. Open Directory Certification Authority" --certAdminEmail "support@example.com" --certOrgName "Acme, Inc." acmediradmin "Acme LDAP-Admin" 1000 "dc=corp,dc=acme,dc=com" CORP.ACME.COM

## OD Replica
# Preflight for OD Replica
# Note: the order of the directory admin and the master's hostname is reversed from the 'create' command
/usr/sbin/slapconfig -preflightreplica acmediradmin odr.example.com

# Create OD Replica
# Note: the order of the directory admin and the master's hostname is reversed from the 'preflight' command
/usr/sbin/slapconfig -createreplica --certAdminEmail "support@example.com" odr.example.com acmediradmin



# Curious commands, find out more:
# /usr/sbin/slapconfig -enableproxyusers
