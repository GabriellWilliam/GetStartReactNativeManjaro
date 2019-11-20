#!/bin/bash

echo "Atualizando sistema..."
if ! sudo pacman -Syyu
then
    echo "Não foi possível atualizar os repositórios."
    exit 1
fi
echo "Atualização feita com sucesso"

echo "Procurando pacotes"
if ! sudo pacman -S nodejs yarn npm jdk8-openjdk
then
    echo "Não foi possível encontrar pacotes."
    exit 1
fi
echo "Pacotes prontos"

echo "Instalando React Native"
if ! sudo yarn global add react-native-cli
then
    echo "Não foi possível instalar o React Native"
    exit 1
fi
echo "Instalação finalizada"

echo "Configurações do React Native"
if ! sudo archlinux-java set java-8-openjdk
then
    echo "Não foi possível configurar o React Native"
    exit 1
fi

echo "Configurações do React Native"
if ! sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
then
    echo "Não foi possível configurar o React Native"
    exit 1
fi

echo "Configurações do React Native"
if ! sudo npm install -g npx
then
    echo "Não foi possível configurar o React Native"
    exit 1
fi
echo "Configuração finalizada"
