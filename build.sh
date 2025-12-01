#!/bin/bash
# Script para compilar VSSH-KR iOS
# Ejecutar desde ~/vssh-ios/

set -e

echo "🔨 Compilando VSSH-KR para iOS..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "VSSHKR" ]; then
    echo "❌ Error: Ejecuta este script desde ~/vssh-ios/"
    exit 1
fi

# Verificar Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo "❌ Xcode no encontrado"
    echo "   Instala Xcode desde la Mac App Store"
    exit 1
fi

# Verificar workspace
if [ ! -f "VSSHKR.xcworkspace/contents.xcworkspacedata" ]; then
    echo "⚠️  Workspace no encontrado"
    echo "   Primero crea el proyecto Xcode y ejecuta 'pod install'"
    echo ""
    echo "   O ejecuta: ./setup_project.sh"
    exit 1
fi

# Limpiar build anterior
echo "🧹 Limpiando build anterior..."
xcodebuild clean -workspace VSSHKR.xcworkspace -scheme VSSHKR 2>&1 | grep -E "CLEAN|error|warning" || true

echo ""
echo "🔨 Compilando..."
xcodebuild build \
    -workspace VSSHKR.xcworkspace \
    -scheme VSSHKR \
    -sdk iphonesimulator \
    -destination 'platform=iOS Simulator,name=iPhone 14' \
    2>&1 | tee build.log | grep -E "BUILD|error|warning|succeeded|failed" || true

echo ""
if grep -q "BUILD SUCCEEDED" build.log; then
    echo "✅ Compilación exitosa!"
    echo ""
    echo "📱 Para ejecutar en simulador:"
    echo "   open VSSHKR.xcworkspace"
    echo "   Luego ⌘+R en Xcode"
else
    echo "❌ Error en la compilación"
    echo "   Revisa build.log para más detalles"
fi
