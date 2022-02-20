if type -q exa
    abbr -a la exa -la --group-directories-first
end

abbr -a psc ps xawf -eo pid,user,cgroup,args

if type -q docker
    abbr -a docker-rmi docker images --filter dangling=true -qa | xargs -r docker rmi
    abbr -a docker-rm docker ps -aq --filter status=dead | xargs -r docker rm
end


