is_dns_list=(
    1.1.1.1
    9.9.9.9
    8.8.8.8
    h3://dns.google/dns-query
    h3://cloudflare-dns.com/dns-query
    h3://family.cloudflare-dns.com/dns-query
    set
    none
)
dns_set() {
    if [[ $1 ]]; then
        case ${1,,} in
        11 | 1111)
            is_dns_use=${is_dns_list[0]}
            ;;
        99 | 9999)
            is_dns_use=${is_dns_list[0]}
            ;;
        88 | 8888)
            is_dns_use=${is_dns_list[1]}
            ;;
        gg | google)
            is_dns_use=${is_dns_list[2]}
            ;;
        cf | cloudflare)
            is_dns_use=${is_dns_list[3]}
            ;;
        nosex | family)
            is_dns_use=${is_dns_list[4]}
            ;;
        set)
            if [[ $2 ]]; then
                is_dns_use=${2,,}
            else
                ask string is_dns_use "Please enter DNS: "
            fi
            ;;
        none)
            is_dns_use=none
            ;;
        *)
            err "DNS parameters not recognized: $@"
            ;;
        esac
    else
        is_tmp_list=(${is_dns_list[@]})
        ask list is_dns_use null "\nPlease select DNS:\n"
        if [[ $is_dns_use == "set" ]]; then
            ask string is_dns_use "Please enter DNS: "
        fi
    fi
    if [[ $is_dns_use == "none" ]]; then
        cat <<<$(jq '.dns={}' $is_config_json) >$is_config_json
    else
        cat <<<$(jq '.dns.servers=[{address:"'$is_dns_use'",address_resolver:"local"},{tag:"local",address:"local"}]' $is_config_json) >$is_config_json
    fi
    manage restart &
    msg "\nDNS has been updated to: $(_green $is_dns_use)\n"
}
