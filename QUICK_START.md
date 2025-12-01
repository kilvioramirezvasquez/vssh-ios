# Quick Start - VSSH-KR iOS

## 🚀 Inicio Rápido

### 1. Crear Proyecto Xcode

```bash
# Abrir Xcode y crear nuevo proyecto:
# File → New → Project → iOS → App
# Nombre: VSSHKR
# Interface: SwiftUI
# Language: Swift
```

### 2. Copiar Archivos

```bash
cd ~/vssh-ios
# Copiar todos los archivos Swift al proyecto Xcode
# Mantener la estructura de carpetas
```

### 3. Instalar Dependencias

```bash
cd ~/vssh-ios
pod install
```

### 4. Abrir y Compilar

```bash
open VSSHKR.xcworkspace
# En Xcode: ⌘+B para compilar
```

## 📁 Archivos Creados

- ✅ Modelos de datos (Connection, etc.)
- ✅ Servicio SSH (SSHService.swift)
- ✅ Vistas SwiftUI (MainView, TerminalView, etc.)
- ✅ Filtro ANSI (AnsiFilter.swift)
- ✅ Almacenamiento (ConnectionStorage.swift)

## ⚠️ Notas Importantes

1. **NMSSH** es la biblioteca SSH para iOS (equivalente a JSch)
2. El código está preparado para **enviar caracteres en tiempo real** (como vssh.apk)
3. La configuración de PTY y TERM es **igual que Android** para compatibilidad con AcuCOBOL
4. Necesitas **macOS con Xcode** para compilar

## 🔧 Solución de Problemas

### Error: "No such module 'NMSSH'"
```bash
pod install
# Cerrar y reabrir Xcode
```

### Error de compilación
- Limpiar build: **Product → Clean Build Folder** (⇧⌘K)
- Recompilar: **⌘+B**

