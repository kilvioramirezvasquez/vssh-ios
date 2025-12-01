# Comparación Android vs iOS

## Equivalencias entre Plataformas

### Bibliotecas SSH

| Android | iOS |
|---------|-----|
| JSch (Java) | NMSSH (Objective-C/Swift) |
| `com.jcraft:jsch:0.1.55` | `pod 'NMSSH', '~> 2.3'` |

### Configuración PTY

**Android (JSch)**:
```kotlin
channel?.setPtyType("linux")
channel?.setPtySize(cols, rows, 0, 0)
channel?.setEnv("TERM", "linux")
```

**iOS (NMSSH)**:
```swift
try channel?.requestPty(withTerminalType: "linux", width: UInt(cols), height: UInt(rows))
try channel?.setEnvironmentVariable("TERM", value: "linux")
```

### Envío de Caracteres

**Android**:
```kotlin
outputStream?.write(character.toByteArray(Charsets.UTF_8))
```

**iOS**:
```swift
let data = character.data(using: .utf8) ?? Data()
try channel.write(data)
```

### Almacenamiento

| Android | iOS |
|---------|-----|
| SharedPreferences + Gson | UserDefaults + Codable |
| `ConnectionStorage.kt` | `ConnectionStorage.swift` |

### UI Framework

| Android | iOS |
|---------|-----|
| XML Layouts + ViewBinding | SwiftUI |
| Activities/Fragments | Views (SwiftUI) |

## Funcionalidades Implementadas

✅ **Completado**:
- Modelos de datos (Connection, etc.)
- Servicio SSH básico
- Filtro ANSI
- Almacenamiento de conexiones
- Vista de terminal básica
- Vista de conexiones

⚠️ **Pendiente**:
- Vista completa de edición de conexión
- Manejo de teclas de función
- Port forwarding
- Macros
- Gestión de claves

## Próximos Pasos

1. Crear proyecto Xcode completo
2. Implementar todas las vistas
3. Probar conexión SSH
4. Ajustar manejo de terminal para AcuCOBOL
5. Compilar y probar en dispositivo real

