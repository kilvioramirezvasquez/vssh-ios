# ⚡ Subir a GitHub - Guía Rápida

## 🚀 Método Rápido (Script)

```bash
cd ~/vssh-ios
./push_to_github.sh
```

## 📝 Método Manual (3 comandos)

```bash
cd ~/vssh-ios
git init
git add .
git commit -m "Initial commit - VSSH-KR iOS"
```

Luego:
1. Crea repositorio en: https://github.com/new
2. **NO** marques "Initialize with README"
3. Ejecuta:

```bash
git remote add origin https://github.com/TU_USUARIO/vssh-ios.git
git branch -M main
git push -u origin main
```

## ✅ Verificar

1. Ve a tu repositorio en GitHub
2. Ve a la pestaña **Actions**
3. El workflow se ejecutará automáticamente

## 📚 Documentación Completa

Ver `GITHUB_SETUP.md` para guía detallada.

