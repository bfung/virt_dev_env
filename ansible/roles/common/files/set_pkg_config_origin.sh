#! /usr/bin/env sh
#
# Checks if pkg set -o devel/pkg-config:devel/pkgconfig has been run.
# If not already run, run it and write a marker file.
# On next invocation, check to see if the marker file exists before running.
# Exit cleanly for ansible to use.

if [ ! -f /etc/pkg/updated_pkg_config_origin ];
then
	pkg set -o devel/pkg-config:devel/pkgconfig \
    && touch /etc/pkg/updated_pkg_config_origin
fi