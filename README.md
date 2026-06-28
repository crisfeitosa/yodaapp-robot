# YodaAppRobot

Projeto de testes automatizados para mobile com [Appium](https://appium.io/).

## Visão geral

Este repositório contém a base para automação de testes mobile da aplicação Yodapp. O APK de teste está disponível em `app/yodapp-beta.apk`.

## Pré-requisitos

- Node.js 16+ ou superior
- npm
- Java JDK instalado e configurado
- Android Studio com Android SDK
- Emulador Android ou dispositivo físico conectado
- Appium 2 instalado no projeto (via npm)

## Instalação

1. Instale as dependências do projeto:

   ```bash
   npm install
   ```

2. Inicie o servidor do Appium:

   ```bash
   npx appium
   ```

As versões usadas atualmente estão no `package.json`:

- `appium`: `^2.19.0`
- `appium-uiautomator2-driver`: `^2.45.1`

## Começo rápido

1. Suba o servidor Appium em um terminal:

```bash
npx appium
```

2. Em outro terminal, rode um teste Robot Framework:

```bash
robot -d ./logs tests/home.robot
```

## Execução dos testes

Com o Appium em execução, rode os cenários Robot Framework:

- Tela inicial:

  ```bash
  robot -d ./logs tests/home.robot
  ```

- Clique simples e clique longo:

  ```bash
  robot -d ./logs tests/click.robot
  ```

- Checkbox (techs Appium):

  ```bash
  robot -d ./logs tests/checkbox.robot
  ```

- Suíte completa da pasta `tests/`:

  ```bash
  robot -d ./logs tests/
  ```

Esses comandos geram os artefatos de execução em `logs/`:

- `logs/output.xml`
- `logs/log.html`
- `logs/report.html`

## Appium Inspector

Use esta configuração no Appium Inspector para abrir o APK no emulador Android:

```json
{
  "platformName": "Android",
  "appium:deviceName": "Android Emulator",
  "appium:automationName": "UIAutomator2",
  "appium:app": "<CAMINHO_DO_PROJETO>/app/yodapp-beta.apk",
  "appium:udid": "emulator-5554",
  "appium:autoGrantPermissions": true
}
```

Substitua `<CAMINHO_DO_PROJETO>` pelo caminho onde você clonou o repositório na sua máquina.

## Estrutura

```text
app/
  yodapp-beta.apk
logs/
   log.html
   output.xml
   report.html
tests/
   checkbox.robot
   click.robot
   home.robot
package.json
README.md
```

## Próximos passos

Expandir a suíte atual com novos cenários e centralizar a execução em scripts no `package.json`.

## Observações

O script `npm test` ainda está como placeholder e não executa os testes Robot Framework.

Exemplo de execução por arquivo:

```bash
robot -d ./logs tests/checkbox.robot
```

## Troubleshooting

- `EADDRINUSE: address already in use 0.0.0.0:4723`:
  existe outra instância do Appium rodando. Finalize a instância atual ou suba em outra porta:

  ```bash
  npx appium -p 4725
  ```

- `NotOpenSSLWarning` (urllib3/LibreSSL no macOS):
  é um warning do ambiente Python local. Não necessariamente bloqueia a execução dos testes, mas pode ser eliminado usando Python com OpenSSL 1.1.1+.

- `InvalidSelectorException` com XPath no Android:
  se o seletor for um locator (ex.: `xpath=...`), use `Click Element` em vez de `Click Text`.

  Exemplo:

  ```robot
  Click Element    xpath=//android.widget.CheckBox[contains(@text, "Ruby")]
  ```

- `NoSuchDriverError` / sessão não inicia no Android:
  confirme que o dispositivo está ativo e acessível com `adb devices` e que o `udid` configurado corresponde ao emulador/dispositivo em uso.
