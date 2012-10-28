#!/bin/bash
svn export ${1:-svn+ssh://svn.mageia.org/svn/packages/cauldron/fglrx}/current/SPECS/fglrx.spec fglrx.spec.new
echo >> fglrx.spec.new
echo '%changelog' >> fglrx.spec.new
echo '* %(LC_ALL=C date "+%a %b %d %Y") %{packager} %{version}-%{release}' >> fglrx.spec.new
echo '- automatic package build by the AMD installer' >> fglrx.spec.new
echo >> fglrx.spec.new
mgarepo rpmlog ${1:-fglrx} >> fglrx.spec.new
mv -f fglrx.spec oldspec.spec
mv -vf fglrx.spec.new fglrx.spec

