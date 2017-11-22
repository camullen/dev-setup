#!/bin/bash

main_user=camullen
adduser $main_user
# enter password
# repeat password
# Full Name
# 4 blank
# Confirm with y

usermod -aG sudo $main_user

ssh_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDC98gyxpvHLSyhjaLwdfqZ2Ec7+w53rVtNKYD3isjlZGxJJEBdY2W9JHsTQLKKYKyBTznCssriGOtmQp8yNPLo+SNENWai24VFdRa4ImFTfV0Z+3HdlcdPXBocIVboV9TFiwVPyQpHkoHc9EH57+5mTwIrnt0+5YQcbr5asjlNsiBMMUAH29z/roDvIi8BX1Gj3xleSn7KStUTPdKYEqyt4L6yALsfdK8VJsgc/MUkSGn/m6MWzn6xpg+5ZofgBBtIXb4b+YRo/YPwJzXGK6MA8KQPgYIVE5J6oyKhDhLmlLjYHwlI6oEZY6xfT0188y+uNkxneAjfRJ7CycjesbwTi/f3ICLWvB85YtulI0QY4DQVwzFeaWUr/YEXEPTIOyvHaB1Uycgd78UF0D0PE4v1L83rg10oK0PqEkOVCA/PsIvF/RR6jMrRcSLI+ahOM6OzC7SHhrN1pMrklzMzVxhHZbFxTRwgfWv1p4rYEiEQj+6wci2B6YLs7JClIHWLT51DhvjmXLW4Vb0+PGv/Apnd/QBxW99YysVCFJW28AlcI0XHSqqa2kCHnWs24SrNGJYw0k+S615WQsF87IVeip/cJrHbA/LRWV2atNwsgOsdtVE270jMt8wCeZGkjMYI137BU1PEpX1OWLuu5MWdzcrL99NnAnkmMkptU8Oj7qqEVQ== cmullen@Camerons-MacBook-Air.local"

su - $main_user
mkdir ~/.ssh
chmod 700 ~/.ssh
echo $ssh_key >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Change PasswordAuthentication to no in /etc/ssh/sshd_config
sudo systemctl reload sshd


# Firwall setup
sudo ufw allow OpenSSH
sudo ufw enable
