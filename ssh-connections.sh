sudo apt update 
sudo apt install sshpass
rm known_hosts*
for user in ansible root
do 
    for os in ubuntu centos
    do 
        for instance in 1 2 3 
        do 
        #sshpass -f /config/guest_password was causing the problem of 
        #"1 key(s) remain to be installed -- if you are prompted now it is to install the new keys" 
       
        sshpass -f password.txt ssh-copy-id -o StrictHostKeyChecking=no ${user}@${os}${instance}
        done
    done
done
