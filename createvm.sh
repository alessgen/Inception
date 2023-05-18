#!/bin/bash

export BLUE='\033[0;34m'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export RESET='\033[0m'
export PATH_='/home/ubuntudev/Desktop'

echo -e "${BLUE}Creating VM... ${RESET}" 
VBoxManage createvm --name Inception-Xubuntu --ostype Ubuntu_64 --register
if [ $? ]; then
    echo -e "${GREEN}VM created successfully!${RESET}"
else
    echo -e "${RED}VM creation failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Adding CPU, RAM, and VRAM...${RESET}"
VBoxManage modifyvm Inception-Xubuntu --cpus 6 --memory 8192 --vram 128
if [ $? ]; then
    echo -e "${GREEN}CPU, RAM, and VRAM added successfully!${RESET}"
else
    echo -e "${RED}CPU, RAM, and VRAM addition failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Configuring a network adapter...${RESET}"
VBoxManage modifyvm Inception-Xubuntu --nic1 nat --nictype1 82540EM --cableconnected1 on
if [ $? ]; then
    echo -e "${GREEN}Network adapter configured successfully!${RESET}"
else
    echo -e "${RED}Network adapter configuration failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Creating virtual hard disk...${RESET}"
VBoxManage createhd --filename ${PATH_}/Inception-Xubuntu.vdi --size 20000 --variant Fixed
if [ $? ]; then
    echo -e "${GREEN}Virtual hard disk created successfully!${RESET}"
else
    echo -e "${RED}Virtual hard disk creation failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Add storage controller...${RESET}"
VBoxManage storagectl Inception-Xubuntu --name "SATA Controller" --add sata --controller IntelAHCI
if [ $? ]; then
    echo -e "${GREEN}Storage controller added successfully!${RESET}"
else
    echo -e "${RED}Storage controller addition failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Attach virtual hard disk to storage controller...${RESET}"
VBoxManage storageattach Inception-Xubuntu --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium Inception-Xubuntu.vdi
if [ $? ]; then
    echo -e "${GREEN}Virtual hard disk attached successfully!${RESET}"
else
    echo -e "${RED}Virtual hard disk attachment failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Add optical drive...${RESET}"
VBoxManage storagectl Inception-Xubuntu --name "IDE Controller" --add ide
if [ $? ]; then
    echo -e "${GREEN}Optical drive added successfully!${RESET}"
else
    echo -e "${RED}Optical drive addition failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Attach ISO to optical drive...${RESET}"
VBoxManage storageattach Inception-Xubuntu --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium ${PATH_}/xubuntu-22.04.2-desktop-amd64.iso
if [ $? ]; then
    echo -e "${GREEN}ISO attached successfully!${RESET}"
else
    echo -e "${RED}ISO attachment failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Modify VM settings...${RESET}"
VBoxManage modifyvm Inception-Xubuntu --graphicscontroller vmsvga
if [ $? ]; then
    echo -e "${GREEN}VM settings modified successfully!${RESET}"
else
    echo -e "${RED}VM settings modification failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Modify VM settings...${RESET}"
VBoxManage modifyvm Inception-Xubuntu --boot1 disk --boot2 dvd --boot3 none --boot4 none
if [ $? ]; then
    echo -e "${GREEN}VM settings modified successfully!${RESET}"
else
    echo -e "${RED}VM settings modification failed!${RESET}"
    exit 1
fi
echo -e "${BLUE}Starting VM...${RESET}"
# VBoxManage startvm Inception-Xubuntu
# if [ $? ]; then
#     echo -e "${GREEN}VM started successfully!${RESET}"
# else
#     echo -e "${RED}VM start failed!${RESET}"
#     exit 1
# fi
