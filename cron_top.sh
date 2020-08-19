#!/bin/bash

## Script para coletar o status dos processos na máquina à cada minuto e remover à cada 7 dias
##
## Claudio Santos
## Adicionar a linha na Crontab, seguindo o padrao abaixo:
##  */1 * * * * COLUMNS=999 /root/cron_top.sh 2>>/dev/null


_ANO=`date +%Y`
_MES=`date +%m`
_DIA=`date +%d`
_HORA=`date +%H`
_MINUTO=`date +%M`

_ANO_R=`date -d "-7 days" +%Y`
_MES_R=`date -d "-7 days" +%m`
_DIA_R=`date -d "-7 days" +%d`
_HORA_R=`date -d "-7 days" +%H`
_MINUTO_R=`date -d "-7 days" +%M`


mkdir -p /var/log/top/"$_ANO"/"$_MES"/"$_DIA"

_SAIDA="/var/log/top/"$_ANO"/"$_MES"/"$_DIA"/top_"$_HORA"_"$_MINUTO".txt"

_REMOVER="/var/log/top/"$_ANO_R"/"$_MES_R"/"$_DIA_R"/top_"$_HORA_R"_"$_MINUTO_R".txt"

/usr/bin/top -c -b -n 1 >$_SAIDA

rm -f  $_REMOVER

