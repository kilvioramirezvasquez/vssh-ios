#!/bin/bash
# Script para verificar que todo está listo para compilar

echo "🔍 Verificando configuración de VSSH-KR iOS..."
echo ""

ERRORS=0

# Verificar directorio
if [ ! -d "VSSHKR" ]; then
    echo "❌ Directorio VSSHKR no encontrado"
    ERRORS=$((ERRORS + 1))
else
    echo "✅ Directorio VSSHKR encontrado"
fi

# Verificar archivos Swift
SWIFT_FILES=$(find VSSHKR -name "*.swift" 2>/dev/null | wc -l)
if [ "$SWIFT_FILES" -lt 8 ]; then
    echo "⚠️  Solo $SWIFT_FILES archivos Swift encontrados (esperados: 8+)"
    ERRORS=$((ERRORS + 1))
else
    echo "✅ $SWIFT_FILES archivos Swift encontrados"
fi

# Verificar archivos clave
echo ""
echo "Verificando archivos clave:"
for file in "VSSHKR/App/VSSHKRApp.swift" "VSSHKR/Services/SSHService.swift" "VSSHKR/Views/MainView.swift" "Podfile"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ❌ $file (FALTANTE)"
        ERRORS=$((ERRORS + 1))
    fi
done

# Verificar CocoaPods
echo ""
if command -v pod &> /dev/null; then
    POD_VERSION=$(pod --version)
    echo "✅ CocoaPods instalado (v$POD_VERSION)"
else
    echo "⚠️  CocoaPods no instalado"
    echo "   Instalar con: sudo gem install cocoapods"
fi

# Verificar Xcode
echo ""
if command -v xcodebuild &> /dev/null; then
    XCODE_VERSION=$(xcodebuild -version | head -1)
    echo "✅ $XCODE_VERSION encontrado"
else
    echo "⚠️  Xcode no encontrado en PATH"
    echo "   Asegúrate de tener Xcode instalado"
fi

# Verificar workspace (si existe)
echo ""
if [ -f "VSSHKR.xcworkspace/contents.xcworkspacedata" ]; then
    echo "✅ Workspace encontrado (proyecto ya creado)"
    if [ -d "Pods" ]; then
        echo "✅ Dependencias instaladas (Pods/)"
    else
        echo "⚠️  Dependencias no instaladas"
        echo "   Ejecutar: pod install"
    fi
else
    echo "ℹ️  Workspace no encontrado (proyecto aún no creado)"
    echo "   Sigue los pasos en FINAL_STEPS.md"
fi

echo ""
if [ $ERRORS -eq 0 ]; then
    echo "✅ Todo listo para compilar!"
    echo ""
    echo "📱 Próximos pasos:"
    if [ ! -f "VSSHKR.xcworkspace/contents.xcworkspacedata" ]; then
        echo "   1. Crear proyecto Xcode (ver FINAL_STEPS.md)"
        echo "   2. pod install"
        echo "   3. open VSSHKR.xcworkspace"
    else
        echo "   1. open VSSHKR.xcworkspace"
        echo "   2. ⌘+B para compilar"
    fi
else
    echo "⚠️  Se encontraron $ERRORS problema(s)"
    echo "   Revisa los errores arriba"
fi

