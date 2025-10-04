#!/bin/bash

# Script pour compiler l'APK avec les modifications Android 13
# À exécuter dans le dossier de votre projet

echo "🔨 Compilation de l'APK avec support Android 13..."

# Vérification de la présence de gradlew
if [ ! -f "gradlew" ]; then
    echo "❌ Erreur : gradlew non trouvé dans ce répertoire"
    echo "Assurez-vous d'être dans le dossier racine de votre projet Android"
    exit 1
fi

# Rendre gradlew exécutable
echo "🔧 Configuration des permissions..."
chmod +x gradlew

# Nettoyage du build précédent
echo "🧹 Nettoyage du build précédent..."
./gradlew clean

# Compilation de l'APK debug
echo "🔨 Compilation de l'APK debug..."
./gradlew assembleDebug

# Vérification de la compilation
if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Compilation réussie !"
    echo ""
    echo "📱 Votre APK est disponible dans :"
    echo "   app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    echo "📊 Informations de l'APK :"
    echo "   - Support Android 13 (API 33) ✅"
    echo "   - minSdk: 33"
    echo "   - targetSdk: 36"
    echo "   - Version: 1.4.6 (47)"
    echo ""
    echo "🚀 Vous pouvez maintenant installer cet APK sur votre téléphone !"
else
    echo "❌ Erreur lors de la compilation"
    echo "Vérifiez les logs ci-dessus pour plus de détails"
fi