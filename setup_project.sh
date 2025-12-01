#!/bin/bash
# Script para configurar el proyecto iOS VSSH-KR

set -e

echo "🚀 Configurando proyecto VSSH-KR para iOS..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -d "VSSHKR" ]; then
    echo "❌ Error: Directorio VSSHKR no encontrado"
    echo "   Ejecuta este script desde ~/vssh-ios/"
    exit 1
fi

# Verificar CocoaPods
if ! command -v pod &> /dev/null; then
    echo "⚠️  CocoaPods no está instalado"
    echo "   Instalando CocoaPods..."
    sudo gem install cocoapods || {
        echo "❌ Error instalando CocoaPods"
        echo "   Instala manualmente: sudo gem install cocoapods"
        exit 1
    }
fi

echo "✅ CocoaPods encontrado"
echo ""

# Verificar Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo "⚠️  Xcode no encontrado en PATH"
    echo "   Asegúrate de tener Xcode instalado"
    echo "   Puedes crear el proyecto manualmente en Xcode"
    echo ""
    echo "📝 Pasos manuales:"
    echo "   1. Abrir Xcode"
    echo "   2. File → New → Project → iOS → App"
    echo "   3. Nombre: VSSHKR"
    echo "   4. Interface: SwiftUI"
    echo "   5. Guardar en ~/vssh-ios/"
    echo "   6. Copiar archivos Swift al proyecto"
    echo "   7. Ejecutar: pod install"
    exit 0
fi

echo "✅ Xcode encontrado"
echo ""

# Intentar crear proyecto con xcodegen si está disponible
if command -v xcodegen &> /dev/null; then
    echo "📦 Generando proyecto Xcode con xcodegen..."
    xcodegen generate
    echo "✅ Proyecto generado"
    echo ""
else
    echo "ℹ️  xcodegen no está instalado (opcional)"
    echo "   Puedes instalarlo con: brew install xcodegen"
    echo "   O crear el proyecto manualmente en Xcode"
    echo ""
fi

# Instalar dependencias con CocoaPods
echo "📦 Instalando dependencias con CocoaPods..."
pod install

echo ""
echo "✅ Configuración completada!"
echo ""
echo "📱 Próximos pasos:"
echo "   1. Abrir Xcode:"
echo "      open VSSHKR.xcworkspace"
echo ""
echo "   2. O si creaste el proyecto manualmente:"
echo "      - Copia los archivos Swift de VSSHKR/ al proyecto"
echo "      - Asegúrate de agregarlos al target"
echo "      - Compila con ⌘+B"
echo ""

