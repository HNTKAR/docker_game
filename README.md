# game Container

## _up container_

```
sudo mkdir -p -m 777 /home/podman/game_pod/minecraft
./script.sh
sudo firewall-cmd --add-forward-port=port=25565:proto=tcp:toport=5565 --permanent
sudo firewall-cmd --reload
podman pod create -p 5565:25565 -n game_pod
podman run -td --pod game_pod -v /home/podman/game_pod/minecraft:/mc --name minecraft minecraft
mkdir -p $HOME/.config/systemd/user/ && \
podman generate systemd --new -n --restart-policy=always game_pod -f >tmp.service && \
cat tmp.service | \
xargs -I {} cp {} -frp $HOME/.config/systemd/user && \
cat tmp.service | \
xargs -I {} systemctl --user enable {}
podman pod rm -f game_pod
systemctl --user restart pod-game_pod
#podman pod rm -f game_pod
#podman exec -it minecraft bash
#sudo firewall-cmd --remove-forward-port=port=25565:proto=tcp:toport=5565 --permanent
```

