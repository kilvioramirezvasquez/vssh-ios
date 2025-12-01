# Instalación y Compilación para iOS

## Requisitos Previos

1. **macOS** con Xcode 14.0 o superior
2. **CocoaPods** instalado:
   ```bash
   sudo gem install cocoapods
   ```
3. **Cuenta de desarrollador de Apple** (para compilar en dispositivo real)

## Instalación de Dependencias

```bash
cd ~/vssh-ios
pod install
```

Esto instalará:
- **NMSSH**: Biblioteca SSH para iOS (equivalente a JSch)
- **SwiftTerm**: Soporte para terminal y ANSI (opcional)

## Abrir el Proyecto

```bash
open VSSHKR.xcworkspace
```

**Importante**: Abre el `.xcworkspace`, NO el `.xcodeproj`

## Compilar en Simulador

1. En Xcode, selecciona un simulador iOS (iPhone 14, etc.)
2. Presiona ⌘+B para compilar
3. Presiona ⌘+R para ejecutar

## Compilar para Dispositivo Real

1. Conecta tu iPhone/iPad
2. En Xcode, selecciona tu dispositivo
3. Ve a "Signing & Capabilities" en el proyecto
4. Selecciona tu "Team" (cuenta de desarrollador)
5. Xcode generará automáticamente un certificado
6. Compila e instala (⌘+R)

## Configuración del Proyecto

El proyecto está configurado para:
- **iOS 13.0+** como versión mínima
- **Swift 5.0+**
- **SwiftUI** para la interfaz

## Estructura del Código

- `Models/`: Modelos de datos (Connection, etc.)
- `Views/`: Vistas SwiftUI
- `Services/`: Servicios (SSH, Storage)
- `Utils/`: Utilidades (AnsiFilter)

## Notas Importantes

- **NMSSH** es la biblioteca SSH principal. Es similar a JSch pero con API diferente.
- El manejo de terminal envía caracteres en tiempo real (como vssh.apk)
- La configuración de PTY y TERM es igual que en Android para compatibilidad con AcuCOBOL

## Solución de Problemas

### Error: "No such module 'NMSSH'"
```bash
pod install
# Cierra y vuelve a abrir Xcode
```

### Error de firma
- Ve a "Signing & Capabilities"
- Selecciona tu Team
- Xcode generará el certificado automáticamente

### Error de compilación
- Limpia el build: Product → Clean Build Folder (⇧⌘K)
- Recompila: ⌘+B

