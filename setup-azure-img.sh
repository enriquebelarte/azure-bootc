#!/bin/bash
set -x
echo "Provisioning.Enabled=n" > /etc/waagent.conf && \
echo "Provisioning.UseCloudInit=y" >> /etc/waagent.conf && \
echo "Provisioning.RegenerateSshHostKeyPair=n" >> /etc/waagent.conf
sudo dnf install -y WALinuxAgent dracut-config-generic hyperv-daemons lvm2 NetworkManager NetworkManager-cloud-setup selinux-policy-targeted uuid rng-tools nvme-cli lvm2
sudo systemctl enable waagent
