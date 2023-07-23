#!/bin/bash
################## Install and configure LDAP-Kerberos-NFS
DEBIAN_FRONTEND=noninteractive apt -y install krb5-user krb5-config ldap-utils libpam-ldap libnss-ldap nscd libpam-krb5 nss-updatedb libnss-db libpam-ccreds
cd /tmp
wget http://control/prog/common/krb5_config.dat
wget http://control/prog/common/ldap.conf
wget http://control/prog/common/krb-auth-config 
wget http://control/prog/common/common-session
mv krb-auth-config /etc/auth-client-config/profile.d/
mv ldap.conf /etc/ldap.conf
mv common-session /etc/pam.d
DEBCONF_DB_OVERRIDE='File {/tmp/krb5-config.dat}' dpkg-reconfigure -fnoninteractive krb5-config
auth-client-config -a -p krb5ldap
nss_updatedb ldap
auth-client-config -a -p krb5ldap.cached
rm /tmp/krb5_config.dat
