# Arch Linux setup

基本的にArchWikiのInstallation guideを見て進める。  
https://wiki.archlinux.org/index.php/Installation_guide

bootメディアはこれを見てよしなに作る。  
https://wiki.archlinux.org/index.php/USB_flash_installation_medium

## 初期化

### UEFIで起動
PC起動時になんらかのキー（要調査）でBIOSかUEFIの設定画面に入り、USBが最初になるよう起動順を指定する。

```
# このパスが存在すればUEFIで起動されている
ls /sys/firmware/efi/efivars
```

### ファイルシステムの準備
EFI system partitionとrootパーティションの2つをつくる。（スワップはとりあえず不要）

```
# SSDのデバイス名を確認(以降/dev/sdaだった場合で記述する)
lsblk

# partedで設定開始
parted /dev/sda
(parted) mklabel gpt
(parted) mkpart ESP fat32 1MiB 551MiB
(parted) set 1 esp on
(parted) mkpart primary ext4 551MiB 100%
(parted) quit

# /dev/sda1がESP、/dev/sda2がrootパーティションであることを確認して初期化
lsblk /dev/sda
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# それぞれマウント
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
```

### OS設定
言語やユーザー、GUIなど基本の設定を行う。

```
# 必須パッケージのインストール
# https://www.archlinux.jp/packages/core/any/base/
pacstrap /mnt base linux linux-firmware

# fstab作成
genfstab -U /mnt >> /mnt/etc/fstab

# ここからは/mntにchrootして作業する
arch-chroot /mnt

# 初期化スクリプトの実行
bash -c "$(curl -L https://raw.githubusercontent.com/hacktk/dotfiles_arch/master/initialize.sh)"

# 一旦終了（bootメディアを抜いたあと起動する）
exit
shutdown -h now
```

## ユーザー環境セットアップ

以降は作成したユーザーでログイン(GUI)して作業する。

### セットアップ
セットアップスクリプトを実行する。

```
# ssh鍵をつくり、FirefoxでGitHubに登録しておく
ssh-keygen -t rsa -b 4096 -C "hacktk3@gmail.com"

# 実行
bash -c "$(curl -L https://raw.githubusercontent.com/hacktk/dotfiles_arch/master/setup.sh)"
```
