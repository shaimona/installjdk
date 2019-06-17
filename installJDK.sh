#!/bin/bash

# download and install JDK 8
# Download from Oracle
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm

yum -y localinstall jdk-*.rpm
rm -fR jdk-*.rpm
/usr/sbin/alternatives --set java /usr/java/jdk1.8.0_131/jre/bin/java

# install JCE 8
# Download from Oracle
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
           "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"
unzip jce_policy-8.zip
rm -f jce_policy-8.zip

mv /usr/java/default/jre/lib/security/local_policy.jar /usr/java/default/jre/lib/security/local_policy.jar.backup
mv /usr/java/default/jre/lib/security/US_export_policy.jar /usr/java/default/jre/lib/security/US_export_policy.jar.backup
mv UnlimitedJCEPolicyJDK8/*.jar /usr/java/default/jre/lib/security/
