#!/bin/sh

set -e

# Removing unused packages
for PACKAGE in apt-utils aptitude man-db manpages info dselect
do
	if ! apt-get remove --purge --yes "${PACKAGE}"
	then
		echo "WARNING: ${PACKAGE} isn't installed"
	fi
done

apt-get autoremove --yes || true

# Removing unused files
find . -name *~ | xargs rm -f

#rm -rf /usr/share/groff/*
rm -rf /usr/share/doc/*
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /usr/share/i18n/*
rm -rf /usr/share/info/*
rm -rf /usr/share/lintian/*
rm -rf /usr/share/linda/*
rm -rf /usr/share/zoneinfo/*
rm -rf /var/cache/man/*

# Truncating logs
for FILE in $(find /var/log/ -type f)
do
	: > ${FILE}
done
