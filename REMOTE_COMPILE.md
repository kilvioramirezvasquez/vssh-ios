# 🔄 Compilación Remota - VSSH-KR iOS

## 🎯 Objetivo

Compilar la aplicación iOS sin tener macOS localmente.

## ✅ Solución: GitHub Actions

GitHub Actions puede compilar tu app iOS automáticamente usando runners de macOS.

## 📋 Pasos para Configurar

### 1. Preparar el Repositorio

```bash
cd ~/vssh-ios

# Inicializar Git (si no está inicializado)
git init

# Agregar todos los archivos
git add .

# Hacer commit
git commit -m "Initial commit - VSSH-KR iOS"
```

### 2. Crear Repositorio en GitHub

1. Ve a https://github.com/new
2. Crea un nuevo repositorio (público o privado)
3. **NO** inicialices con README (ya tenemos archivos)

### 3. Conectar y Subir

```bash
# Reemplaza TU_USUARIO con tu usuario de GitHub
git remote add origin https://github.com/TU_USUARIO/vssh-ios.git
git branch -M main
git push -u origin main
```

### 4. El Workflow se Ejecutará Automáticamente

- Ve a la pestaña **Actions** en GitHub
- Verás el workflow ejecutándose
- Cuando termine, podrás descargar los artefactos

## 📦 Descargar Artefactos Compilados

1. Ve a **Actions** en GitHub
2. Click en el último workflow ejecutado
3. Scroll hacia abajo hasta **Artifacts**
4. Descarga **iOS-Build**

## ⚠️ Limitación: Proyecto Xcode

**Problema:** El workflow necesita el proyecto Xcode (`.xcworkspace`), pero este solo se puede crear en macOS.

**Soluciones:**

### Opción A: Usar xcodegen (Recomendado)

Si el workflow puede usar xcodegen, podemos generar el proyecto automáticamente:

```yaml
- name: Generate Xcode Project
  run: |
    brew install xcodegen
    xcodegen generate
```

### Opción B: Crear Proyecto Manualmente Primera Vez

1. Accede a macOS (amigo, VM, servicio en la nube)
2. Crea el proyecto Xcode siguiendo `FINAL_STEPS.md`
3. Sube el `.xcworkspace` al repositorio
4. Luego el CI/CD funcionará automáticamente

### Opción C: Usar Script de Automatización

Podemos crear un script que genere el proyecto usando herramientas de línea de comandos.

## 🔧 Configuración Actual

El workflow (`.github/workflows/build-ios.yml`) está configurado para:

- ✅ Instalar CocoaPods
- ✅ Instalar dependencias (pod install)
- ✅ Compilar la app
- ✅ Crear archivo IPA
- ✅ Subir artefactos

## 📝 Notas

1. **Primera vez:** Necesitarás crear el proyecto Xcode manualmente
2. **Certificados:** Los builds serán sin firmar (solo para testing)
3. **Costo:** Gratis para repositorios públicos, limitado para privados

## 🚀 Alternativa: Servicios Pagos

Si necesitas compilación más frecuente o con certificados:

- **MacStadium**: $50-200/mes
- **AWS EC2 Mac**: Pago por uso
- **MacinCloud**: $20-50/mes

## ✅ Ventajas de GitHub Actions

- ✅ Gratis para repos públicos
- ✅ Automático en cada push
- ✅ No necesitas macOS
- ✅ Historial de builds
- ✅ Artefactos descargables

## 📚 Documentación Relacionada

- `COMPILE_OPTIONS.md` - Todas las opciones de compilación
- `FINAL_STEPS.md` - Pasos para compilar manualmente
- `.github/workflows/build-ios.yml` - Configuración del workflow

---

**Conclusión:** GitHub Actions es la mejor opción para compilar desde Linux. Solo necesitas subir el código y el workflow hará el resto.

