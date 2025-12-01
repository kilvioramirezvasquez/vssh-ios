# Plantilla de Configuración para Proyecto Xcode

Cuando crees el proyecto en Xcode, usa estas configuraciones:

## Configuración del Proyecto

### General Tab
- **Display Name**: VSSH-KR
- **Bundle Identifier**: `com.venafi.vsshkr`
- **Version**: 1.0
- **Build**: 1
- **Deployment Target**: iOS 13.0
- **Devices**: iPhone, iPad
- **Interface**: SwiftUI
- **Language**: Swift
- **Storage**: None

### Signing & Capabilities
- **Automatically manage signing**: ✅ (marcado)
- **Team**: Seleccionar tu equipo de desarrollador
- **Bundle Identifier**: `com.venafi.vsshkr`

### Build Settings
- **Swift Language Version**: Swift 5
- **iOS Deployment Target**: 13.0
- **Product Bundle Identifier**: `com.venafi.vsshkr`

## Estructura de Grupos en Xcode

Después de agregar los archivos, organiza así:

```
VSSHKR (proyecto)
├── App
│   └── VSSHKRApp.swift
├── Models
│   └── Connection.swift
├── Views
│   ├── MainView.swift
│   ├── TerminalView.swift
│   └── ConnectionEditView.swift
├── Services
│   ├── SSHService.swift
│   └── ConnectionStorage.swift
└── Utils
    └── AnsiFilter.swift
```

## Configuración de Info.plist

Reemplaza el contenido del Info.plist del proyecto con:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDisplayName</key>
	<string>VSSH-KR</string>
	<key>CFBundleIdentifier</key>
	<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
	<key>CFBundleName</key>
	<string>$(PRODUCT_NAME)</string>
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleVersion</key>
	<string>1</string>
	<key>LSRequiresIPhoneOS</key>
	<true/>
	<key>UIApplicationSceneManifest</key>
	<dict>
		<key>UIApplicationSupportsMultipleScenes</key>
		<true/>
	</dict>
	<key>UISupportedInterfaceOrientations</key>
	<array>
		<string>UIInterfaceOrientationPortrait</string>
		<string>UIInterfaceOrientationLandscapeLeft</string>
		<string>UIInterfaceOrientationLandscapeRight</string>
	</array>
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSAllowsArbitraryLoads</key>
		<true/>
	</dict>
</dict>
</plist>
```

## Verificación Post-Configuración

Después de configurar, verifica:

1. ✅ Todos los archivos Swift están en el proyecto
2. ✅ Todos los archivos están en el target "VSSHKR"
3. ✅ Bundle Identifier es `com.venafi.vsshkr`
4. ✅ Deployment Target es iOS 13.0
5. ✅ Swift Version es 5.0
6. ✅ Podfile está en la raíz del proyecto
7. ✅ Ejecutaste `pod install`
8. ✅ Abriste `.xcworkspace` (no `.xcodeproj`)

