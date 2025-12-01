#!/bin/bash
# Script para subir el proyecto VSSH-KR iOS a GitHub

set -e

echo "🚀 Preparando proyecto para subir a GitHub..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "VSSHKR" ]; then
    echo "❌ Error: Ejecuta este script desde ~/vssh-ios/"
    exit 1
fi

# Verificar si git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git no está instalado"
    echo "   Instala con: sudo apt-get install git"
    exit 1
fi

# Verificar si ya es un repositorio git
if [ -d ".git" ]; then
    echo "ℹ️  Ya es un repositorio Git"
    echo ""
    read -p "¿Continuar y agregar todos los archivos? (s/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Ss]$ ]]; then
        echo "Cancelado."
        exit 0
    fi
else
    echo "📦 Inicializando repositorio Git..."
    git init
    echo "✅ Repositorio inicializado"
fi

echo ""
echo "📝 Configurando Git (si es necesario)..."
echo ""

# Configurar usuario si no está configurado
if [ -z "$(git config user.name)" ]; then
    echo "⚠️  Usuario de Git no configurado"
    read -p "Ingresa tu nombre de usuario de Git: " GIT_USER
    git config user.name "$GIT_USER"
fi

if [ -z "$(git config user.email)" ]; then
    echo "⚠️  Email de Git no configurado"
    read -p "Ingresa tu email de Git: " GIT_EMAIL
    git config user.email "$GIT_EMAIL"
fi

echo ""
echo "📦 Agregando archivos..."
git add .

echo ""
echo "📋 Archivos agregados:"
git status --short | head -20

echo ""
read -p "¿Hacer commit? (s/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    git commit -m "Initial commit - VSSH-KR iOS

- Código Swift completo (8 archivos)
- Documentación completa (21 archivos)
- Scripts de ayuda (4 archivos)
- Configuración CI/CD con GitHub Actions
- Listo para compilar"
    echo "✅ Commit realizado"
else
    echo "⚠️  Commit cancelado. Puedes hacerlo manualmente con:"
    echo "   git commit -m 'Initial commit - VSSH-KR iOS'"
fi

echo ""
echo "════════════════════════════════════════"
echo "🔗 CONECTAR CON GITHUB"
echo "════════════════════════════════════════"
echo ""
echo "1. Ve a https://github.com/new"
echo "2. Crea un nuevo repositorio:"
echo "   - Nombre: vssh-ios (o el que prefieras)"
echo "   - Descripción: VSSH-KR iOS Application"
echo "   - Visibilidad: Público o Privado"
echo "   - ⚠️  NO marques 'Initialize with README'"
echo ""
echo "3. Después de crear el repositorio, ejecuta:"
echo ""
echo "   git remote add origin https://github.com/TU_USUARIO/vssh-ios.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "   (Reemplaza TU_USUARIO con tu usuario de GitHub)"
echo ""
echo "════════════════════════════════════════"
echo "📝 O ejecuta estos comandos ahora:"
echo "════════════════════════════════════════"
echo ""

read -p "¿Quieres ingresar la URL del repositorio ahora? (s/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    read -p "URL del repositorio (https://github.com/USUARIO/vssh-ios.git): " REPO_URL
    if [ ! -z "$REPO_URL" ]; then
        git remote add origin "$REPO_URL" 2>/dev/null || git remote set-url origin "$REPO_URL"
        git branch -M main
        echo ""
        echo "🚀 Subiendo a GitHub..."
        git push -u origin main
        echo ""
        echo "✅ ¡Proyecto subido a GitHub!"
        echo ""
        echo "📱 El workflow de GitHub Actions se ejecutará automáticamente"
        echo "   Ve a: https://github.com/$(echo $REPO_URL | sed 's/.*github.com\///' | sed 's/\.git$//')/actions"
    else
        echo "⚠️  URL vacía, saltando..."
    fi
else
    echo "ℹ️  Puedes conectarlo más tarde con los comandos mostrados arriba"
fi

echo ""
echo "✅ Proceso completado!"
echo ""
echo "📚 Ver REMOTE_COMPILE.md para más información sobre CI/CD"

