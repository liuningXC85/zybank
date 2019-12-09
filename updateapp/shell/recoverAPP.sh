#! /bin/sh
datetime=$(date +"%y%m%d-%H:%M:%S")
BACKHOME="/backup/back_deploy/"
HOME="/home/ewhine/deploy/"
#echo ${datetime}


#还原备份

recover_approval(){
	
#	echo "-------------------------------------"
		if [ -d "${HOME}approval"  ];then
		dir=$(ls -l $BACKHOME |awk '/^d/ {print $NF}')
		echo "备份的文件：${dir}"
		echo "输入要还原的备份"
		read BACKNAME
		mv ${HOME}approval  ${BACKHOME}approval-recover-${datetime}.bak
		mv ${BACKHOME}${BACKNAME}  ${HOME}approval
			if [ -d "${HOME}approval"  ];then
			echo "approval 回退成功"
			else
			echo "approval 回退失败"
			fi
		else
		echo "approval文件不存在"
		fi
}

recover_survey(){
	
#	echo "-------------------------------------"
#	echo "survey备份成功"
#	echo "-------------------------------------"
		if [ -d "${HOME}survey" ];then
		/etc/init.d/mx_survey stop
		dir=$(ls -l $BACKHOME |awk '/^d/ {print $NF}')
                echo "备份的文件:"
		echo "${dir}"
                echo "输入要还原的备份"
                read BACKNAME
		mv ${HOME}survey  ${BACKHOME}survey-recover-${datetime}.bak
		mv ${BACKHOME}${BACKNAME}  ${HOME}survey
			if [ -d "${HOME}survey" ];then
			echo "survey 文件回退成功"
			/etc/init.d/mx_survey start
			else
			echo "survey 文件回退失败"
			fi
		else
		echo "survey文件不存在"
		fi
}

recover_mx_api(){
	if [ -d "/home/ewhine/deploy/mx_api-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "api备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_api" ];then
		mv /home/ewhine/deploy/mx_api /home/ewhine/deploy/mx_api-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_api-${datetime}.bak /home/ewhine/deploy/mx_api
			if [ -d "/home/ewhine/deploy/mx_api" ];then
			echo "mx_api 文件回退成功"
			else
			echo "mx_api 文件回退失败"
			fi
		else
		echo "mx_api文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "api备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mx_cafebabe_server(){
	if [ -f "/home/ewhine/deploy/mx_cafebabe_server/config/database.properties-${datetime}.bak" ];then
	mv /home/ewhine/deploy/mx_cafebabe_server/config/database.properties  /home/ewhine/deploy/mx_cafebabe_server/config/database.properties-recover-${datetime}.bak
	mv /home/ewhine/deploy/mx_cafebabe_server/config/database.properties-${datetime}.bak /home/ewhine/deploy/mx_cafebabe_server/config/database.properties 
#	echo "-------------------------------------"
#	echo "mx_cafebabe_server备份成功"
#	echo "-------------------------------------"
		if [ -f "/home/ewhine/deploy/mx_cafebabe_server/config/database.properties" ];then
		mv /home/ewhine/deploy/mx_cafebabe_server/config/database.properties  /home/ewhine/deploy/mx_cafebabe_server/config/database.properties-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_cafebabe_server/config/database.properties-${datetime}.bak /home/ewhine/deploy/mx_cafebabe_server/config/database.properties
			if [ -f "/home/ewhine/deploy/mx_cafebabe_server/config/database.properties" ];then
			echo "/mx_cafebabe_server/config/database.properties 文件回退成功"
			else
			echo "/mx_cafebabe_server/config/database.properties 文件回退失败"
			fi
		else
		echo "/mx_cafebabe_server/config/database.properties文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "/mx_cafebabe_server/config/database.properties备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mx_changepwd(){
	if [ -f "/home/ewhine/deploy/mx_changepwd/config/application.properties-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_changepwd备份成功"
#	echo "-------------------------------------"
		if [ -f "/home/ewhine/deploy/mx_changepwd/config/application.properties" ];then
		mv /home/ewhine/deploy/mx_changepwd/config/application.properties  /home/ewhine/deploy/mx_changepwd/config/application.properties-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_changepwd/config/application.properties-${datetime}.bak /home/ewhine/deploy/mx_changepwd/config/application.properties
			if [ -f "/home/ewhine/deploy/mx_changepwd/config/application.properties" ];then
			echo "/mx_changepwd/config/application.properties 文件回退成功"
			else
			echo "/mx_changepwd/config/application.properties 文件回退失败"
			fi
		else
		echo "/mx_changepwd/config/application.properties文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "/mx_changepwd/config/application.properties备份文件夹不存在"
	echo "-------------------------------------"
	fi
}











recover_external_public(){
        if [ -d "/home/ewhine/deploy/external_public-${datetime}.bak" ];then
#       echo "-------------------------------------"
#       echo "mx_changepwd备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/external_public" ];then
		mv /home/ewhine/deploy/external_public  /home/ewhine/deploy/external_public-recover-${datetime}.bak
		mv /home/ewhine/deploy/external_public-${datetime}.bak /home/ewhine/deploy/external_public
			if [ -d "/home/ewhine/deploy/external_public" ];then
		        echo "external_public文件回退成功"
			else 
			echo "external_public文件回退失败"
			fi
	        else
	        echo "external_public文件不存在"
	        fi
        else
        echo "-------------------------------------"
        echo "external_public备份文件夹不存在"
        echo "-------------------------------------"
        fi
}











recover_mx_fence(){
	if [ -d "/home/ewhine/deploy/mx_fence-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_fence备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_fence" ];then
		mv /home/ewhine/deploy/mx_fence /home/ewhine/deploy/mx_fence-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_fence-${datetime}.bak /home/ewhine/deploy/mx_fence
			if [ -d "/home/ewhine/deploy/mx_fence" ];then
			echo "mx_fence文件回退成功"
			else
			echo "mx_fence文件回退失败"
			fi
		else
		echo "mx_fence文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "mx_fence备份文件夹不存在"
	echo "-------------------------------------"
	fi
}

recover_mx_gtasks(){
	if [ -d "/home/ewhine/deploy/mx_gtasks-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_gtasks备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_gtasks" ];then
		mv /home/ewhine/deploy/mx_gtasks /home/ewhine/deploy/mx_gtasks-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_gtasks-${datetime}.bak /home/ewhine/deploy/mx_gtasks
			if [ -d "/home/ewhine/deploy/mx_gtasks" ];then
			echo "mx_gtasks文件回退成功"
			else
			echo "mx_gtasks文件回退失败"
			fi
		else
		echo "mx_gtasks文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "mx_gtasks备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mx_html5(){
	if [ -f "/home/ewhine/deploy/mx_html5/config/runtime.properties-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_html5备份成功"
#	echo "-------------------------------------"
		if [ -f "/home/ewhine/deploy/mx_html5/config/runtime.properties" ];then
		mv /home/ewhine/deploy/mx_html5/config/runtime.properties  /home/ewhine/deploy/mx_html5/config/runtime.properties-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_html5/config/runtime.properties-${datetime}.bak /home/ewhine/deploy/mx_html5/config/runtime.properties
			if [ -f "/home/ewhine/deploy/mx_html5/config/runtime.properties" ];then
			echo "mx_html5/config/runtime.properties文件回退成功"
			else
			echo "mx_html5/config/runtime.properties文件回退失败"
			fi
		else
		echo "mx_html5/config/runtime.properties文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "mx_html5/config/runtime.properties备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mx_running_statistics(){
	if [ -d "/home/ewhine/deploy/mx_running_statistics-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_running_statistics备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_running_statistics" ];then
		mv /home/ewhine/deploy/mx_running_statistics /home/ewhine/deploy/mx_running_statistics-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_running_statistics-${datetime}.bak /home/ewhine/deploy/mx_running_statistics
			if [ -d "/home/ewhine/deploy/mx_running_statistics" ];then
			echo "mx_running_statistics文件文件回退成功"
			else
			echo "mx_running_statistics文件文件回退失败"
			fi
		else
		echo "mx_running_statistics文件文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "mx_running_statistics备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mx_schedule_hubs(){
	if [ -d "/home/ewhine/deploy/mx_schedule_hubs-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_schedule_hubs备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_schedule_hubs" ];then
		mv /home/ewhine/deploy/mx_schedule_hubs /home/ewhine/deploy/mx_schedule_hubs-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_schedule_hubs-${datetime}.bak /home/ewhine/deploy/mx_schedule_hubs
			if [ -d "/home/ewhine/deploy/mx_schedule_hubs" ];then
			echo "mx_schedule_hubs文件回退成功"
			else
			echo "mx_schedule_hubs文件回退失败"
			fi
		else
		echo "mx_schedule_hubs文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "mx_schedule_hubs备份文件夹不存在"
	echo "-------------------------------------"
	fi
}





recover_mx_schedul(){
        if [ -d "/home/ewhine/deploy/mx_schedule-${datetime}.bak" ];then
#       echo "-------------------------------------"
#       echo "mx_schedule_hubs备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/mx_schedule" ];then
		mv /home/ewhine/deploy/mx_schedule /home/ewhine/deploy/mx_schedule-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_schedule-${datetime}.bak /home/ewhine/deploy/mx_schedule
			if [ -d "/home/ewhine/deploy/mx_schedule" ];then
		        echo "mx_schedule文件回退成功"
			else
			echo "mx_schedule文件回退失败"
			fi
	        else
	        echo "mx_schedule文件不存在"
	        fi
        else
        echo "-------------------------------------"
        echo "mx_schedule备份文件夹不存在"
        echo "-------------------------------------"
        fi
}






recover_mx_vcard(){
	if [ -d "/home/ewhine/deploy/mx_vcard-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_vcard备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_vcard" ];then
		mv /home/ewhine/deploy/mx_vcard /home/ewhine/deploy/mx_vcard-recover-${datetime}.bak
		mv /home/ewhine/deploy/mx_vcard-${datetime}.bak /home/ewhine/deploy/mx_vcard
			if [ -d "/home/ewhine/deploy/mx_vcard" ];then
			echo "mx_vcard文件回退成功"
			else
			echo "mx_vcard文件回退失败"
			fi
		else
		echo "mx_vcard文件文件不存在" 
		fi
	else
	echo "-------------------------------------"
	echo "mx_vcard备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mx_zytags(){
	if [ -f "/opt/ewhine/etc/config/global/db.properties-${datetime}.bak" ];then
#	echo "-------------------------------------"
#	echo "mx_zytags备份成功"
#	echo "-------------------------------------"
		if [ -f "/opt/ewhine/etc/config/global/db.properties" ];then
		mv /opt/ewhine/etc/config/global/db.properties /opt/ewhine/etc/config/global/db.properties-recover-${datetime}.bak
		mv /opt/ewhine/etc/config/global/db.properties-${datetime}.bak /opt/ewhine/etc/config/global/db.properties
			if [ -f "/opt/ewhine/etc/config/global/db.properties" ];then
			echo "mx_zytags文件回退成功"
			else
			echo "mx_zytags文件回退失败"
			fi
		else
		echo "mx_zytags文件不存在"
		fi
	else
	echo "-------------------------------------"
	echo "mx_zytags备份文件夹不存在"
	echo "-------------------------------------"
	fi
}


web_client(){
	if [ -d "/home/ewhine/deploy/web_client" ];then
	mv /home/ewhine/deploy/web_client /home/ewhine/deploy/web_client-${datetime}.bak
	echo "-------------------------------------"
	echo "web_client备份成功"
	echo "-------------------------------------"
	else
	echo "-------------------------------------"
	echo "web_client文件夹不存在"
	echo "-------------------------------------"
	fi
}


recover_mxpp(){
        if [ -d "/home/ewhine/deploy/mxpp/dist-${datetime}.bak" ];then
#        echo "-------------------------------------"
#        echo "mxpp / dist,i18n,libs,views_build备份成功"
#        echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mxpp/views_build" ];then
		mv /home/ewhine/deploy/mxpp/dist /home/ewhine/deploy/mxpp/dist-recover-${datetime}.bak
		mv /home/ewhine/deploy/mxpp/dist-${datetime}.bak /home/ewhine/deploy/mxpp/dist
		mv /home/ewhine/deploy/mxpp/i18n /home/ewhine/deploy/mxpp/i18n-recover-${datetime}.bak
		mv /home/ewhine/deploy/mxpp/i18n-${datetime}.bak /home/ewhine/deploy/mxpp/i18n
		mv /home/ewhine/deploy/mxpp/libs /home/ewhine/deploy/mxpp/libs-recover-${datetime}.bak
		mv /home/ewhine/deploy/mxpp/libs-${datetime}.bak /home/ewhine/deploy/mxpp/libs
		mv /home/ewhine/deploy/mxpp/views_build /home/ewhine/deploy/mxpp/views_build-recover-${datetime}.bak
		mv /home/ewhine/deploy/mxpp/views_build-${datetime}.bak /home/ewhine/deploy/mxpp/views_build
		mv /home/ewhine/deploy/mxpp/config_flavor.json /home/ewhine/deploy/mxpp/config_flavor.json-recover-${datetime}.bak
		mv /home/ewhine/deploy/mxpp/config_flavor.json-${datetime}.bak /home/ewhine/deploy/mxpp/config_flavor.json	
			if [ -d "/home/ewhine/deploy/mxpp/views_build" ];then
			echo "mxpp回退成功"
			else
			echo "mxpp回退失败"
			fi
		else
		echo "mxpp文件不存在" 
		fi
        else
        echo "-------------------------------------"
        echo "mxpp备份文件夹不存在"
        echo "-------------------------------------"
        fi
}

mqtt(){
        if [ -d "/opt/ewhine/maquettelepathy" ];then
        mv /opt/ewhine/maquettelepathy /opt/ewhine/maquettelepathy-${datetime}.bak
        echo "-------------------------------------"
        echo "maquettelepathy备份成功"
        echo "-------------------------------------"
        else
        echo "-------------------------------------"
        echo "maquettelepathy文件夹不存在"
        echo "-------------------------------------"
        fi
}


recover_blackhole_zwei(){
        if [ -f "/home/ewhine/deploy/blackhole_zwei/server.cfg-${datetime}.bak" ];then
		if [ -f "/home/ewhine/deploy/blackhole_zwei/server.cfg"  ];then
		mv /home/ewhine/deploy/blackhole_zwei/server.cfg  /home/ewhine/deploy/blackhole_zwei/server.cfg-recover-${datetime}.bak
		mv /home/ewhine/deploy/blackhole_zwei/server.cfg-${datetime}.bak /home/ewhine/deploy/blackhole_zwei/server.cfg
			if [ -f "/home/ewhine/deploy/blackhole_zwei/server.cfg"  ];then
			echo "blackhole_zwei/server.cfg回退成功"
			else
			echo "blackhole_zwei/server.cfg回退失败"
			fi
		else
		echo "blackhole_zwei/server.cfg文件不存在"
		fi
#        echo "-------------------------------------"
 #       echo "server.cfg 备份成功"
 #       echo "-------------------------------------"
        else
        echo "-------------------------------------"
        echo "blackhole_zwei/server.cfg备份文件夹不存在"
        echo "-------------------------------------"
        fi
}


   




recover_zyb_wallet(){
        if [ -d "/home/ewhine/deploy/zyb_wallet-${datetime}.bak" ];then
#       echo "-------------------------------------"
#       echo "mx_gtasks备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/zyb_wallet" ];then
		mv /home/ewhine/deploy/zyb_wallet /home/ewhine/deploy/zyb_wallet-recover-${datetime}.bak
		mv /home/ewhine/deploy/zyb_wallet-${datetime}.bak /home/ewhine/deploy/zyb_wallet
			if [ -d "/home/ewhine/deploy/zyb_wallet" ];then
		        echo "zyb_wallet文件回退成功"
			else
			echo "zyb_wallet文件回退失败"
			fi
	        else
	        echo "zyb_wallet文件不存在"
	        fi
        else
        echo "-------------------------------------"
        echo "zyb_wallet备份文件夹不存在"
        echo "-------------------------------------"
        fi
}





recover_data_sync(){
        if [ -d "/home/ewhine/deploy/data_sync-${datetime}.bak" ];then
#       echo "-------------------------------------"
#       echo "mx_gtasks备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/data_sync" ];then
		mv /home/ewhine/deploy/data_sync /home/ewhine/deploy/data_sync-recover-${datetime}.bak
		mv /home/ewhine/deploy/data_sync-${datetime}.bak /home/ewhine/deploy/data_sync
			if [ -d "/home/ewhine/deploy/data_sync" ];then
		        echo "data_sync文件回退成功"
			else
			echo "data_sync文件回退失败"
			fi
	        else
       		echo "data_sync文件不存在"
	        fi
        else
        echo "-------------------------------------"
        echo "data_sync备份文件夹不存在"
        echo "-------------------------------------"
        fi
}




#print

echo "#####################################"
echo "更新结果"
echo "#####################################"

case "$1" in
	approval)
	recover_approval
	;;
	survey)
	recover_survey
	;;
	*)
	echo "approval | survey"
	;;
esac	

#recover_approval
#recover_blackhole_zwei
#recover_ewhine_search
#recover_mx_api
#recover_mx_cafebabe_server
#recover_mx_changepwd
#recover_external_public
#recover_mx_fence
#recover_mx_gtasks
#recover_mx_html5
#recover_mxpp
#recover_mx_running_statistics
#recover_mx_schedule_hubs
#recover_mx_schedul
#recover_mx_vcard
#recover_mx_zytags
#recover_survey
#recover_zyb_wallet
#recover_data_sync
