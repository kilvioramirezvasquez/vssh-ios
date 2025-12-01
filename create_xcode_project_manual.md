# Crear Proyecto Xcode Manualmente

## Pasos Detallados

### 1. Abrir Xcode
```bash
open -a Xcode
```

### 2. Crear Nuevo Proyecto
1. **File → New → Project** (o ⌘+Shift+N)
2. Seleccionar **iOS** en la barra lateral
3. Seleccionar **App** en la lista de plantillas
4. Click en **Next**

### 3. Configurar Proyecto
- **Product Name**: `VSSHKR`
- **Team**: Seleccionar tu equipo (o "None" si no tienes cuenta)
- **Organization Identifier**: `com.venafi`
- **Bundle Identifier**: Se generará automáticamente como `com.venafi.VSSHKR`
- **Interface**: **SwiftUI** ⚠️ IMPORTANTE
- **Language**: **Swift**
- **Storage**: None (o Core Data si prefieres)
- **Include Tests**: Opcional

### 4. Guardar Ubicación
- **Location**: `~/vssh-ios/`
- ✅ **Create Git repository**: Desmarcar (opcional)
- Click en **Create**

### 5. Copiar Archivos Swift

En Xcode, haz clic derecho en el grupo `VSSHKR` y selecciona **Add Files to "VSSHKR"**:

1. Navegar a `~/vssh-ios/VSSHKR/`
2. Seleccionar TODOS los archivos Swift:
   - `App/VSSHKRApp.swift`
   - `Models/Connection.swift`
   - `Views/MainView.swift`
   - `Views/TerminalView.swift`
   - `Views/ConnectionEditView.swift`
   - `Services/SSHService.swift`
   - `Services/ConnectionStorage.swift`
   - `Utils/AnsiFilter.swift`
3. ✅ **Copy items if needed**
4. ✅ **Create groups** (no folder references)
5. ✅ **Add to targets: VSSHKR**
6. Click **Add**

### 6. Reemplazar VSSHKRApp.swift

El archivo `VSSHKRApp.swift` que creó Xcode debe ser reemplazado por el nuestro.

1. Eliminar el `VSSHKRApp.swift` que creó Xcode
2. Asegurarse de que nuestro `VSSHKRApp.swift` esté en el proyecto

### 7. Configurar Info.plist

1. Seleccionar el proyecto en el navegador (arriba a la izquierda)
2. Seleccionar el target **VSSHKR**
3. Ir a la pestaña **Info**
4. Copiar configuración de `Info.plist` si es necesario

O simplemente reemplazar el contenido del `Info.plist` del proyecto con el de `~/vssh-ios/Info.plist`

### 8. Instalar Dependencias

```bash
cd ~/vssh-ios
pod install
```

### 9. Abrir Workspace

**IMPORTANTE**: Siempre abre el `.xcworkspace`, NO el `.xcodeproj`

```bash
open VSSHKR.xcworkspace
```

O desde Xcode: **File → Open** y seleccionar `VSSHKR.xcworkspace`

### 10. Configurar Bundle Identifier

1. En Xcode, seleccionar el proyecto
2. Seleccionar target **VSSHKR**
3. Ir a **Signing & Capabilities**
4. Cambiar **Bundle Identifier** a: `com.venafi.vsshkr`

### 11. Compilar

- **⌘+B**: Compilar
- **⌘+R**: Ejecutar en simulador/dispositivo

## Verificación

Después de compilar, verifica que:
- ✅ No hay errores de compilación
- ✅ Todos los archivos Swift están en el proyecto
- ✅ NMSSH está disponible (import NMSSH funciona)
- ✅ El proyecto se ejecuta en el simulador

## Solución de Problemas

### Error: "No such module 'NMSSH'"
```bash
cd ~/vssh-ios
pod install
# Cerrar Xcode completamente
# Reabrir VSSHKR.xcworkspace (NO .xcodeproj)
```

### Error: Archivos no encontrados
- Verifica que todos los archivos estén agregados al target
- En el File Inspector (derecha), verifica que el target esté marcado

### Error de compilación Swift
- Verifica que la versión de Swift sea 5.0+
- Product → Clean Build Folder (⇧⌘K)
- Recompilar (⌘+B)

