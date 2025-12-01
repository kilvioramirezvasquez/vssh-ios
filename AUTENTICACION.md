# 🔐 Autenticación con GitHub

## ⚠️ Problema

Git necesita autenticarte para subir el código.

## ✅ Solución: Personal Access Token

### Paso 1: Crear Token

1. Ve a: **https://github.com/settings/tokens**
2. Click en **"Generate new token (classic)"**
3. **Note**: `vssh-ios` (o cualquier nombre)
4. **Expiration**: Elige una fecha (90 días, 1 año, etc.)
5. **Select scopes**: Marca **`repo`** (todos los permisos de repo)
6. Click en **"Generate token"** al final
7. **⚠️ IMPORTANTE**: Copia el token inmediatamente (solo se muestra una vez)
   - Se verá algo como: `ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`

### Paso 2: Usar el Token

Cuando ejecutes `git push`, te pedirá:
- **Username**: `kilvioramirezvasquez` (tu usuario de GitHub)
- **Password**: Pega el **TOKEN** (no tu contraseña de GitHub)

### Paso 3: Ejecutar Push

```bash
cd ~/vssh-ios
git push -u origin main
```

Cuando pida:
- Username: `kilvioramirezvasquez`
- Password: `ghp_xxxxxxxxxxxx` (el token que copiaste)

## 🔄 Alternativa: Guardar Credenciales

Si quieres que Git recuerde tus credenciales:

```bash
git config --global credential.helper store
```

Luego cuando hagas push, Git guardará el token.

## 📝 Comandos Completos

```bash
cd ~/vssh-ios

# 1. Crear token en GitHub (hazlo manualmente en el navegador)
# https://github.com/settings/tokens

# 2. Hacer push (te pedirá username y token)
git push -u origin main

# Username: kilvioramirezvasquez
# Password: [pega el token aquí]
```

## ✅ Después del Push

1. Ve a tu repositorio: https://github.com/kilvioramirezvasquez/vssh-ios
2. Deberías ver todos los archivos
3. Ve a la pestaña **Actions**
4. El workflow "Build iOS" se ejecutará automáticamente

---

**¡Crea el token y ejecuta `git push -u origin main`!** 🚀

