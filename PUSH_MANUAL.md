# 🔧 Push Manual - Solución al Error 403

## ⚠️ Problema

El token parece no tener los permisos correctos o hay un problema de autenticación.

## ✅ Solución: Push Manual

Ejecuta este comando y cuando te pida las credenciales, ingrésalas manualmente:

```bash
cd ~/vssh-ios
git push -u origin main
```

Cuando te pida:
- **Username**: `kilvioramirezvasquez`
- **Password**: Pega tu token completo (el token que creaste en GitHub)

## 🔍 Verificar Permisos del Token

1. Ve a: https://github.com/settings/tokens
2. Busca el token que creaste
3. Verifica que tenga estos permisos marcados:
   - ✅ **repo** (todos los permisos de repo)
   - ✅ **workflow** (para GitHub Actions)

Si no tiene estos permisos:
1. Elimina el token actual
2. Crea uno nuevo con todos los permisos de `repo`
3. Usa el nuevo token

## 🔄 Alternativa: Usar SSH

Si prefieres usar SSH en lugar de HTTPS:

1. Configura una SSH key en GitHub
2. Cambia el remote:
   ```bash
   git remote set-url origin git@github.com:kilvioramirezvasquez/vssh-ios.git
   git push -u origin main
   ```

## 📝 Comando Completo

```bash
cd ~/vssh-ios
git push -u origin main
```

Ingresa las credenciales cuando te las pida.

---

**Intenta hacer el push manualmente ingresando las credenciales cuando te las pida.**

