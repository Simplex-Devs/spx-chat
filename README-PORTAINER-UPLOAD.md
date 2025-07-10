# 🚀 Chatwoot Personalizado - Upload no Portainer

## 📦 Pacote Completo para Portainer

Este pacote contém todo o código fonte do Chatwoot personalizado para fazer upload no Portainer.

### 📁 Conteúdo do Pacote

- ✅ **Código fonte completo do Chatwoot**
- ✅ **docker-compose.yml** com configuração personalizada
- ✅ **Dockerfile** para build da imagem customizada
- ✅ **Todos os arquivos de configuração**
- ✅ **Dependências e assets**

### 🎯 Como Usar no Portainer

#### 1. **Upload do Pacote**

1. Acesse o Portainer
2. Vá em **Stacks** → **Add stack**
3. Escolha **Upload** como método
4. Faça upload do arquivo: `chatwoot-completo-portainer-YYYYMMDD-HHMMSS.tar.gz`

#### 2. **Configuração da Stack**

- **Name**: `chatwoot-personalizado`
- **Web editor**: Deixe em branco (será preenchido automaticamente)
- **Variables**: Deixe em branco (variáveis já configuradas no docker-compose.yml)

#### 3. **Build Automático**

O Portainer irá:

- Extrair o código fonte
- Fazer build da imagem `chatwoot-custom:latest`
- Subir todos os serviços configurados

### 🔧 Configurações Incluídas

#### **Imagem Personalizada**

```yaml
image: chatwoot-custom:latest
```

#### **Serviços Configurados**

- **chatwoot_app**: Aplicação principal
- **chatwoot_sidekiq**: Processamento em background
- **chatwoot_redis**: Cache e sessões

#### **Volumes Externos**

- `chatwoot_storage`: Arquivos de conversa
- `chatwoot_public`: Logos e assets
- `chatwoot_mailer`: Templates de email
- `chatwoot_mailers`: Emails personalizados
- `chatwoot_redis`: Dados do Redis

#### **Rede**

- `NetAlternativo`: Rede interna personalizada

### 🌐 Configurações de Domínio

**URL Principal**: `https://chat.colegioalternativo.com.br`

**Configurações SMTP**:

- Host: `mail.colegioalternativo.com.br`
- Porta: `587`
- Email: `chat@colegioalternativo.com.br`

### ⚙️ Configurações do Banco

**PostgreSQL**:

- Host: `pgvector` (externo)
- Database: `chatwoot`
- Usuário: `postgres`

### 🚀 Após o Upload

1. **Aguarde o build** da imagem personalizada
2. **Verifique os logs** de cada serviço
3. **Acesse**: `https://chat.colegioalternativo.com.br`

### 📋 Pré-requisitos

Antes de subir a stack, certifique-se de que:

1. **Volumes existem**:

```bash
docker volume create chatwoot_storage
docker volume create chatwoot_public
docker volume create chatwoot_mailer
docker volume create chatwoot_mailers
docker volume create chatwoot_redis
```

2. **Rede existe**:

```bash
docker network create NetAlternativo
```

3. **PostgreSQL externo** está rodando e acessível

### 🔍 Troubleshooting

#### **Erro de Build**

- Verifique se há espaço suficiente no disco
- Aumente timeout do build se necessário

#### **Erro de Conexão**

- Verifique se os volumes e rede foram criados
- Confirme se o PostgreSQL externo está acessível

#### **Erro de SMTP**

- Verifique as credenciais no docker-compose.yml
- Teste a conectividade com o servidor SMTP

### 📞 Suporte

Para dúvidas ou problemas:

- Verifique os logs dos containers
- Confirme as configurações de rede e volumes
- Teste a conectividade com serviços externos

---

**🎉 Seu Chatwoot personalizado estará rodando no Portainer!**
