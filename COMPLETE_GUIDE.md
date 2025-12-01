# Guía Completa - VSSH-KR iOS

## 📋 Tabla de Contenidos

1. [Requisitos Previos](#requisitos-previos)
2. [Preparación del Entorno](#preparación-del-entorno)
3. [Crear Proyecto Xcode](#crear-proyecto-xcode)
4. [Configurar Proyecto](#configurar-proyecto)
5. [Agregar Archivos](#agregar-archivos)
6. [Instalar Dependencias](#instalar-dependencias)
7. [Compilar y Ejecutar](#compilar-y-ejecutar)
8. [Verificación](#verificación)
9. [Solución de Problemas](#solución-de-problemas)

## Requisitos Previos

### Hardware y Software
- ✅ macOS 11.0 o superior
- ✅ Xcode 14.0 o superior
- ✅ iOS 13.0 o superior (para ejecutar)

### Herramientas
- ✅ CocoaPods instalado
- ✅ Git (opcional, para control de versiones)

### Verificar Instalación
```bash
# Verificar Xcode
xcodebuild -version

# Verificar CocoaPods
pod --version

# Si no está instalado:
sudo gem install cocoapods
```

## Preparación del Entorno

### 1. Navegar al Directorio
```bash
cd ~/vssh-ios
```

### 2. Verificar Archivos
```bash
./verify_setup.sh
```

Deberías ver:
- ✅ Directorio VSSHKR encontrado
- ✅ 8 archivos Swift encontrados
- ✅ Archivos clave presentes

## Crear Proyecto Xcode

### Paso 1: Abrir Xcode
```bash
open -a Xcode
```

### Paso 2: Crear Nuevo Proyecto
1. **File → New → Project** (⌘+Shift+N)
2. Seleccionar **iOS** en la barra lateral
3. Seleccionar **App** en la lista
4. Click **Next**

### Paso 3: Configurar Proyecto
- **Product Name**: `VSSHKR`
- **Team**: Tu equipo (o "None" temporalmente)
- **Organization Identifier**: `com.venafi`
- **Bundle Identifier**: Se genera automáticamente como `com.venafi.VSSHKR`
- **Interface**: **SwiftUI** ⚠️ IMPORTANTE
- **Language**: **Swift**
- **Storage**: None
- **Include Tests**: Opcional

### Paso 4: Guardar
- **Location**: `~/vssh-ios/`
- ✅ **Create Git repository**: Opcional
- Click **Create**

## Configurar Proyecto

### 1. Cambiar Bundle Identifier
1. Seleccionar el proyecto (arriba a la izquierda)
2. Seleccionar target **VSSHKR**
3. Pestaña **General**
4. Cambiar **Bundle Identifier** a: `com.venafi.vsshkr`

### 2. Configurar Deployment Target
1. En la misma pestaña **General**
2. **Deployment Info** → **iOS**: `13.0`

### 3. Configurar Signing
1. Pestaña **Signing & Capabilities**
2. ✅ **Automatically manage signing**
3. Seleccionar tu **Team**

## Agregar Archivos

### Paso 1: Eliminar Archivo Generado
1. En el navegador del proyecto, encontrar `VSSHKRApp.swift`
2. Click derecho → **Delete**
3. Seleccionar **Move to Trash**

### Paso 2: Agregar Nuestros Archivos
1. Click derecho en el grupo `VSSHKR` (raíz del proyecto)
2. **Add Files to "VSSHKR"...**
3. Navegar a `~/vssh-ios/VSSHKR/`
4. Seleccionar **TODOS** los archivos Swift:
   - `App/VSSHKRApp.swift`
   - `Models/Connection.swift`
   - `Views/MainView.swift`
   - `Views/TerminalView.swift`
   - `Views/ConnectionEditView.swift`
   - `Services/SSHService.swift`
   - `Services/ConnectionStorage.swift`
   - `Utils/AnsiFilter.swift`

5. Opciones importantes:
   - ✅ **Copy items if needed**
   - ✅ **Create groups** (NO "Create folder references")
   - ✅ **Add to targets: VSSHKR**

6. Click **Add**

### Paso 3: Verificar Estructura
El proyecto debería verse así:
```
VSSHKR
├── App
│   └── VSSHKRApp.swift
├── Models
│   └── Connection.swift
├── Views
│   ├── MainView.swift
│   ├── TerminalView.swift
│   └── ConnectionEditView.swift
├── Services
│   ├── SSHService.swift
│   └── ConnectionStorage.swift
└── Utils
    └── AnsiFilter.swift
```

## Instalar Dependencias

### Paso 1: Crear Podfile (si no existe)
El Podfile ya está creado en `~/vssh-ios/Podfile`

### Paso 2: Instalar Pods
```bash
cd ~/vssh-ios
pod install
```

Deberías ver:
```
Analyzing dependencies
Downloading dependencies
Installing NMSSH (2.3.0)
Generating Pods project
```

### Paso 3: Verificar Instalación
```bash
ls -la Pods/
```

Deberías ver el directorio `Pods/` con las dependencias.

## Compilar y Ejecutar

### Paso 1: Abrir Workspace
⚠️ **IMPORTANTE**: Siempre abre el `.xcworkspace`, NO el `.xcodeproj`

```bash
cd ~/vssh-ios
open VSSHKR.xcworkspace
```

O desde Xcode: **File → Open** → Seleccionar `VSSHKR.xcworkspace`

### Paso 2: Seleccionar Simulador
1. En la barra superior de Xcode
2. Click en el selector de dispositivo
3. Seleccionar **iPhone 14** (o cualquier simulador iOS 13+)

### Paso 3: Compilar
- **⌘+B** para compilar
- Esperar a que termine (puede tomar unos minutos la primera vez)

### Paso 4: Ejecutar
- **⌘+R** para ejecutar en el simulador
- La app debería abrirse en el simulador

## Verificación

### Verificar Compilación
1. ✅ No hay errores en el panel de errores
2. ✅ Build exitoso: "Build Succeeded"
3. ✅ La app se ejecuta en el simulador

### Verificar Funcionalidad
1. ✅ La app se abre correctamente
2. ✅ Se muestra la pantalla principal con tabs
3. ✅ Puedes crear una nueva conexión
4. ✅ Puedes guardar la conexión
5. ✅ Puedes conectarte vía SSH (cuando tengas un servidor)

### Verificar Imports
Abre cualquier archivo Swift y verifica que los imports funcionen:
```swift
import Foundation
import NMSSH  // Debería funcionar sin errores
```

## Solución de Problemas

Si encuentras problemas, consulta:
- **TROUBLESHOOTING.md** - Soluciones a problemas comunes
- **verify_setup.sh** - Script de diagnóstico

### Problemas Comunes

1. **"No such module 'NMSSH'**
   - Ejecutar `pod install`
   - Cerrar y reabrir `.xcworkspace`

2. **Error de compilación**
   - Limpiar: Product → Clean Build Folder (⇧⌘K)
   - Recompilar: ⌘+B

3. **Archivos no encontrados**
   - Verificar que estén en el target
   - File Inspector → Target Membership

## Próximos Pasos

Una vez que la app compile y ejecute:

1. **Probar conexión SSH** con un servidor de prueba
2. **Ajustar configuración PTY/TERM** si es necesario
3. **Probar con AcuCOBOL** para verificar compatibilidad
4. **Agregar funcionalidades faltantes** (macros, keys, etc.)

## Recursos Adicionales

- **INDEX.md** - Índice completo de documentación
- **COMPARISON.md** - Comparación con Android
- **CHECKLIST.md** - Lista de verificación

## Resumen de Comandos

```bash
# Verificar configuración
cd ~/vssh-ios && ./verify_setup.sh

# Instalar dependencias
pod install

# Abrir workspace
open VSSHKR.xcworkspace

# Compilar (en Xcode)
⌘+B

# Ejecutar (en Xcode)
⌘+R
```

¡Listo! Tu proyecto iOS está configurado y listo para desarrollar. 🎉

