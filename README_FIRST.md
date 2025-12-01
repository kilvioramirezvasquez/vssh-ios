# 👋 ¡Bienvenido a VSSH-KR iOS!

## 🎯 ¿Qué es esto?

Este es el proyecto iOS de **VSSH-KR**, portado desde la versión Android.
La aplicación permite conectarse a servidores SSH con soporte completo para AcuCOBOL.

## ⚡ Inicio Rápido (3 pasos)

### 1. Verificar que todo está listo
```bash
cd ~/vssh-ios
./verify_setup.sh
```

### 2. Crear proyecto Xcode
Abre Xcode y crea un nuevo proyecto:
- **File → New → Project**
- **iOS → App**
- Nombre: `VSSHKR`
- Interface: **SwiftUI**
- Guardar en: `~/vssh-ios/`

Luego copia todos los archivos Swift de `VSSHKR/` al proyecto.

### 3. Instalar y compilar
```bash
pod install
open VSSHKR.xcworkspace
# En Xcode: ⌘+B para compilar
```

## 📚 Documentación

- **QUICK_START.md** - Guía rápida
- **FINAL_STEPS.md** - Pasos detallados
- **INDEX.md** - Índice completo de documentación

## ✅ Lo que está listo

- ✅ 8 archivos Swift completos
- ✅ Modelos de datos
- ✅ Servicio SSH (NMSSH)
- ✅ Vistas SwiftUI
- ✅ Filtro ANSI
- ✅ Configuración PTY/TERM (compatible AcuCOBOL)

## 🚀 ¡Empieza aquí!

Lee **FINAL_STEPS.md** para los pasos completos de compilación.

