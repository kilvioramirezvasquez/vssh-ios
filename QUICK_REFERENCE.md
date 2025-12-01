# 📋 Referencia Rápida - VSSH-KR iOS

## Comandos Esenciales

```bash
# Verificar configuración
cd ~/vssh-ios && ./verify_setup.sh

# Instalar dependencias
pod install

# Abrir workspace
open VSSHKR.xcworkspace

# Compilar desde CLI
./build.sh
```

## Estructura de Archivos

```
~/vssh-ios/
├── VSSHKR/              # Código Swift
│   ├── App/
│   ├── Models/
│   ├── Views/
│   ├── Services/
│   └── Utils/
├── *.md                 # Documentación
├── *.sh                 # Scripts
├── Podfile              # Dependencias
└── Info.plist           # Configuración
```

## Archivos Clave

| Archivo | Propósito |
|---------|-----------|
| `VSSHKRApp.swift` | Punto de entrada |
| `SSHService.swift` | Servicio SSH |
| `Connection.swift` | Modelo de datos |
| `MainView.swift` | Vista principal |
| `TerminalView.swift` | Terminal SSH |

## Configuración Importante

- **Bundle ID**: `com.venafi.vsshkr`
- **Deployment Target**: iOS 13.0
- **Interface**: SwiftUI
- **Terminal Type**: linux (por defecto)

## Documentación Rápida

- **START_HERE.md** - Empieza aquí
- **FINAL_STEPS.md** - Pasos de compilación
- **TROUBLESHOOTING.md** - Problemas comunes

## Verificación Rápida

✅ 8 archivos Swift
✅ Podfile configurado
✅ Documentación completa
✅ Scripts de ayuda

## Próximo Paso

Lee **START_HERE.md** o **FINAL_STEPS.md**
