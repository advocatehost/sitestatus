#!/bin/bash

get_response(){
	#Pulling Site Stats
	curl -w '@sniff.txt' -o /dev/null -O --remote-name --remote-header-name -s -L $1 > site.status

	#Organizing Data
	remote_ip="$(cat site.status | grep remote_ip)"
	http_code="$(cat site.status | grep http_code)"
	redirect_url="$(cat site.status | grep redirect_url)"
	size_download="$(cat site.status | grep size_download)"
	url_effective="$(cat site.status | grep url_effective)"
	time_appconnect="$(cat site.status | grep time_appconnect)"
	time_connect="$(cat site.status | grep time_connect)"
	time_namelookup="$(cat site.status | grep time_namelookup)"
	time_pretransfer="$(cat site.status | grep time_pretransfer)"
	time_redirect="$(cat site.status | grep time_redirect)"
	time_starttransfer="$(cat site.status | grep time_starttransfer)"
	time_total="$(cat site.status | grep time_total)"
	
	#Stripping Extra
	remote_ip="echo ${remote_ip} | grep -oP 'remote_ip: \\K.*'"
        http_code="echo ${http_code} | grep -oP \"http_code: \K.*\""
        redirect_url="echo ${redirect_url} | grep -oP \"redirect_url: \K.*\""
        size_download="echo ${size_download} | grep -oP \"size_download: \K.*\""
        url_effective="echo ${url_effective} | grep -oP \"url_effective: \K.*\""
        time_appconnect="echo ${time_appconnect} | grep -oP \"time_appconnect: \K.*\""
        time_connect="echo ${time_connect} | grep -oP \"time_connect: \K.*\""
        time_namelookup="echo ${time_namelookup} | grep -oP \"time_namelookup: \K.*\""
        time_pretransfer="echo ${time_pretransfer} | grep -oP \"time_pretransfer: \K.*\""
        time_redirect="echo ${time_redirect} | grep -oP \"time_redirect: \K.*\""
        time_starttransfer="echo ${time_starttransfer} | grep -oP \"time_starttransfer: \K.*\""
        time_total="echo ${time_total} | grep -oP \"time_total: \K.*\""

}

get_response https://google.com
echo "${remote_ip}"
#echo "${http_code}"
#echo "${redirect_url}"
#echo "${size_download}"
#echo "${url_effective}"
#echo "${time_appconnect}"
#echo "${time_connect}"
#echo "${time_namelookup}"
#echo "${time_pretransfer}"
#echo "${time_redirect}"
#echo "${time_starttransfer}"
#echo "${time_total}"
