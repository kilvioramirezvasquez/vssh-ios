# 🔧 Solución al Error 403

## ⚠️ Problema

```
remote: Permission to kilvioramirezvasquez/vssh-ios.git denied
fatal: The requested URL returned error: 403
```

## ✅ Solución: Crear Nuevo Token con Permisos Correctos

El token actual puede no tener los permisos necesarios. Sigue estos pasos:

### Paso 1: Crear Nuevo Token

1. Ve a: **https://github.com/settings/tokens**
2. Click en **"Generate new token (classic)"**
3. **Note**: `vssh-ios-push` (o cualquier nombre)
4. **Expiration**: Elige una fecha (90 días, 1 año, etc.)
5. **Select scopes**: 
   - ✅ Expande **"repo"**
   - ✅ Marca **TODOS** los sub-permisos:
     - ✅ `repo:status`
     - ✅ `repo_deployment`
     - ✅ `public_repo`
     - ✅ `repo:invite`
     - ✅ `security_events`
     - ✅ `workflow` (para GitHub Actions)
6. Scroll hacia abajo y click **"Generate token"**
7. **⚠️ IMPORTANTE**: Copia el token inmediatamente (solo se muestra una vez)

### Paso 2: Usar el Nuevo Token

```bash
cd ~/vssh-ios
git push -u origin main
```

Cuando te pida:
- **Username**: `kilvioramirezvasquez`
- **Password**: Pega el **NUEVO token** completo

### Paso 3: Verificar

1. Ve a: https://github.com/kilvioramirezvasquez/vssh-ios
2. Deberías ver todos los archivos
3. Ve a la pestaña **Actions**
4. El workflow se ejecutará automáticamente

## 🔍 Verificar Permisos del Token Actual

Si quieres verificar el token actual:

1. Ve a: https://github.com/settings/tokens
2. Busca el token que creaste
3. Verifica que tenga **todos** los permisos de `repo` marcados
4. Si no los tiene, crea uno nuevo

## 🔄 Alternativa: Usar SSH

Si prefieres evitar tokens:

1. Configura SSH key en GitHub
2. Cambia el remote:
   ```bash
   git remote set-url origin git@github.com:kilvioramirezvasquez/vssh-ios.git
   git push -u origin main
   ```

## 📝 Nota Importante

El error 403 generalmente significa que:
- El token no tiene permisos de `repo`
- El token está expirado
- El token fue revocado

**Solución más rápida**: Crear un nuevo token con todos los permisos de `repo` marcados.

---

**Crea un nuevo token con permisos completos de 'repo' y vuelve a intentar el push.**

