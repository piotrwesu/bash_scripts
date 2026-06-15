qcd()
{
    case "$1" in
        VoidLook)
            cd ~/Repos/CNetwork/VoidLook
            ;;
        GeminiCli)
            cd ~/Repos/GeminiCli
            ;;
        *)
            echo "qcd: unknown key'$1'"
            return 1;
            ;;
    esac
    pwd
}

complete -W "VoidLook GeminiCli" qcd
