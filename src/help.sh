show_help() {
    case $1 in
    api | x25519 | tls | run | uuid | version)
        $is_core_bin help $1 ${@:2}
        ;;
    *)
        [[ $1 ]] && warn "Unknown option '$1'"
        msg "$is_core_name script $is_sh_ver by $author"
        msg "Usage: $is_core [options]... [args]... "
        msg
        help_info=(
            "Basic:"
            "   v, version                                      Show current version"
            "   ip                                              Returns the IP of the current host"
            "   pbk                                             equivalent to $is_core generate reality-keypair"
            "   get-port                                        Returns an available port"
            "   ss2022                                          Returns a cipher that can be used in Shadowsocks 2022\n"
            "General:"
            "   a, add [protocol] [args... | auto]              Add configuration"
            "   c, change [name] [option] [args... | auto]      Change configuration"
            "   d, del [name]                                   Delete configuration**"
            "   i, info [name]                                  View configuration"
            "   qr [name]                                       QR code information"
            "   url [name]                                      URL information"
            "   log                                             View log"
            # "   logerr                                          View error log\n"
            "Change:"
            # "   dp, dynamicport [name] [start | auto] [end]     Change dynamic port"
            "   full [name] [...]                               Change multiple parameters"
            "   id [name] [uuid | auto]                         Change UUID"
            "   host [name] [domain]                            Change domain name"
            "   port [name] [port | auto]                       Change port"
            "   path [name] [path | auto]                       Change path"
            "   passwd [name] [password | auto]                 Change password"
            "   key [name] [Private key | atuo] [Public key]    Change key"
            # "   type [name] [type | auto]                       Change disguise type"
            "   method [name] [method | auto]                   Change encryption method"
            "   sni [name] [ ip | domain]                       Change serverName"
            # "   seed [name] [seed | auto]                       Change mKCP seed"
            "   new [name] [...]                                Change Agreement"
            "   web [name] [domain]                             Change disguised website\n"
            "Advanced:"
            "   dns [...]                                       Set up DNS"
            "   dd, ddel [name...]                              Delete multiple configurations**"
            "   fix [name]                                      fix a configuration"
            "   fix-all                                         Repair all configurations"
            "   fix-caddyfile                                   Repair Caddyfile"
            "   fix-config.json                                 Fix config.json"
            "   import                                          Import xray/v2ray script configuration\n"
            "Manage:"
            "   un, uninstall                                   Uninstall"
            "   u, update [core | sh | caddy] [ver]             Renew"
            "   U, update.sh                                    Updated script"
            "   s, status                                       Running status"
            "   start, stop, restart [caddy]                    Start, Stop, Restart"
            "   t, test                                         Test run"
            "   reinstall                                       Reinstall script\n"
            "Test:"
            # "   client, genc [name]                             Shown for client JSON, for reference only"
            "   debug [name]                                    Display some debug information, for reference only"
            "   gen [...]                                       Equivalent to add, but only displays JSON content and does not create files. Used for testing."
            "   no-auto-tls [...]                               Equivalent to add, but disables automatic configuration of TLS and can be used for *TLS related protocols"
            # "   xapi [...]                                      Equivalent to the $is_core api, but the API backend uses the currently running $is_core_name service\n"
            "Other:"
            "   bbr                                             Enable BBR, if supported"
            "   bin [...]                                       Run $is_core_name command, for example: $is_core bin help"
            "   [...] [...]                                     Compatible with most $is_core_name command, for example: $is_core_name generate uuid"
            "   h, help                                         Show this help interface\n"
        )
        for v in "${help_info[@]}"; do
            msg "$v"
        done
        msg "Use del, ddel with caution, this option will directly delete the configuration; no confirmation is required"
        msg "Feedback question) $(msg_ul https://github.com/${is_sh_repo}/issues) "
        msg "Document(doc) $(msg_ul https://233boy.com/$is_core/$is_core-script/)"
        ;;

    esac
}

about() {
    ####### 要点13脸吗只会改我链接的小人 #######
    unset c n m s b
    msg
    msg "website: $(msg_ul https://233boy.com)"
    msg "channel: $(msg_ul https://t.me/tg2333)"
    msg "group: $(msg_ul https://t.me/tg233boy)"
    msg "Github: $(msg_ul https://github.com/${is_sh_repo})"
    msg "Twitter: $(msg_ul https://twitter.com/ai233boy)"
    msg "$is_core_name site: $(msg_ul https://sing-box.sagernet.org/)"
    msg "$is_core_name core: $(msg_ul https://github.com/${is_core_repo})"
    msg
    ####### 要点13脸吗只会改我链接的小人 #######
}
