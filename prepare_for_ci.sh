#!/bin/bash
# Script para preparar el proyecto para CI/CD

echo "🔧 Preparando proyecto para compilación CI/CD..."
echo ""

# Verificar estructura
if [ ! -d "VSSHKR" ]; then
    echo "❌ Error: Directorio VSSHKR no encontrado"
    exit 1
fi

# Crear directorios necesarios
mkdir -p .github/workflows
mkdir -p build

echo "✅ Estructura creada"
echo ""

# Verificar archivos clave
echo "Verificando archivos:"
for file in ".github/workflows/build-ios.yml" "Podfile" "project.yml"; do
    if [ -f "$file" ]; then
        echo "  ✅ $file"
    else
        echo "  ⚠️  $file (no encontrado)"
    fi
done

echo ""
echo "📝 Para usar CI/CD:"
echo ""
echo "1. git init"
echo "2. git add ."
echo "3. git commit -m 'Initial commit'"
echo "4. git remote add origin https://github.com/USUARIO/vssh-ios.git"
echo "5. git push -u origin main"
echo ""
echo "El workflow se ejecutará automáticamente."
echo ""
echo "📚 Ver REMOTE_COMPILE.md para más detalles"
