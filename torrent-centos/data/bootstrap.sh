#! /usr/bin/env bash

cd /vagrant/data

yum update
yum -y install gcc
yum -y install gcc-c++
yum -y install openssl
yum -y install openssl-devel
yum -y install ncurses-devel
yum -y install libcurl-devel

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

mkdir /tmp/torrent
cp torrent/*.tar.gz /tmp/torrent/

cd /tmp/torrent
tar zxvf libtorrent-0.13.4.tar.gz
tar zxvf rtorrent-0.9.4.tar.gz

cd /tmp/torrent/libtorrent-0.13.4
./configure
make
make install

cd /tmp/torrent/rtorrent-0.9.4
./configure
make
make install

cp /vagrant/data/torrent/rtorrent.rc ~/.rtorrent.rc

