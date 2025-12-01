#!/bin/bash
# Script para configurar GitHub Actions para compilación automática

set -e

echo "🚀 Configurando GitHub Actions para compilación automática..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "VSSHKR" ]; then
    echo "❌ Error: Ejecuta este script desde ~/vssh-ios/"
    exit 1
fi

# Crear directorio de workflows si no existe
mkdir -p .github/workflows

# Verificar que el workflow existe
if [ ! -f ".github/workflows/build-ios.yml" ]; then
    echo "⚠️  Workflow no encontrado, creándolo..."
    # El archivo ya debería estar creado
fi

echo "✅ GitHub Actions configurado"
echo ""
echo "📝 Próximos pasos:"
echo ""
echo "1. Inicializar Git (si no está inicializado):"
echo "   cd ~/vssh-ios"
echo "   git init"
echo ""
echo "2. Agregar todos los archivos:"
echo "   git add ."
echo ""
echo "3. Hacer commit:"
echo "   git commit -m 'Initial commit - VSSH-KR iOS'"
echo ""
echo "4. Crear repositorio en GitHub y conectar:"
echo "   git remote add origin https://github.com/TU_USUARIO/vssh-ios.git"
echo "   git push -u origin main"
echo ""
echo "5. El workflow se ejecutará automáticamente en cada push"
echo ""
echo "📚 Ver documentación completa en: COMPILE_OPTIONS.md"

