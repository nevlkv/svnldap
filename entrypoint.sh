#!/bin/sh
set -e

cat <<EOF > /etc/apache2/conf.d/dav_svn.conf
LoadModule dav_svn_module modules/mod_dav_svn.so
LoadModule authz_svn_module modules/mod_authz_svn.so
LoadModule authnz_ldap_module modules/mod_authnz_ldap.so

<Location /svn>
   DAV svn
   SVNParentPath /opt
   SVNListParentPath on
   AuthType Basic
   AuthName "SVN Server"
   AuthBasicProvider ldap
   AuthLDAPBindDN "${AuthLDAPBindDN}"
   AuthLDAPBindPassword "${AuthLDAPBindPassword}"
   AuthLDAPURL ${AuthLDAPURL}
   <Limit GET PROPFIND OPTIONS REPORT>
          Require valid-user
   </Limit>
   <Limit GET PROFIND PROPPATCH DELETE MERGE PUT POST MKCOL MKACTIVITY COPY MOVE LOCK UNLOCK>
           Require ldap-group ${LdapGroup}
   </Limit>
</Location>
EOF

exec "$@"
