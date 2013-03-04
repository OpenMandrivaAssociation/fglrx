#!/bin/bash
svn export ${1:-svn+ssh://svn.mandriva.com/svn/packages/cooker/fglrx}/current/SPECS/fglrx.spec fglrx.spec.new
echo >> fglrx.spec.new
echo '%changelog' >> fglrx.spec.new
echo '* %(LC_ALL=C date "+%a %b %d %Y") %{packager} %{version}-%{release}' >> fglrx.spec.new
echo '- automatic package build by the ATI installer' >> fglrx.spec.new
echo >> fglrx.spec.new
ssh kenobi.mandriva.com repsys rpmlog ${1:-fglrx} >> fglrx.spec.new
mv -f fglrx.spec oldspec.spec
mv -vf fglrx.spec.new fglrx.spec

