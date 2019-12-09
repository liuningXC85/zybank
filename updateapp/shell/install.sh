#! /bin/sh
datetime=$(date +"%y%m%d-%H:%M:%S")
BACKHOME="/backup/back_deploy/"
UPDATEHOME="/home/ewhine/updateapp/"
HOME="/home/ewhine/deploy/"
echo ${datetime}

#备份文件

mkdir_dir(){
	if [ ! -d "/backup/back_deploy/" ];then
	mkdir /backup/back_deploy/
	else
	echo "已经存在"
	fi
}



check_approval(){
        PID=`ps -ef|grep approval |grep java  |awk '{print$2}'`
        if [ -n "${PID}" ];then
        echo "approval 正在运行"
        else
        echo "approval 停止运行"
        fi
}



update_approval(){
	if [ -d "${UPDATEHOME}approval" ];then
	        if [ ! -d "${HOME}approval" ];then
	                if [ -d "${HOME}approval-${datetime}.bak" ];then
        	        mv ${UPDATEHOME}approval ${HOME}
	                        if [ -d "${HOME}approval" ];then
        	                echo "approval文件更新成功"
				/etc/init.d/mx_approval start
				check_approval
                       		else
                       		echo "approval文件更新失败"
                       		fi
                	else
                	echo "approval备份文件不存在"
               		fi
	        else
	        echo "-------------------------------------"
	        echo "approval文件夹已经存在"
	        echo "-------------------------------------"
	        fi
	else
	echo "需要更新的包不在/home/ewhine/updateapp目录下"
	fi
}





back_approval(){
	if [ -d "${HOME}approval" ];then
	mv ${HOME}approval ${HOME}approval-${datetime}.bak 
#	echo "-------------------------------------"
		if [ -d "${HOME}approval-${datetime}.bak"  ];then
		echo "approval文件备份成功"
		update_approval
		else
		echo "approval文件备份失败"
		fi
#	echo "-------------------------------------"
	else
	echo "-------------------------------------"
	echo "approval文件夹不存在"
	echo "-------------------------------------"
	fi
}


approval(){
		if [ -d "${UPDATEHOME}approval" ];then
			PID=`ps -ef|grep approval |grep java |awk '{print$2}'`
			echo $PID
			if [ -n "$PID" ];then
			/etc/init.d/mx_approval stop
			echo "approval stop ok"
				APPPID=`ps -ef|grep approval |grep java |awk '{print$2}'`
			       	if [ -n "$APPPID" ];then
				echo "approval 正在运行"
				else
   				back_approval
				fi
			else
			echo "approval stop"
			fi
		else
		echo "需要更新的包不在/home/ewhine/updateapp目录下"
		fi
}


check_survey(){
	PID=`ps -ef|grep survey |grep java |awk '{print$2}'`
	if [ -n "$PID" ];then
	echo "survey 正在运行"
	else
	echo "survey 停止运行"
	fi
}


update_survey(){
        if [ ! -d "${HOME}survey" ];then
#       echo "-------------------------------------"
#       echo "survey备份成功"
#       echo "-------------------------------------"
                if [ -d "${BACKHOME}survey-${datetime}.bak" ];then
                mv ${UPDATEHOME}survey  ${HOME}
                        if [ -d "${HOME}survey" ];then
                        echo "survey文件更新成功"
			/etc/init.d/mx_survey start
			check_survey
                        else
                        echo "survey文件更新失败"
                        fi
                else
                echo "survey备份文件不存在"
                fi
        else
        echo "-------------------------------------"
        echo "survey文件夹已经存在"
        echo "-------------------------------------"
        fi
}



back_survey(){
	if [ -d "${HOME}survey" ];then
	mv ${HOME}survey  ${BACKHOME}survey-${datetime}.bak
#	echo "-------------------------------------"
#	echo "survey备份成功"
#	echo "-------------------------------------"
		if [ -d "${BACKHOME}survey-${datetime}.bak" ];then
		echo "survey文件备份成功"
		update_survey
		else
		echo "survey文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "survey文件夹不存在"
	echo "-------------------------------------"
	fi
}


survey(){
	if [ -d "${UPDATEHOME}survey" ];then
		PID=`ps -ef|grep survey |grep java |awk '{print$2}'`
		if [ -n "$PID" ];then
		/etc/init.d/mx_survey stop
			APPPID=`ps -ef|grep survey |grep java |awk '{print$2}'`
			if [ -n "$APPPID" ];then
			echo "survey 正在运行"
			else
			back_survey
			fi
		else
		echo "survey 停止运行"	
		lback_survey
		fi
	else
	echo "需要更新的包不在${UPDATEHOME}目录下"
	fi
		
}


check_mx_api(){
	PID=`ps -ef|grep api |grep java |awk '{print$2}'`
	if [ -n "$PID" ];then
	echo "mx_api 正在运行"
	else
	echo "mx_api 停止运行"
	fi
}


update_mx_api(){
        if [ ! -d "${HOME}mx_api" ];then
#       echo "-------------------------------------"
#       echo "api备份成功"
#       echo "-------------------------------------"
                if [ -d "${HOME}mx_api-${datetime}.bak" ];then
                mv ${UPDATEHOME}mx_api  ${HOME}
                        if [ -d "${HOME}mx_api" ];then
                        echo "mx_api文件更新成功"
			/etc/init.d/mx_api start
			check_mx_api
                        else
                        echo "mx_api文件更新失败"
                        fi
                else
                echo "mx_api备份文件不存在"
                fi
        else
        echo "-------------------------------------"
        echo "api文件夹已经存在"
        echo "-------------------------------------"
        fi
}



back_mx_api(){
	if [ -d "${HOME}mx_api" ];then
	mv ${UPDATEHOME}mx_api  ${HOME}mx_api-${datetime}.bak
#	echo "-------------------------------------"
#	echo "api备份成功"
#	echo "-------------------------------------"
		if [ -d "${HOME}mx_api-${datetime}.bak" ];then
		echo "mx_api文件备份成功"
		update_mx_api
		else
		echo "mx_api文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "api文件夹不存在"
	echo "-------------------------------------"
	fi
}


mx_api(){
	if [ -d "${UPDATEHOME}mx_api" ];then
		PID=`ps -ef|grep api|grep java |awk '{print$2}'`
		if [ -n "$PID" ];then
		/etc/init.d/mx_api stop
			APPPID=`ps -ef|grep api|grep java |awk '{print$2}'`
			if [ -n "$APPPID" ];then
			echo "mx_api 正在运行"
			else
			back_mx_api
			fi
		else
		echo "mx_api 停止运行"	
		fi
	else
	echo "需要更新的包不在${UPDATEHOME}目录下"
	fi
	
}



back_mx_cafebabe_server(){
	if [ -f "/home/ewhine/deploy/mx_cafebabe_server/config/database.properties" ];then
	mv /home/ewhine/deploy/mx_cafebabe_server/config/database.properties  /home/ewhine/deploy/mx_cafebabe_server/config/database.properties-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_cafebabe_server备份成功"
#	echo "-------------------------------------"
		if [ -f "/home/ewhine/deploy/mx_cafebabe_server/config/database.properties-${datetime}.bak" ];then
		echo "/mx_cafebabe_server/config/database.properties文件备份成功"
		else
		echo "/mx_cafebabe_server/config/database.properties文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "/mx_cafebabe_server/config/database.properties文件夹不存在"
	echo "-------------------------------------"
	fi
}


back_mx_changepwd(){
	if [ -f "/home/ewhine/deploy/mx_changepwd/config/application.properties" ];then
	mv /home/ewhine/deploy/mx_changepwd/config/application.properties  /home/ewhine/deploy/mx_changepwd/config/application.properties-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_changepwd备份成功"
#	echo "-------------------------------------"
		if [ -f "/home/ewhine/deploy/mx_changepwd/config/application.properties-${datetime}.bak" ];then
		echo "/mx_changepwd/config/application.properties文件备份成功"
		else
		echo "/mx_changepwd/config/application.properties文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "/mx_changepwd/config/application.properties文件夹不存在"
	echo "-------------------------------------"
	fi
}











back_external_public(){
        if [ -d "/home/ewhine/deploy/external_public" ];then
        mv /home/ewhine/deploy/external_public  /home/ewhine/deploy/external_public-${datetime}.bak
#       echo "-------------------------------------"
#       echo "mx_changepwd备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/external_public-${datetime}.bak" ];then
	        echo "external_public文件备份成功"
	        else
	        echo "external_public文件备份失败"
	        fi
        else
        echo "-------------------------------------"
        echo "external_public文件夹不存在"
        echo "-------------------------------------"
        fi
}











back_mx_fence(){
	if [ -d "/home/ewhine/deploy/mx_fence" ];then
	mv /home/ewhine/deploy/mx_fence /home/ewhine/deploy/mx_fence-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_fence备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_fence-${datetime}.bak" ];then
		echo "mx_fence文件备份成功"
		else
		echo "mx_fence文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "mx_fence文件夹不存在"
	echo "-------------------------------------"
	fi
}

check_mx_gtasks(){
        PID=`ps -ef|grep gtasks |grep java |awk '{print$2}'`
	if [ -n "$PID" ];then
	echo "mx_gtasks 正在运行"
	else
	echo "mx_gtasks 停止运行"
	fi
}

update_mx_gtasks(){
        if [ ! -d "${HOME}mx_gtasks" ];then
#       echo "-------------------------------------"
#       echo "mx_gtasks备份成功"
#       echo "-------------------------------------"
                if [ -d "${HOME}mx_gtasks-${datetime}.bak" ];then
                mv ${UPDATEHOME}mx_gtasks ${HOME}
                        if [ -d "${HOME}mx_gtasks" ];then
                        echo "mx_gtasks文件更新成功"
			/etc/init.d/mx_gtasks start
			check_mx_gtasks
                        else
                        echo "mx_gtasks文件更新失败"
                        fi
                else
                echo "mx_gtasks备份文件不存在"
                fi
        else
        echo "-------------------------------------"
        echo "mx_gtasks文件夹已经存在"
        echo "-------------------------------------"
        fi
}


back_mx_gtasks(){
	if [ -d "${HOME}mx_gtasks" ];then
	mv ${HOME}mx_gtasks  ${HOME}mx_gtasks-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_gtasks备份成功"
#	echo "-------------------------------------"
		if [ -d "${HOME}mx_gtasks-${datetime}.bak" ];then
		echo "mx_gtasks文件备份成功"
		update_mx_gtasks
		else
		echo "mx_gtasks文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "mx_gtasks文件夹不存在"
	echo "-------------------------------------"
	fi
}

mx_gtasks(){
	if [ -d "${UPDATEHOME}mx_gtasks" ];then
		PID=`ps -ef|grep gtasks|grep java |awk '{print$2}'`
                if [ -n "$PID" ];then
                /etc/init.d/mx_gtasks stop
                        APPPID=`ps -ef|grep gtasks|grep java |awk '{print$2}'`
                        if [ -n "$APPPID" ];then
                        echo "mx_gtasks 正在运行"
                        else
                        back_mx_gtasks
                        fi
                else
                echo "mx_gtasks 停止运行"  
                fi
	
	else
	echo "需要更新的包不在${UPDATEHOME}目录下"
	fi
}


back_mx_html5(){
	if [ -f "/home/ewhine/deploy/mx_html5/config/runtime.properties" ];then
	mv /home/ewhine/deploy/mx_html5/config/runtime.properties  /home/ewhine/deploy/mx_html5/config/runtime.properties-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_html5备份成功"
#	echo "-------------------------------------"
		if [ -f "/home/ewhine/deploy/mx_html5/config/runtime.properties-${datetime}.bak" ];then
		echo "mx_html5/config/runtime.properties文件备份成功"
		else
		echo "mx_html5/config/runtime.properties文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "mx_html5/config/runtime.properties文件夹不存在"
	echo "-------------------------------------"
	fi
}


back_mx_running_statistics(){
	if [ -d "/home/ewhine/deploy/mx_running_statistics" ];then
	mv /home/ewhine/deploy/mx_running_statistics /home/ewhine/deploy/mx_running_statistics-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_running_statistics备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_running_statistics-${datetime}.bak" ];then
		echo "mx_running_statistics文件文件备份成功"
		else
		echo "mx_running_statistics文件文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "mx_running_statistics文件夹不存在"
	echo "-------------------------------------"
	fi
}


back_mx_schedule_hubs(){
	if [ -d "/home/ewhine/deploy/mx_schedule_hubs" ];then
	mv /home/ewhine/deploy/mx_schedule_hubs /home/ewhine/deploy/mx_schedule_hubs-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_schedule_hubs备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_schedule_hubs-${datetime}.bak" ];then
		echo "mx_schedule_hubs文件备份成功"
		else
		echo "mx_schedule_hubs文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "mx_schedule_hubs文件夹不存在"
	echo "-------------------------------------"
	fi
}





back_mx_schedule(){
        if [ -d "/home/ewhine/deploy/mx_schedule" ];then
        mv /home/ewhine/deploy/mx_schedule /home/ewhine/deploy/mx_schedule-${datetime}.bak
#       echo "-------------------------------------"
#       echo "mx_schedule_hubs备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/mx_schedule-${datetime}.bak" ];then
	        echo "mx_schedule文件备份成功"
	        else
	        echo "mx_schedule文件备份失败"
	        fi
        else
        echo "-------------------------------------"
        echo "mx_schedule文件夹不存在"
        echo "-------------------------------------"
        fi
}






back_mx_vcard(){
	if [ -d "/home/ewhine/deploy/mx_vcard" ];then
	mv /home/ewhine/deploy/mx_vcard /home/ewhine/deploy/mx_vcard-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_vcard备份成功"
#	echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mx_vcard-${datetime}.bak" ];then
		echo "mx_vcard文件备份成功"
		else
		echo "mx_vcard文件备份失败" 
		fi
	else
	echo "-------------------------------------"
	echo "mx_vcard文件夹不存在"
	echo "-------------------------------------"
	fi
}


back_mx_zytags(){
	if [ -f "/opt/ewhine/etc/config/global/db.properties" ];then
	mv /opt/ewhine/etc/config/global/db.properties /opt/ewhine/etc/config/global/db.properties-${datetime}.bak
#	echo "-------------------------------------"
#	echo "mx_zytags备份成功"
#	echo "-------------------------------------"
		if [ -f "/opt/ewhine/etc/config/global/db.properties-${datetime}.bak" ];then
		echo "mx_zytags文件备份成功"
		else
		echo "mx_zytags文件备份失败"
		fi
	else
	echo "-------------------------------------"
	echo "mx_zytags文件夹不存在"
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


back_mxpp(){
        if [ -d "/home/ewhine/deploy/mxpp/dist" ];then
        mv /home/ewhine/deploy/mxpp/dist /home/ewhine/deploy/mxpp/dist-${datetime}.bak
	mv /home/ewhine/deploy/mxpp/i18n /home/ewhine/deploy/mxpp/i18n-${datetime}.bak
	mv /home/ewhine/deploy/mxpp/libs /home/ewhine/deploy/mxpp/libs-${datetime}.bak
	mv /home/ewhine/deploy/mxpp/views_build /home/ewhine/deploy/mxpp/views_build-${datetime}.bak
#	mv /home/ewhine/deploy/mxpp/config_flavor.json /home/ewhine/deploy/mxpp/config_flavor.json-${datetime}.bak
#        echo "-------------------------------------"
#        echo "mxpp / dist,i18n,libs,views_build备份成功"
#        echo "-------------------------------------"
		if [ -d "/home/ewhine/deploy/mxpp/views_build-${datetime}.bak" ];then
		echo "mxpp备份成功"
		else
		echo "mxpp备份失败" 
		fi
        else
        echo "-------------------------------------"
        echo "mxpp文件夹不存在"
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


back_blackhole_zwei(){
        if [ -f "/home/ewhine/deploy/blackhole_zwei/server.cfg" ];then
        mv /home/ewhine/deploy/blackhole_zwei/server.cfg  /home/ewhine/deploy/blackhole_zwei/server.cfg-${datetime}.bak
		if [ -f "/home/ewhine/deploy/blackhole_zwei/server.cfg-${datetime}.bak"  ];then
		echo "blackhole_zwei/server.cfg备份成功"
		else
		echo "blackhole_zwei/server.cfg备份失败"
		fi
#        echo "-------------------------------------"
 #       echo "server.cfg 备份成功"
 #       echo "-------------------------------------"
        else
        echo "-------------------------------------"
        echo "blackhole_zwei/server.cfg 文件夹不存在"
        echo "-------------------------------------"
        fi
}



back_ewhine_search(){
        if [ -f "/home/ewhine/deploy/ewhine_search/conf/production_config.properties" ];then
        mv /home/ewhine/deploy/ewhine_search/conf/production_config.properties  /home/ewhine/deploy/ewhine_search/conf/production_config.properties-${datetime}.bak
		if [ -f "/home/ewhine/deploy/ewhine_search/conf/production_config.properties-${datetime}.bak" ];then
		echo "/ewhine_search/conf/production_config.properties文件备份成功"
		else
		echo "/ewhine_search/conf/production_config.properties文件备份失败"
		fi
#        echo "-------------------------------------"
#        echo "production_config.properties 备份成功"
 #       echo "-------------------------------------"
        else
        echo "-------------------------------------"
        echo "/ewhine_search/conf/production_config.properties 文件夹不存在"
        echo "-------------------------------------"
        fi
}




check_zyb_wallet(){
	PID=`ps -ef|grep zyb_wallet |grep java |awk '{print$2}'`
	if [ -n "$PID" ];then
	echo "zyb_wallet 正在运行"
	else
	echo "zyb_wallet 停止运行"
	fi
}



update_zyb_wallet(){
        if [ ! -d "${HOME}zyb_wallet" ];then
#       echo "-------------------------------------"
#       echo "mx_gtasks备份成功"
#       echo "-------------------------------------"
                if [ -d "${HOME}zyb_wallet-${datetime}.bak" ];then
                mv ${UPDATEHOME}zyb_wallet  ${HOME}
                        if [ -d "${HOME}zyb_wallet" ];then
                        echo "zyb_wallet文件更新成功"
			/etc/init.d/zyb_wallet start
			check_zyb_wallet
                        else
                        echo "zyb_wallet文件更新失败"
                        fi
                else
                echo "zyb_wallet备份文件不存在"
                fi
        else
        echo "-------------------------------------"
        echo "zyb_wallet文件夹已经存在"
        echo "-------------------------------------"
        fi
}



back_zyb_wallet(){
        if [ -d "${HOME}zyb_wallet" ];then
        mv ${HOME}zyb_wallet  ${HOME}zyb_wallet-${datetime}.bak
#       echo "-------------------------------------"
#       echo "mx_gtasks备份成功"
#       echo "-------------------------------------"
	        if [ -d "${HOME}zyb_wallet-${datetime}.bak" ];then
	        echo "zyb_wallet文件备份成功"
		update_zyb_wallet
	        else
	        echo "zyb_wallet文件备份失败"
	        fi
        else
        echo "-------------------------------------"
        echo "zyb_wallet文件夹不存在"
        echo "-------------------------------------"
        fi
}


zyb_wallet(){
	if [ -d "${UPDATEHOME}zyb_wallet" ];then
	  PID=`ps -ef|grep zyb_wallet |grep java |awk '{print$2}'`
	  if [ -n "$PID" ];then
	    /etc/init.d/zyb_wallet stop
	    APPPID=`ps -ef|grep zyb_wallet |grep java |awk '{print$2}'`
	    if [ -n "$APPPID" ];then
	      echo "zyb_wallet 正在运行"
	    else
	      back_zyb_wallet
	    fi
	  else
	    echo "zyb_wallet 停止运行"
	    back_zyb_wallet
	  fi
	else
	echo "需要更新的包不在${UPDATEHOME}目录下面"
	fi
}



back_data_sync(){
        if [ -d "/home/ewhine/deploy/data_sync" ];then
        mv /home/ewhine/deploy/data_sync /home/ewhine/deploy/data_sync-${datetime}.bak
#       echo "-------------------------------------"
#       echo "mx_gtasks备份成功"
#       echo "-------------------------------------"
	        if [ -d "/home/ewhine/deploy/data_sync-${datetime}.bak" ];then
	        echo "data_sync文件备份成功"
	        else
	        echo "data_sync文件备份失败"
	        fi
        else
        echo "-------------------------------------"
        echo "data_sync文件夹不存在"
        echo "-------------------------------------"
        fi
}




#print

echo "#####################################"
echo "更新结果"
echo "#####################################"


case "$1" in
	approval)
	approval
	;;
	mx_api)
	mx_api
	;;
	mx_cafebabe_server)
	mx_cafebabe_server
	;;
	external_public)
	external_public
	;;
	mx_fence)
	mx_fence
	;;
	mx_gtasks)
	mx_gtasks
	;;
	mx_html5)
	mx_html5
	;;
	mxpp)
	mxpp
	;;
	mx_running_statistics)
	mx_running_statistics
	;;
	mx_schedule_hubs)
	mx_schedule_hubs
	;;
	mx_schedule)
	mx_schedule
	;;
	mx_vcard)
	mx_vcard
	;;
	mx_zytags)
	mx_zytags
	;;
	survey)
	survey
	;;
	zyb_wallet)
	zyb_wallet
	;;
	data_sync)
	data_sync
	;;
	*)
	#echo "生产：  20.16.5.96 | 20.16.5.97 | 20.16.10.87 | 20.16.10.88 | 20.16.10.96 | 20.16.5.10.97 | 20.16.5.108 | 20.16.5.109"
	echo "测试环境：  zyb_wallet | mx_gtasks | approval | survey | mx_api"
	;;
esac




