#!/bin/bash

# Script para preparar o pacote final do Chatwoot para Portainer
echo "🚀 Preparando pacote final do Chatwoot para Portainer..."

# Nome do arquivo com timestamp
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
PACKAGE_NAME="chatwoot-completo-portainer-${TIMESTAMP}"

# Criar diretório temporário
TEMP_DIR="/tmp/${PACKAGE_NAME}"
mkdir -p "$TEMP_DIR"

echo "📁 Copiando arquivos essenciais..."

# Copiar arquivos essenciais do Chatwoot
cp -r docker/ "$TEMP_DIR/"
cp -r config/ "$TEMP_DIR/"
cp -r app/ "$TEMP_DIR/"
cp -r lib/ "$TEMP_DIR/"
cp -r bin/ "$TEMP_DIR/"
cp -r db/ "$TEMP_DIR/"
cp -r spec/ "$TEMP_DIR/"
cp -r vendor/ "$TEMP_DIR/"
cp -r theme/ "$TEMP_DIR/"
cp -r public/ "$TEMP_DIR/"
cp -r storage/ "$TEMP_DIR/"
cp -r tmp/ "$TEMP_DIR/"
cp -r log/ "$TEMP_DIR/"

# Copiar arquivos de configuração
cp docker-compose.yml "$TEMP_DIR/"
cp Dockerfile "$TEMP_DIR/"
cp Gemfile "$TEMP_DIR/"
cp Gemfile.lock "$TEMP_DIR/"
cp package.json "$TEMP_DIR/"
cp pnpm-lock.yaml "$TEMP_DIR/"
cp vite.config.ts "$TEMP_DIR/"
cp tailwind.config.js "$TEMP_DIR/"
cp postcss.config.js "$TEMP_DIR/"
cp .ruby-version "$TEMP_DIR/"
cp .nvmrc "$TEMP_DIR/"
cp .dockerignore "$TEMP_DIR/"
cp .gitignore "$TEMP_DIR/"
cp config.ru "$TEMP_DIR/"
cp Rakefile "$TEMP_DIR/"
cp Makefile "$TEMP_DIR/"
cp Procfile "$TEMP_DIR/"
cp Procfile.dev "$TEMP_DIR/"
cp Procfile.test "$TEMP_DIR/"

# Copiar arquivos de configuração adicionais
cp .rubocop.yml "$TEMP_DIR/"
cp .eslintrc.js "$TEMP_DIR/"
cp .prettierrc "$TEMP_DIR/"
cp .rspec "$TEMP_DIR/"
cp .browserslistrc "$TEMP_DIR/"
cp .bundler-audit.yml "$TEMP_DIR/"
cp .codeclimate.yml "$TEMP_DIR/"
cp .editorconfig "$TEMP_DIR/"
cp .scss-lint.yml "$TEMP_DIR/"
cp .slugignore "$TEMP_DIR/"
cp .all-contributorsrc "$TEMP_DIR/"
cp semantic.yml "$TEMP_DIR/"
cp crowdin.yml "$TEMP_DIR/"
cp app.json "$TEMP_DIR/"
cp Capfile "$TEMP_DIR/"

# Copiar arquivos de documentação
cp README.md "$TEMP_DIR/"
cp LICENSE "$TEMP_DIR/"
cp SECURITY.md "$TEMP_DIR/"
cp CODE_OF_CONDUCT.md "$TEMP_DIR/"
cp CONTRIBUTING.md "$TEMP_DIR/"
cp VERSION_CW "$TEMP_DIR/"
cp VERSION_CWCTL "$TEMP_DIR/"
cp AGENTS.md "$TEMP_DIR/"
cp CLAUDE.md "$TEMP_DIR/"

# Copiar arquivos de configuração de build
cp vitest.setup.js "$TEMP_DIR/"
cp workbox-config.js "$TEMP_DIR/"
cp histoire.config.ts "$TEMP_DIR/"

# Copiar README específico do Portainer
cp README-PORTAINER-UPLOAD.md "$TEMP_DIR/"

echo "📦 Criando arquivo compactado..."

# Criar arquivo tar.gz
cd /tmp
tar -czf "${PACKAGE_NAME}.tar.gz" "$PACKAGE_NAME"

# Mover para o diretório atual
mv "${PACKAGE_NAME}.tar.gz" "/home/chatwoot/chatwoot/"

# Limpar diretório temporário
rm -rf "$TEMP_DIR"

echo "✅ Pacote criado com sucesso!"
echo "📁 Arquivo: ${PACKAGE_NAME}.tar.gz"
echo "📏 Tamanho: $(du -h "${PACKAGE_NAME}.tar.gz" | cut -f1)"
echo ""
echo "🚀 Pronto para upload no Portainer!"
echo "📖 Instruções: README-PORTAINER-UPLOAD.md" 