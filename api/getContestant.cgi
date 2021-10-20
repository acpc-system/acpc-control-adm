#!/bin/bash
echo "Content-type: text/html"
echo ""
N=`cat /acpc/adm/etc/contestantmac|wc -l`
echo "N=$N"
