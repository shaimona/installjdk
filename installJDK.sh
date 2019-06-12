#!/bin/bash

# download and install JDK 8
# Download from Oracle
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
           "https://download.oracle.com/otn/java/jdk/8u211-b12/478a62b7d4e34b78b671c754eaaf38ab/jdk-8u211-linux-x64.rpm"
yum -y localinstall jdk-*.rpm
rm -fR jdk-*.rpm
/usr/sbin/alternatives --config java

# install JCE 8
# Download from Oracle
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
           "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip"
unzip jce_policy-8.zip
rm -f jce_policy-8.zip

mv /usr/java/default/jre/lib/security/local_policy.jar /usr/java/default/jre/lib/security/local_policy.jar.backup
mv /usr/java/default/jre/lib/security/US_export_policy.jar /usr/java/default/jre/lib/security/US_export_policy.jar.backup
mv UnlimitedJCEPolicyJDK8/*.jar /usr/java/default/jre/lib/security/
