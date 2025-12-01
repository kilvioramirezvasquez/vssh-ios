# Solución de Problemas - VSSH-KR iOS

## Problemas Comunes y Soluciones

### 1. Error: "No such module 'NMSSH'"

**Síntomas:**
```
error: No such module 'NMSSH'
```

**Solución:**
```bash
cd ~/vssh-ios
pod install
# Cerrar Xcode completamente
# Reabrir VSSHKR.xcworkspace (NO .xcodeproj)
```

**Verificar:**
- ¿Abriste el `.xcworkspace` y no el `.xcodeproj`?
- ¿Ejecutaste `pod install`?
- ¿El directorio `Pods/` existe?

### 2. Error: Archivos Swift no encontrados

**Síntomas:**
```
error: Cannot find 'Connection' in scope
error: Cannot find 'SSHService' in scope
```

**Solución:**
1. Verificar que los archivos estén en el proyecto:
   - Click derecho en el grupo del proyecto
   - Verificar que los archivos estén listados
2. Verificar que estén en el target:
   - Seleccionar un archivo
   - File Inspector (panel derecho)
   - Verificar que "Target Membership" → VSSHKR esté marcado

### 3. Error de Compilación Swift

**Síntomas:**
```
error: Compilation failed
```

**Solución:**
1. Limpiar build:
   - Product → Clean Build Folder (⇧⌘K)
2. Verificar versión de Swift:
   - Build Settings → Swift Language Version → Swift 5
3. Recompilar:
   - ⌘+B

### 4. Error de Firma (Signing)

**Síntomas:**
```
error: No signing certificate found
```

**Solución:**
1. Seleccionar proyecto → Target VSSHKR
2. Signing & Capabilities
3. Seleccionar tu "Team"
4. Xcode generará el certificado automáticamente

### 5. Error: "Cannot find type 'Connection'"

**Síntomas:**
```
error: Cannot find type 'Connection' in scope
```

**Solución:**
1. Verificar que `Connection.swift` esté en el proyecto
2. Verificar que esté en el target
3. Verificar imports:
   ```swift
   import Foundation
   ```

### 6. Error: Workspace no se abre

**Síntomas:**
```
The workspace cannot be opened because one or more of its projects cannot be opened.
```

**Solución:**
```bash
cd ~/vssh-ios
rm -rf Pods/ Podfile.lock
pod install
open VSSHKR.xcworkspace
```

### 7. Error: "Command PhaseScriptExecution failed"

**Síntomas:**
```
error: Command PhaseScriptExecution failed with a nonzero exit code
```

**Solución:**
1. Limpiar build: ⇧⌘K
2. Eliminar DerivedData:
   ```bash
   rm -rf ~/Library/Developer/Xcode/DerivedData
   ```
3. Recompilar: ⌘+B

### 8. Error: CocoaPods no instalado

**Síntomas:**
```
command not found: pod
```

**Solución:**
```bash
sudo gem install cocoapods
```

Si hay problemas con permisos:
```bash
sudo gem install -n /usr/local/bin cocoapods
```

### 9. Error: Xcode no encontrado

**Síntomas:**
```
xcodebuild: command not found
```

**Solución:**
1. Instalar Xcode desde Mac App Store
2. Abrir Xcode una vez para aceptar licencia
3. Instalar Command Line Tools:
   ```bash
   xcode-select --install
   ```

### 10. Error: Deployment Target muy bajo

**Síntomas:**
```
error: 'async' is only available in iOS 13.0 or newer
```

**Solución:**
1. Seleccionar proyecto → Target VSSHKR
2. General → Deployment Info
3. Cambiar "iOS Deployment Target" a 13.0 o superior

## Verificación Rápida

Ejecuta este script para diagnóstico:
```bash
cd ~/vssh-ios
./verify_setup.sh
```

## Logs Útiles

Para ver logs detallados de compilación:
1. En Xcode: View → Navigators → Show Report Navigator
2. Seleccionar el último build
3. Revisar errores y warnings

## Contacto

Si el problema persiste:
1. Revisa `FINAL_STEPS.md` para pasos detallados
2. Verifica `CHECKLIST.md` para asegurar que todo esté configurado
3. Revisa los logs de compilación en Xcode

