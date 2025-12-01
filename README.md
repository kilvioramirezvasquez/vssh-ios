# VSSH-KR iOS

Aplicación iOS para VSSH-KR, portada desde la versión Android.

## 🚀 Inicio Rápido

### 1. Verificar Configuración
```bash
cd ~/vssh-ios
./verify_setup.sh
```

### 2. Crear Proyecto Xcode
- Abrir Xcode
- File → New → Project → iOS → App
- Nombre: `VSSHKR`
- Interface: **SwiftUI**
- Guardar en: `~/vssh-ios/`

### 3. Copiar Archivos y Compilar
```bash
# Copiar archivos Swift al proyecto Xcode
# Luego:
pod install
open VSSHKR.xcworkspace
# En Xcode: ⌘+B para compilar
```

## 📖 Documentación

- **[START_HERE.md](START_HERE.md)** - 👈 Empieza aquí
- **[FINAL_STEPS.md](FINAL_STEPS.md)** - Pasos detallados de compilación
- **[COMPLETE_GUIDE.md](COMPLETE_GUIDE.md)** - Guía completa paso a paso
- **[TROUBLESHOOTING.md](TROUBLESHOOTING.md)** - Solución de problemas
- **[INDEX.md](INDEX.md)** - Índice completo de documentación

## ✨ Características

- ✅ Conexión SSH con NMSSH
- ✅ Terminal interactivo
- ✅ Configuración PTY/TERM (compatible AcuCOBOL)
- ✅ Filtro ANSI
- ✅ Almacenamiento persistente
- ✅ Interfaz SwiftUI moderna

## 📁 Estructura

```
VSSHKR/
├── App/          - Punto de entrada
├── Models/       - Modelos de datos
├── Views/        - Vistas SwiftUI
├── Services/     - Servicios (SSH, Storage)
└── Utils/        - Utilidades (AnsiFilter)
```

## 🔧 Requisitos

- macOS 11.0+
- Xcode 14.0+
- CocoaPods
- iOS 13.0+ (para ejecutar)

## 📦 Dependencias

- **NMSSH** (~2.3.0) - Biblioteca SSH para iOS

## 🎯 Estado

✅ **Listo para compilar**

Todo el código está completo y documentado. Solo falta crear el proyecto Xcode y compilar.

## 📝 Notas

- Siempre usar `.xcworkspace` (no `.xcodeproj`) cuando hay CocoaPods
- TERM=linux por defecto para compatibilidad con AcuCOBOL
- Los caracteres se envían en tiempo real (como vssh.apk)

## 🆘 Ayuda

Consulta la documentación o ejecuta:
```bash
./verify_setup.sh
```

---

**Ubicación**: `~/vssh-ios/`  
**Estado**: ✅ Listo para compilar
