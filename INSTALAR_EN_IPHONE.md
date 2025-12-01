# 📱 Cómo Instalar VSSH-KR en tu iPhone

## 🎯 Opciones de Instalación

Hay varias formas de instalar la aplicación en tu iPhone. Elige la que mejor se adapte a tu situación:

## Opción 1: Compilar en macOS con Xcode (Recomendado)

### Requisitos:
- ✅ macOS con Xcode instalado
- ✅ iPhone conectado por USB
- ✅ Cuenta de desarrollador de Apple (gratis o de pago)

### Pasos:

1. **Crear el proyecto Xcode**:
   ```bash
   cd ~/vssh-ios
   # Sigue FINAL_STEPS.md para crear el proyecto
   ```

2. **Abrir en Xcode**:
   ```bash
   open VSSHKR.xcworkspace
   ```

3. **Conectar tu iPhone**:
   - Conecta el iPhone por USB
   - Desbloquea el iPhone
   - Confía en la computadora si te lo pide

4. **Seleccionar dispositivo en Xcode**:
   - En la barra superior de Xcode
   - Selecciona tu iPhone de la lista de dispositivos

5. **Configurar firma**:
   - Selecciona el proyecto en el navegador
   - Ve a "Signing & Capabilities"
   - Selecciona tu "Team" (cuenta de Apple)
   - Xcode generará el certificado automáticamente

6. **Compilar e instalar**:
   - Presiona **⌘+R** (o click en el botón Play)
   - Xcode compilará e instalará en tu iPhone
   - En el iPhone: Ve a Configuración → General → Gestión de VPN y Dispositivos
   - Confía en el certificado del desarrollador

## Opción 2: Usar GitHub Actions (Requiere proyecto Xcode)

### Requisitos:
- ✅ Proyecto Xcode ya creado y subido a GitHub
- ✅ Workflow configurado para generar IPA

### Pasos:

1. **Crear proyecto Xcode** (una vez):
   - En macOS, crea el proyecto
   - Ejecuta `pod install`
   - Sube el `.xcworkspace` a GitHub

2. **El workflow compilará automáticamente**:
   - Ve a: https://github.com/kilvioramirezvasquez/vssh-ios/actions
   - Espera a que el workflow complete
   - Descarga los artefactos (IPA)

3. **Instalar el IPA**:
   - Usa herramientas como:
     - **AltStore** (gratis, requiere AltServer en Mac/PC)
     - **Sideloadly** (gratis, requiere Mac/PC)
     - **3uTools** (Windows/Mac)

## Opción 3: TestFlight (Requiere cuenta de desarrollador)

### Requisitos:
- ✅ Cuenta de desarrollador de Apple ($99/año)
- ✅ Proyecto Xcode compilado

### Pasos:

1. **Compilar para distribución**:
   - En Xcode: Product → Archive
   - Exportar para App Store Connect

2. **Subir a TestFlight**:
   - Usa Xcode Organizer
   - O App Store Connect

3. **Instalar desde TestFlight**:
   - Descarga TestFlight desde App Store
   - Acepta la invitación
   - Instala la app

## Opción 4: Sideloading con AltStore (Gratis)

### Requisitos:
- ✅ Mac o PC con Windows
- ✅ iPhone
- ✅ Cable USB

### Pasos:

1. **Descargar AltServer**:
   - Mac: https://altstore.io
   - Windows: https://altstore.io

2. **Instalar AltServer**:
   - Sigue las instrucciones del sitio
   - Inicia sesión con tu Apple ID

3. **Instalar AltStore en iPhone**:
   - Abre AltServer
   - Conecta tu iPhone
   - Click en "Install AltStore" → Tu iPhone

4. **Instalar la app**:
   - Compila la app en Xcode
   - Exporta el IPA
   - Abre AltStore en iPhone
   - Usa "My Apps" → "+" → Selecciona el IPA

## Opción 5: Compilar y transferir manualmente

### Pasos:

1. **Compilar en Xcode**:
   ```bash
   # En macOS
   cd ~/vssh-ios
   open VSSHKR.xcworkspace
   # En Xcode: Product → Archive
   ```

2. **Exportar IPA**:
   - Xcode Organizer → Distribute App
   - Selecciona "Ad Hoc" o "Development"
   - Exporta el IPA

3. **Transferir al iPhone**:
   - Usa AirDrop
   - O transfiere por cable y usa iTunes/Finder
   - O usa herramientas de sideloading

## 🔐 Notas sobre Certificados

### Cuenta Gratuita de Apple:
- ✅ Permite instalar en tu propio iPhone
- ✅ Certificado válido por 7 días
- ✅ Necesitas re-firmar cada semana
- ✅ Límite de 3 apps simultáneas

### Cuenta de Desarrollador ($99/año):
- ✅ Certificado válido por 1 año
- ✅ Puedes distribuir a otros
- ✅ TestFlight incluido
- ✅ Sin límite de apps

## 📝 Pasos Rápidos (Resumen)

### Si tienes macOS con Xcode:

```bash
# 1. Crear proyecto (una vez)
cd ~/vssh-ios
# Seguir FINAL_STEPS.md

# 2. Abrir en Xcode
open VSSHKR.xcworkspace

# 3. Conectar iPhone y compilar
# En Xcode: ⌘+R
```

### Si NO tienes macOS:

1. Necesitas acceso a macOS (amigo, servicio en la nube)
2. O usar GitHub Actions para compilar (requiere proyecto Xcode)
3. O usar servicios de compilación remota

## 🆘 Solución de Problemas

### Error: "Untrusted Developer"
- Ve a: Configuración → General → Gestión de VPN y Dispositivos
- Confía en el certificado del desarrollador

### Error: "App installation failed"
- Verifica que el certificado esté válido
- Re-firma la app en Xcode
- Verifica que el iPhone esté desbloqueado

### Error: "Device not found"
- Verifica la conexión USB
- Desbloquea el iPhone
- Confía en la computadora

## 📚 Documentación Relacionada

- `FINAL_STEPS.md` - Cómo crear el proyecto Xcode
- `COMPLETE_GUIDE.md` - Guía completa de compilación
- `REMOTE_COMPILE.md` - Compilación remota con GitHub Actions

---

**La forma más fácil es compilar directamente en macOS con Xcode conectando tu iPhone.** 📱

