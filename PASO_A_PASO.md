# 📱 Guía Paso a Paso - Instalar en iPhone SIN macOS

## 🎯 Resumen

El workflow de GitHub Actions hará TODO automáticamente:
- ✅ Genera el proyecto Xcode
- ✅ Compila la app
- ✅ Crea el archivo IPA para descargar

**Tú solo necesitas:**
1. Esperar a que termine
2. Descargar el IPA
3. Instalarlo en tu iPhone

---

## 📋 PASO 1: Verificar que el Workflow se Ejecute

### 1.1. Ir a GitHub Actions

1. Abre tu navegador
2. Ve a: **https://github.com/kilvioramirezvasquez/vssh-ios**
3. Click en la pestaña **"Actions"** (arriba)

### 1.2. Ver el Workflow

Deberías ver:
- Una lista de "workflow runs"
- El más reciente debería estar ejecutándose o en cola
- Si no se ejecutó automáticamente, puedes ejecutarlo manualmente:
  - Click en **"Build iOS"** (izquierda)
  - Click en **"Run workflow"** (arriba derecha)
  - Click en el botón verde **"Run workflow"**

### 1.3. Esperar

- El workflow tomará **5-10 minutos**
- Verás los pasos ejecutándose en tiempo real
- Cuando termine, verás un **checkmark verde ✓**

---

## 📥 PASO 2: Descargar el IPA

### 2.1. Abrir el Workflow Completado

1. En la página de Actions
2. Click en el workflow que tiene el **checkmark verde ✓**
3. Se abrirá la página de detalles

### 2.2. Descargar Artefactos

1. Scroll hacia abajo en la página
2. Busca la sección **"Artifacts"** (al final)
3. Verás algo como: **"iOS-Build"** o **"build"**
4. Click en el nombre del artefacto para descargarlo
5. Se descargará un archivo `.zip`

### 2.3. Extraer el IPA

1. Extrae el archivo `.zip` que descargaste
2. Busca dentro el archivo `.ipa`
3. Guárdalo en un lugar fácil de encontrar (Escritorio, por ejemplo)

---

## 📱 PASO 3: Instalar en iPhone con AltStore

### 3.1. Instalar AltServer en tu PC

1. **Descargar AltServer**:
   - Ve a: **https://altstore.io**
   - Click en **"Download"**
   - Descarga la versión para Windows o Mac (según tu PC)

2. **Instalar AltServer**:
   - Ejecuta el instalador descargado
   - Sigue las instrucciones de instalación
   - AltServer se instalará en tu PC

3. **Abrir AltServer**:
   - Busca "AltServer" en el menú de inicio
   - Ábrelo (verás un ícono en la bandeja del sistema)

4. **Iniciar sesión**:
   - Click derecho en el ícono de AltServer
   - Click en **"Install Mail Plug-in"** (si usas Mail en Mac)
   - O simplemente inicia sesión con tu Apple ID cuando te lo pida

### 3.2. Instalar AltStore en iPhone

1. **Conectar iPhone**:
   - Conecta tu iPhone a la PC con el cable USB
   - Desbloquea el iPhone
   - Si te pregunta, confía en la computadora

2. **Instalar AltStore**:
   - En AltServer (en tu PC), click derecho en el ícono
   - Click en **"Install AltStore"**
   - Selecciona tu iPhone de la lista
   - Ingresa tu Apple ID y contraseña cuando te lo pida
   - Espera a que se instale (puede tomar 1-2 minutos)

3. **Confiar en el certificado** (primera vez):
   - En tu iPhone, ve a: **Configuración → General → Gestión de VPN y Dispositivos**
   - Busca tu Apple ID
   - Click en **"Confiar"**

### 3.3. Instalar la App VSSH-KR

1. **Abrir AltStore en iPhone**:
   - Busca "AltStore" en tu iPhone
   - Ábrelo (puede pedirte iniciar sesión)

2. **Instalar el IPA**:
   - En AltStore, ve a la pestaña **"My Apps"**
   - Click en el botón **"+"** (arriba a la derecha)
   - Selecciona **"From Files"** o **"From Computer"**
   - Navega y selecciona el archivo `.ipa` que descargaste
   - Espera a que se instale (puede tomar 1-2 minutos)

3. **¡Listo!**:
   - La app VSSH-KR aparecerá en tu pantalla de inicio
   - Puedes abrirla y usarla

---

## 🔄 PASO 4: Re-firmar la App (Cada 7 días)

La app instalada con cuenta gratuita de Apple es válida por 7 días.

### Para Re-firmar:

1. Abre **AltStore** en iPhone
2. Ve a **"My Apps"**
3. **Desliza hacia abajo** para refrescar
4. AltStore re-firmará automáticamente todas las apps
5. ¡Listo! La app seguirá funcionando otros 7 días

**Nota**: Debes hacer esto cada 7 días, o la app dejará de funcionar.

---

## 🆘 Solución de Problemas

### Problema: "No puedo ver el workflow en Actions"
**Solución**: 
- Asegúrate de estar en: https://github.com/kilvioramirezvasquez/vssh-ios/actions
- Click en "Build iOS" en el menú izquierdo

### Problema: "El workflow falla"
**Solución**:
- Revisa los logs del workflow
- Puede que necesite ajustes, pero el workflow está configurado para ser robusto

### Problema: "No veo los artefactos"
**Solución**:
- Asegúrate de que el workflow haya completado exitosamente (verde ✓)
- Los artefactos aparecen al final de la página del workflow
- Puede tomar unos minutos después de que termine

### Problema: "AltStore no instala la app"
**Solución**:
- Verifica que AltServer esté corriendo en tu PC
- Asegúrate de que el iPhone esté conectado
- Verifica que confiaste en el certificado en Configuración

### Problema: "La app no abre después de 7 días"
**Solución**:
- Abre AltStore
- Desliza hacia abajo en "My Apps" para re-firmar
- La app volverá a funcionar

---

## 📝 Checklist Rápido

- [ ] Workflow ejecutándose o completado en GitHub Actions
- [ ] IPA descargado de los artefactos
- [ ] AltServer instalado en PC
- [ ] AltStore instalado en iPhone
- [ ] IPA instalado desde AltStore
- [ ] App funcionando en iPhone

---

## 🎉 ¡Listo!

Una vez completados estos pasos, tendrás VSSH-KR instalado en tu iPhone y funcionando.

**Recuerda**: Re-firma la app cada 7 días deslizando hacia abajo en AltStore.

---

**¿Necesitas ayuda con algún paso específico?** Pregunta y te ayudo. 😊

