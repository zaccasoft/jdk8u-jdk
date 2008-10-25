#
# Copyright 2003-2004 Sun Microsystems, Inc.  All Rights Reserved.
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
#
# This code is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License version 2 only, as
# published by the Free Software Foundation.
#
# This code is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# version 2 for more details (a copy is included in the LICENSE file that
# accompanied this code).
#
# You should have received a copy of the GNU General Public License version
# 2 along with this work; if not, write to the Free Software Foundation,
# Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
#
# Please contact Sun Microsystems, Inc., 4150 Network Circle, Santa Clara,
# CA 95054 USA or visit www.sun.com if you need additional information or
# have any questions.
#

#
# @test
# @bug     6528083
# @summary Test RMI Bootstrap
#
# @build TestLogger RmiBootstrapTest Utils
# @run shell/timeout=300  RmiBootstrapTest.sh

# Define the Java class test name
TESTCLASS="RmiBootstrapTest"
export TESTCLASS

# Source in utility shell script to generate and remove .properties and .acl files
. ${TESTSRC}/GeneratePropertyPassword.sh

generatePropertyPasswordFiles `ls ${TESTSRC}/*_test*.in`

rm -rf ${TESTCLASSES}/ssl
mkdir -p ${TESTCLASSES}/ssl
cp -rf ${TESTSRC}/ssl/*store ${TESTCLASSES}/ssl 
chmod -R 777 ${TESTCLASSES}/ssl

DEBUGOPTIONS=""
export DEBUGOPTIONS

# Call the common generic test
#
# No need to since bug 4267864 is now fixed. 
#
echo -------------------------------------------------------------
echo Launching test for `basename $0 .sh`
echo -------------------------------------------------------------
sh ${TESTSRC}/../RunTest.sh ${DEBUGOPTIONS} ${TESTCLASS}
result=$?
restoreFilePermissions `ls ${TESTSRC}/*_test*.in`
exit $result
