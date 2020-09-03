#!/bin/sh
if [ -s error.log ]
then
	exit 1
else
	exit 0
fi