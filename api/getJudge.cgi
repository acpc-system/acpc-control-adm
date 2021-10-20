#!/bin/bash
echo "Content-type: text/html"
echo ""
N=`cat /acpc/adm/etc/judgesmac|wc -l`
echo "N=$N"
