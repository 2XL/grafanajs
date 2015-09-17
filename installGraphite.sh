#!/usr/bin/env bash


# This script installs Graphite
# PreRequisites:



#	python2.4 or greater
#	pycairo (with PNG backend support)
#	mod_python
#	django
#	python-ldap (optional - needed for ldap-based webapp authentication)
#	python-memcached (optional - needed for webapp caching, big performance boost)
#	python-sqlite2 (optional - a django-supported database module is required)
#	bitmap and bitmap-fonts required on some systems, notably Red Hat

# dependencies to graphite
sudo apt-get install -y libcairo2-dev \
libffi-dev \
pkg-config \
python-dev \
python-pip \
virtualenv \
fontconfig \
apache2 \
libapache2-mod-wsgi \
memcached \
librrd-dev \
libldap2-dev \
libsasl2-dev \
git-core \
gcc
