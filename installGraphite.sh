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




# create graphite environment variable
sudo virtualenv /opt/graphite
export PATH=/opt/graphite/bin:$PATH



# clone whisper repo
cd /usr/local/src
if [ ! -d whisper ]
then
sudo
git clone https://github.com/graphite-project/whisper.git
fi
cd whisper
sudo git checkout 0.9.x
sudo -E python setup.py install


# clone carbo repo
cd /usr/local/src
if [ ! -d carbon ]
then
sudo git clone https://github.com/graphite-project/carbon.git
fi
cd carbon
sudo git checkout 0.9.x
sudo -E pip install -r requirements.txt
sudo -E python setup.py install


# clone web interface
cd /usr/local/src
if [ ! -d graphite-web ]
then
sudo git clone https://github.com/graphite-project/graphite-web.git
fi
cd graphite-web
sudo git checkout 0.9.x
sudo -E pip install -r requirements.txt
sudo -E pip install rrdtool python-ldap
python check-dependencies.py
sudo -E python setup.py install


echo "Installation Complete!!!"

# installation complete




echo "Prepare Web Database"

cd /opt/graphite/webapp/graphite
echo "yes->admin->chenglong.zq@gmail.com->admin->admin"
sudo -E python manage.py syncdb



echo "Configure Carbon 2/8 (only mandatory)"


