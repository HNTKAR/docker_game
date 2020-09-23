# game Container

## _up container_

```
sudo mkdir -p -m 777 /home/podman/game_pod/minecraft
./script.sh
sudo firewall-cmd --add-forward-port=port=25565:proto=tcp:toport=25565 --permanent
sudo firewall-cmd --reload
podman pod create -p 25565:25565 -n game_pod
podman run -td --pod game_pod -v /home/podman/game_pod/minecraft:/mc --name minecraft minecraft
#podman pod rm -f game_pod
#podman exec -it minecraft bash
#sudo firewall-cmd --remove-forward-port=port=25565:proto=tcp:toport=25565 --permanent
```

