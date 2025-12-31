#!/usr/bin/env bash

# 🎉 RAPIDITO REDESIGN - QUICK START SCRIPT
# Este script configura y ejecuta el proyecto rápidamente

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🎉 RAPIDITO REDESIGN V2.0.0 - QUICK START 🎉             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check Flutter
echo -e "${BLUE}📋 Verificando requisitos...${NC}"
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter no encontrado. Por favor instala Flutter primero."
    exit 1
fi
echo -e "${GREEN}✅ Flutter encontrado${NC}"

# Step 1: Clean
echo ""
echo -e "${BLUE}🧹 Limpiando proyecto...${NC}"
flutter clean
echo -e "${GREEN}✅ Proyecto limpio${NC}"

# Step 2: Get dependencies
echo ""
echo -e "${BLUE}📦 Obteniendo dependencias...${NC}"
flutter pub get
echo -e "${GREEN}✅ Dependencias obtenidas${NC}"

# Step 3: Upgrade (optional)
echo ""
read -p "¿Deseas actualizar dependencias? (s/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${BLUE}🔄 Actualizando dependencias...${NC}"
    flutter pub upgrade
    echo -e "${GREEN}✅ Dependencias actualizadas${NC}"
fi

# Step 4: Analyze
echo ""
echo -e "${BLUE}🔍 Analizando código...${NC}"
flutter analyze
echo -e "${GREEN}✅ Análisis completado${NC}"

# Step 5: Show devices
echo ""
echo -e "${BLUE}📱 Dispositivos disponibles:${NC}"
flutter devices

# Step 6: Run
echo ""
read -p "¿Deseas ejecutar la app ahora? (s/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    echo -e "${BLUE}🚀 Ejecutando app...${NC}"
    flutter run
fi

echo ""
echo -e "${GREEN}═════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}🎉 ¡Setup completado! 🎉${NC}"
echo ""
echo -e "${YELLOW}Próximos pasos:${NC}"
echo "1. Leer QUICK_START.md para ejemplos de código"
echo "2. Ver premium_components_examples.dart para ejemplos visuales"
echo "3. Revisar REDESIGN_DOCUMENTATION.md para documentación completa"
echo "4. Consultar HOW_TO_TEST.md para testing"
echo ""
echo -e "${BLUE}Documentación:${NC}"
echo "  📖 INDEX.md - Navegación completa"
echo "  📖 QUICK_START.md - Guía rápida"
echo "  📖 REDESIGN_DOCUMENTATION.md - Documentación técnica"
echo "  📖 HOW_TO_TEST.md - Guía de testing"
echo "  📖 DEPLOYMENT_CHECKLIST.md - Pre-deployment"
echo ""
echo -e "${GREEN}═════════════════════════════════════════════════════════${NC}"
