# Guía para Crear el Proyecto Xcode

## Opción 1: Crear Proyecto desde Xcode (Recomendado)

1. **Abrir Xcode**
2. **File → New → Project**
3. Seleccionar:
   - **Platform**: iOS
   - **Template**: App
   - **Name**: `VSSHKR`
   - **Interface**: SwiftUI
   - **Language**: Swift
   - **Storage**: None (usaremos UserDefaults)
4. **Guardar** en `~/vssh-ios/`

5. **Copiar archivos Swift**:
   - Copia todos los archivos de `VSSHKR/` al proyecto Xcode
   - Asegúrate de mantener la estructura de carpetas

6. **Instalar CocoaPods**:
   ```bash
   cd ~/vssh-ios
   pod install
   ```

7. **Abrir workspace**:
   ```bash
   open VSSHKR.xcworkspace
   ```

## Opción 2: Usar Swift Package Manager (Alternativa)

Si prefieres no usar CocoaPods:

1. Crear proyecto Xcode como arriba
2. En Xcode: **File → Add Packages**
3. Agregar:
   - NMSSH: `https://github.com/NMSSH/NMSSH.git`

## Configuración del Proyecto

### 1. Bundle Identifier
- Cambiar a: `com.venafi.vsshkr`

### 2. Deployment Target
- iOS 13.0 o superior

### 3. Capabilities
- No se requieren capacidades especiales para SSH básico

### 4. Info.plist
- Ya está creado en `~/vssh-ios/Info.plist`
- Copiar contenido al Info.plist del proyecto Xcode

## Estructura de Archivos en Xcode

```
VSSHKR/
├── App/
│   └── VSSHKRApp.swift
├── Models/
│   └── Connection.swift
├── Views/
│   ├── MainView.swift
│   ├── ConnectionsView.swift
│   ├── ConnectionEditView.swift
│   └── TerminalView.swift
├── Services/
│   ├── SSHService.swift
│   └── ConnectionStorage.swift
└── Utils/
    └── AnsiFilter.swift
```

## Verificar Compilación

1. Seleccionar simulador (iPhone 14, etc.)
2. **⌘+B** para compilar
3. Si hay errores, verificar:
   - Que todos los archivos estén agregados al target
   - Que NMSSH esté instalado correctamente
   - Que las importaciones sean correctas

## Próximos Pasos

Una vez compilado:
1. Probar conexión SSH básica
2. Ajustar manejo de terminal
3. Implementar funcionalidades faltantes
4. Probar en dispositivo real

