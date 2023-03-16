#!/bin/bash
#Script crée par Extasy

# Chemin du fichier à sauvegarder
source_path="/home/mon_fichier"

# Identifiants de connexion SSH pour le serveur source
source_user="root"
source_host="192.168.1.179"
source_password="123"

# Identifiants de connexion SSH pour le serveur de destination
dest_user="root"
dest_host="192.168.1.117"
dest_path="/home"
dest_password="123"

# Copie du fichier depuis le serveur source vers le serveur local
echo "Copie du fichier depuis $source_host vers le serveur local..."
sshpass -p "$source_password" scp -o "StrictHostKeyChecking=no" $source_user@$source_host:$source_path .

# Envoi du fichier vers le serveur de destination
echo "Envoi du fichier vers $dest_host..."
sshpass -p "$dest_password" scp -o "StrictHostKeyChecking=no" $source_path $dest_user@$dest_host:$dest_path

echo "Sauvegarde terminée."