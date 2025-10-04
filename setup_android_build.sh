#!/bin/bash

# Script pour configurer la compilation Android sur Termux
# À exécuter dans Termux sur votre téléphone Android

echo "🚀 Configuration de l'environnement de compilation Android..."

# Mise à jour des paquets
echo "📦 Mise à jour des paquets..."
pkg update && pkg upgrade -y

# Installation des outils nécessaires
echo "🔧 Installation des outils..."
pkg install openjdk-17 wget unzip git -y

# Création du répertoire SDK
echo "📁 Création du répertoire Android SDK..."
mkdir -p ~/android-sdk
cd ~/android-sdk

# Téléchargement des outils SDK
echo "⬇️ Téléchargement des outils Android SDK..."
wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip

# Extraction
echo "📦 Extraction des outils..."
unzip commandlinetools-linux-11076708_latest.zip
mkdir -p cmdline-tools/latest
mv cmdline-tools/* cmdline-tools/latest/ 2>/dev/null || true

# Configuration des variables d'environnement
echo "⚙️ Configuration des variables d'environnement..."
echo 'export ANDROID_HOME=~/android-sdk' >> ~/.bashrc
echo 'export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools' >> ~/.bashrc
source ~/.bashrc

# Acceptation des licences
echo "📋 Acceptation des licences..."
yes | sdkmanager --licenses

# Installation des composants SDK
echo "🔧 Installation des composants SDK..."
sdkmanager "platform-tools" "platforms;android-33" "platforms;android-34" "platforms;android-36" "build-tools;34.0.0"

echo "✅ Configuration terminée !"
echo ""
echo "📝 Instructions suivantes :"
echo "1. Copiez votre projet dans Termux"
echo "2. Naviguez vers le dossier du projet : cd /path/to/project"
echo "3. Rendez gradlew exécutable : chmod +x gradlew"
echo "4. Compilez l'APK : ./gradlew assembleDebug"
echo ""
echo "🎯 L'APK sera généré dans : app/build/outputs/apk/debug/"