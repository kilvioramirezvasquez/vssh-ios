# 🚀 Guía para Subir a GitHub

## 📋 Pasos para Subir el Proyecto

### Opción A: Script Automático (Recomendado)

```bash
cd ~/vssh-ios
./push_to_github.sh
```

El script te guiará paso a paso.

### Opción B: Manual

#### 1. Inicializar Git

```bash
cd ~/vssh-ios
git init
```

#### 2. Configurar Git (si es la primera vez)

```bash
git config user.name "Tu Nombre"
git config user.email "tu@email.com"
```

#### 3. Agregar Archivos

```bash
git add .
```

#### 4. Hacer Commit

```bash
git commit -m "Initial commit - VSSH-KR iOS

- Código Swift completo (8 archivos)
- Documentación completa (21 archivos)
- Scripts de ayuda (4 archivos)
- Configuración CI/CD con GitHub Actions
- Listo para compilar"
```

#### 5. Crear Repositorio en GitHub

1. Ve a https://github.com/new
2. **Nombre del repositorio**: `vssh-ios` (o el que prefieras)
3. **Descripción**: `VSSH-KR iOS Application`
4. **Visibilidad**: Público o Privado (público = CI/CD gratis)
5. ⚠️ **NO marques** "Initialize with README" (ya tenemos archivos)
6. Click en **Create repository**

#### 6. Conectar y Subir

```bash
# Reemplaza TU_USUARIO con tu usuario de GitHub
git remote add origin https://github.com/TU_USUARIO/vssh-ios.git
git branch -M main
git push -u origin main
```

#### 7. Verificar

Ve a tu repositorio en GitHub:
```
https://github.com/TU_USUARIO/vssh-ios
```

## ✅ Verificar que se Subió Correctamente

Deberías ver:
- ✅ Todos los archivos Swift en `VSSHKR/`
- ✅ Todos los archivos `.md` de documentación
- ✅ El archivo `.github/workflows/build-ios.yml`
- ✅ `Podfile`, `Info.plist`, etc.

## 🔄 GitHub Actions se Ejecutará Automáticamente

1. Ve a la pestaña **Actions** en GitHub
2. Verás el workflow "Build iOS" ejecutándose
3. Espera a que termine (puede tomar 5-10 minutos)
4. Descarga los artefactos compilados

## 📝 Notas Importantes

### ⚠️ Primera Compilación

**Problema:** El workflow necesita el proyecto Xcode (`.xcworkspace`), que solo se puede crear en macOS.

**Soluciones:**

1. **Opción 1: Crear proyecto manualmente**
   - Accede a macOS (amigo, servicio en la nube)
   - Sigue `FINAL_STEPS.md` para crear el proyecto
   - Sube el `.xcworkspace` al repositorio
   - Luego el CI/CD funcionará automáticamente

2. **Opción 2: Usar xcodegen en CI**
   - Podemos modificar el workflow para usar xcodegen
   - Genera el proyecto automáticamente
   - Ver sección "Modificar Workflow" abajo

### 🔐 Autenticación

Si GitHub te pide autenticación:

**Opción 1: Personal Access Token**
```bash
# Crear token en: https://github.com/settings/tokens
# Luego usar:
git remote set-url origin https://TOKEN@github.com/USUARIO/vssh-ios.git
```

**Opción 2: SSH**
```bash
# Configurar SSH key en GitHub
# Luego usar:
git remote set-url origin git@github.com:USUARIO/vssh-ios.git
```

## 🔧 Modificar Workflow para xcodegen

Si quieres que el workflow genere el proyecto automáticamente, modifica `.github/workflows/build-ios.yml`:

```yaml
- name: Install xcodegen
  run: |
    brew install xcodegen

- name: Generate Xcode Project
  run: |
    xcodegen generate
    pod install
```

## 📊 Verificar Estado del Workflow

1. Ve a: `https://github.com/TU_USUARIO/vssh-ios/actions`
2. Click en el último workflow
3. Ver logs en tiempo real
4. Descargar artefactos al finalizar

## 🆘 Solución de Problemas

### Error: "Repository not found"
- Verifica que el repositorio existe en GitHub
- Verifica que tienes permisos
- Verifica la URL del remote

### Error: "Authentication failed"
- Configura Personal Access Token o SSH key
- Ver sección "Autenticación" arriba

### Error: "Workflow failed"
- Revisa los logs en Actions
- Probablemente falta el proyecto Xcode
- Ver sección "Primera Compilación" arriba

## 📚 Archivos Relacionados

- `push_to_github.sh` - Script automático
- `REMOTE_COMPILE.md` - Compilación remota
- `COMPILE_OPTIONS.md` - Opciones de compilación
- `.github/workflows/build-ios.yml` - Workflow de CI/CD

## ✅ Checklist

- [ ] Git inicializado
- [ ] Archivos agregados (`git add .`)
- [ ] Commit realizado
- [ ] Repositorio creado en GitHub
- [ ] Remote configurado
- [ ] Código subido (`git push`)
- [ ] Workflow ejecutándose en Actions
- [ ] Artefactos descargados

---

**¡Listo!** Una vez subido, el CI/CD compilará automáticamente en cada push.

