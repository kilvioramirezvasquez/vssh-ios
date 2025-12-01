# ⚡ Instalación Rápida en iPhone

## 🚀 Método Más Rápido (Si tienes macOS)

### 1. Crear Proyecto Xcode
```bash
cd ~/vssh-ios
# Seguir FINAL_STEPS.md
```

### 2. Abrir en Xcode
```bash
open VSSHKR.xcworkspace
```

### 3. Conectar iPhone y Compilar
- Conecta iPhone por USB
- En Xcode, selecciona tu iPhone
- Presiona **⌘+R**
- ¡Listo! La app se instalará automáticamente

### 4. Confiar en el Certificado (Primera vez)
- En iPhone: Configuración → General → Gestión de VPN y Dispositivos
- Confía en el certificado del desarrollador

## 📱 Si NO tienes macOS

### Opción A: Usar GitHub Actions
1. Crea proyecto Xcode (una vez, en macOS o servicio en la nube)
2. Sube `.xcworkspace` a GitHub
3. El workflow compilará automáticamente
4. Descarga el IPA
5. Instala con AltStore o similar

### Opción B: Servicio en la Nube
- MacStadium
- AWS EC2 Mac
- MacinCloud
- Compila allí y descarga el IPA

### Opción C: Pedir a alguien con macOS
- Que compile la app
- Que te envíe el IPA
- Instalas con AltStore

## 🔧 Herramientas de Sideloading

- **AltStore** (gratis) - https://altstore.io
- **Sideloadly** (gratis)
- **3uTools** (Windows/Mac)

## ⚠️ Importante

**Para compilar iOS necesitas macOS con Xcode.** No hay forma de evitarlo.

**Opciones:**
1. ✅ Tener macOS (método más fácil)
2. ✅ Usar servicio en la nube (MacStadium, etc.)
3. ✅ Pedir a alguien que compile
4. ✅ Usar GitHub Actions (requiere proyecto Xcode primero)

---

**Ver `INSTALAR_EN_IPHONE.md` para guía completa detallada.**

