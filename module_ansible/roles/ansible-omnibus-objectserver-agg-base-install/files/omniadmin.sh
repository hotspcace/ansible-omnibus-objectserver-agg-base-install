#!/bin/bash

##############################################################################
# SCRIPT  : omnibus_deployment_manager.sh
# PURPOSE : A menu driven Shell script using dialog utility to deploy Ansible playbooks
#
# JMclean
##############################################################################

set -x

if [[ -z $NCO_PA_ID ]]
then
        MYHOST=$(hostname -f)
        if [[ "$MYHOST" =~ webgui ]]
        then
                NCO_PA="WEBGUI"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/webgui

        elif [[ "$MYHOST" =~ segra-objectserver ]]
        then
                NCO_PA="AGG_P_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/objectserver

        elif [[ "$MYHOST" =~ agg-backup ]]
        then
                NCO_PA="AGG_B_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/objectserver
        elif [[ "$MYHOST" =~ master ]] && [[ "$MYHOST" =~ euw01 ]]
        then
                NCO_PA="MTTRAPD01_M_EU_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ slave ]] && [[ "$MYHOST" =~ euw01 ]]
        then
                NCO_PA="MTTRAPD01_S_EU_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ master ]] && [[ "$MYHOST" =~ aps01 ]]
        then
                NCO_PA="MTTRAPD01_M_AP_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ slave ]] && [[ "$MYHOST" =~ aps01 ]]
        then
                NCO_PA="MTTRAPD01_S_AP_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ master ]]
        then
                NCO_PA="MTTRAPD01_M_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ slave ]]
        then
                NCO_PA="MTTRAPD01_S_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ omnibus-mttrapd01-consul ]]
        then
                NCO_PA="MTTRAPD01_C_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ omnibus-mttrapd02-consul ]]
        then
                NCO_PA="MTTRAPD02_C_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ omnibus-socket01-consul ]]
        then
                NCO_PA="SOCKET01_C_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-socket
                NC_RULES_HOME=/opt/accuoss/omnibus/configs/probe-socket

        elif [[ "$MYHOST" =~ omnibus-socket02-consul ]]
        then
                NCO_PA="SOCKET02_C_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-socket
                NC_RULES_HOME=/opt/accuoss/omnibus/configs/probe-socket

        elif [[ "$MYHOST" =~ omnibus-mttrapd01. ]]
        then
                NCO_PA="MTTRAPD01_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ omnibus-mttrapd02. ]]
        then
                NCO_PA="MTTRAPD02_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-mttrapd
                NC_RULES_HOME=/opt/accuoss/omnibus/rules

        elif [[ "$MYHOST" =~ omnibus-socket01. ]]
        then
                NCO_PA="SOCKET01_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-socket
                NC_RULES_HOME=/opt/accuoss/omnibus/configs/probe-socket

        elif [[ "$MYHOST" =~ omnibus-socket02. ]]
        then
                NCO_PA="SOCKET02_PA"
                CONFIGSHOME=/opt/accuoss/omnibus/configs/probe-socket
                NC_RULES_HOME=/opt/accuoss/omnibus/configs/probe-socket

        fi
        NCHOME=/opt/IBM/tivoli/netcool                  # Set directory for $NCHOME
        OMNIHOME=/opt/IBM/tivoli/netcool/omnibus        # Set directory for $OMNIHOME
        export NCO_PA CONFIGSHOME NC_RULES_HOME NCHOME OMNIHOME
        NCO_ID=$(echo "$NCO_PA_ID"|cut -d"_" -f1,2)
else
        nothing=nothing
fi
##############################################################################
#                      Define Functions Here                                 #
##############################################################################
pamanager()
{
        /opt/accuoss/omnibus/scripts/pamanager.sh
}
omnibusstatus()
{
        /opt/IBM/tivoli/netcool/omnibus/bin/nco_pa_status -server AGG_P_PA -user netcool -password "ECBBBJAGFKBIGD" &> pastatus.$$
        dialog --ascii-lines --backtitle "OMNIBUS ADMINISTRATOR" --title "OMNIBUS PROCESS STATUS" --textbox pastatus.$$ 0 0
        rm -f pastatus.*
}
omnisysinfo()
{
        /opt/IBM/tivoli/netcool/omnibus/bin/nco_id -v|head -60 &> omniinfo.$$
        dialog --ascii-lines --backtitle "OMNIBUS ADMINISTRATOR" --title "OMNIBUS SYSTEM INFO" --textbox omniinfo.$$ 0 0
        rm -f omniinfo.*
}
currentusers()
{
   who > userslist.$$
   dialog --ascii-lines --backtitle "OMNIBUS ADMINISTRATOR" --title "CURRENTLY LOGGED IN USERS LIST" --textbox userslist.$$ 12 60
}
diskstats()
{
   df -h | grep "^/" > statsfile.$$
   dialog --ascii-lines --backtitle "OMNIBUS ADMINISTRATOR" --title "DISK STATISTICS" --textbox statsfile.$$ 10 60
}
tailvarlogmessages()
{
        tail -1000 /var/log/messages &> varmessagestail.$$
        dialog --ascii-lines --backtitle "OMNIBUS ADMINISTRATOR" --title "TAIL VAR LOG MESSAGES" --textbox varmessagestail.$$ 0 0
        rm -f varmessagestail.*
}
##############################################################################
#                           MAIN STRATS HERE                                 #
##############################################################################
trap 'deletetempfiles'  EXIT     # calls deletetempfiles function on #exit

while :
do
        dialog --clear --ascii-lines --backtitle "OMNIBUS ADMINISTRATOR" --title "MAIN MENU" \
        --menu "Use [UP/DOWN] key to navigate." 0 0 0 \
        "Omnibus PA Manager" "PA Manager to Start or Stop Processes" \
        "Omnibus Process Status" "Get Status of Omnibus Processes" \
        "Omnibus System Info" "Get Omnibus System and Version Info" \
        "Get Current Users" "Current Logged In Users" \
        "Disk Stats" "Get Disk Statistics" \
        "Tail Messages File" "Tail the last 1000 lines of /var/log/messages" \
        "Exit" "Exit Menu" 2> menuchoices.$$

        retopt=$?
        choice=`cat menuchoices.$$`

        case $retopt in

                0) case $choice in
                        "Omnibus PA Manager")           pamanager ;;
                        "Omnibus Process Status")       omnibusstatus ;;
                        "Omnibus System Info")          omnisysinfo ;;
                        "Get Current Users")            currentusers ;;
                        "Disk Stats")                   diskstats ;;
                        "Tail Messages File")           tailvarlogmessages ;;
                        "Exit")                         clear; exit 0;;
                   esac ;;

                *)clear ; exit ;;
        esac
done
