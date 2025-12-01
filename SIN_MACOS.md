# 📱 Instalar en iPhone SIN macOS

## ✅ Solución: GitHub Actions Genera el Proyecto Automáticamente

**¡Buenas noticias!** He modificado el workflow para que genere el proyecto Xcode automáticamente usando `xcodegen`. **Ya NO necesitas macOS** para crear el proyecto.

## 🚀 Cómo Funciona

1. **El workflow se ejecuta automáticamente** en cada push
2. **Instala xcodegen** en el runner de macOS
3. **Genera el proyecto Xcode** automáticamente desde `project.yml`
4. **Instala dependencias** (CocoaPods)
5. **Compila la app** iOS
6. **Genera el IPA** para descargar

## 📥 Pasos para Obtener el IPA

### 1. Esperar a que el Workflow Complete

1. Ve a: https://github.com/kilvioramirezvasquez/vssh-ios/actions
2. Espera a que el workflow se ejecute (puede tomar 5-10 minutos)
3. Cuando termine, verás un checkmark verde ✓

### 2. Descargar el IPA

1. Click en el workflow completado
2. Scroll hacia abajo hasta "Artifacts"
3. Descarga "iOS-Build" (o el nombre del artefacto)
4. Extrae el archivo ZIP
5. Busca el archivo `.ipa` dentro

### 3. Instalar en iPhone

Tienes varias opciones:

#### Opción A: AltStore (Recomendado - Gratis)

1. **Instalar AltServer en tu PC/Mac**:
   - Descarga de: https://altstore.io
   - Instala AltServer
   - Inicia sesión con tu Apple ID

2. **Instalar AltStore en iPhone**:
   - Conecta iPhone por USB
   - Abre AltServer
   - Click "Install AltStore" → Tu iPhone
   - Sigue las instrucciones

3. **Instalar la app**:
   - Abre AltStore en iPhone
   - Ve a "My Apps"
   - Click "+" (arriba)
   - Selecciona el archivo `.ipa`
   - Espera a que se instale

#### Opción B: Sideloadly (Gratis)

1. Descarga Sideloadly: https://sideloadly.io
2. Conecta tu iPhone
3. Arrastra el `.ipa` a Sideloadly
4. Inicia sesión con tu Apple ID
5. Click "Start" y espera

#### Opción C: 3uTools (Windows/Mac)

1. Descarga 3uTools: https://www.3u.com
2. Conecta iPhone
3. Ve a "Toolbox" → "IPA Installer"
4. Selecciona el `.ipa`
5. Instala

## ⚠️ Notas Importantes

### Certificados
- Las apps instaladas con AltStore/Sideloadly usan tu Apple ID
- Son válidas por 7 días (cuenta gratuita)
- Necesitas re-firmar cada semana
- Límite de 3 apps simultáneas (cuenta gratuita)

### Primera Instalación
- En iPhone: Configuración → General → Gestión de VPN y Dispositivos
- Confía en el certificado de tu Apple ID

## 🔄 Re-firmar la App (Cada 7 días)

1. Abre AltStore en iPhone
2. Ve a "My Apps"
3. Desliza hacia abajo para refrescar
4. La app se re-firmará automáticamente

## 📊 Estado Actual

- ✅ Workflow configurado para generar proyecto automáticamente
- ✅ No necesitas macOS para crear el proyecto
- ⏳ Espera a que el workflow se ejecute
- ⏳ Descarga el IPA de los artefactos
- ⏳ Instala con AltStore o similar

## 🎯 Próximos Pasos

1. **Espera el próximo push** (o ejecuta el workflow manualmente)
2. **El workflow generará el proyecto y compilará**
3. **Descarga el IPA** de los artefactos
4. **Instala en iPhone** con AltStore

## 📚 Documentación

- `INSTALAR_EN_IPHONE.md` - Guía completa de instalación
- `INSTALACION_RAPIDA.md` - Guía rápida

---

**¡Ya no necesitas macOS! El workflow hace todo automáticamente.** 🎉

