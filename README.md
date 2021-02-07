# game server Container

## **コンテナの起動**
```
sudo firewall-cmd --add-port=25565/tcp --permanent
sudo firewall-cmd --reload
sudo mkdir -p -m 777 /home/podman/game_pod/minecraft
./script.sh
podman pod create --replace=true -p 25565:25565 -n game_pod --net slirp4netns:port_handler=slirp4netns
podman run --replace=true -td --pod game_pod -v /home/podman/game_pod/minecraft:/mc --name minecraft minecraft
```

## **ファイルおよびフォルダ**
 minecraft  
> * /home/podman/game_pod/minecraft/server.jar  
>>  [minecraftサーバー実行ファイル](https://www.minecraft.net/ja-jp/download/server/ "公式サイト")

### 自動起動の設定
```
mkdir -p $HOME/.config/systemd/user/
podman generate systemd -f -n --new --restart-policy=always game_pod >tmp.service
systemctl --user start pod-game_pod
cat tmp.service | \
xargs -I {} \cp {} -frp $HOME/.config/systemd/user
cat tmp.service | \
xargs -I {} systemctl --user enable {}
```

### 自動起動解除
```
cat tmp.service | \
xargs -I {} systemctl --user disable {}
```
