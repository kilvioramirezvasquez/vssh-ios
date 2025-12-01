# ✅ Checklist - Preparación iOS

## Antes de Compilar

- [ ] macOS con Xcode instalado
- [ ] CocoaPods instalado (`pod --version`)
- [ ] Archivos Swift creados en `~/vssh-ios/VSSHKR/`
- [ ] Podfile configurado

## Crear Proyecto Xcode

- [ ] Abrir Xcode
- [ ] Crear nuevo proyecto iOS App
- [ ] Nombre: VSSHKR
- [ ] Interface: SwiftUI
- [ ] Guardar en ~/vssh-ios/
- [ ] Bundle ID: com.venafi.vsshkr

## Agregar Archivos

- [ ] Copiar VSSHKRApp.swift (reemplazar el generado)
- [ ] Agregar Models/Connection.swift
- [ ] Agregar Views/MainView.swift
- [ ] Agregar Views/TerminalView.swift
- [ ] Agregar Views/ConnectionEditView.swift
- [ ] Agregar Services/SSHService.swift
- [ ] Agregar Services/ConnectionStorage.swift
- [ ] Agregar Utils/AnsiFilter.swift
- [ ] Verificar que todos estén en el target

## Configurar Dependencias

- [ ] Ejecutar `pod install`
- [ ] Abrir `VSSHKR.xcworkspace` (NO .xcodeproj)
- [ ] Verificar que NMSSH esté disponible

## Configuración del Proyecto

- [ ] Bundle Identifier: com.venafi.vsshkr
- [ ] Deployment Target: iOS 13.0
- [ ] Swift Version: 5.0
- [ ] Info.plist configurado

## Compilar

- [ ] Seleccionar simulador (iPhone 14, etc.)
- [ ] Compilar (⌘+B)
- [ ] Verificar que no hay errores
- [ ] Ejecutar (⌘+R)

## Probar Funcionalidad

- [ ] La app se abre correctamente
- [ ] Se puede crear una conexión
- [ ] Se puede conectar vía SSH
- [ ] El terminal muestra output
- [ ] Se pueden enviar caracteres
- [ ] El filtro ANSI funciona

## Notas

- Siempre usar `.xcworkspace`, nunca `.xcodeproj` cuando hay CocoaPods
- Si hay errores, limpiar build: Product → Clean Build Folder (⇧⌘K)

