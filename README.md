# YodaAppRobot

Projeto de automação de testes mobile com Robot Framework + Appium para o app Yodapp.

## Visão geral

Este repositório contém cenários de testes mobile Android. O APK utilizado nos testes está em `app/yodapp-beta.apk`.

## Pré-requisitos

- Node.js 16+
- npm
- Python 3.9+
- Robot Framework instalado no ambiente Python
- Java JDK instalado e configurado
- Android Studio com Android SDK
- Emulador Android ou dispositivo físico conectado

## Instalação

1. Instale as dependências Node (Appium e driver Android):

```bash
npm install
```

2. Instale o Robot Framework no Python ativo (se ainda não estiver instalado):

```bash
pip install robotframework robotframework-appiumlibrary
```

## Começo rápido

1. Inicie o Appium em um terminal:

```bash
npx appium
```

2. Execute um cenário em outro terminal:

```bash
robot -d ./logs tests/home.robot
```

## Checklist antes de rodar

- Emulador/dispositivo Android ativo
- `adb devices` listando ao menos 1 device como `device`
- Servidor Appium em execução
- APK disponível em `app/yodapp-beta.apk`

## Execução dos testes

Com o Appium em execução, use:

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

- Suíte completa:

```bash
robot -d ./logs tests/
```

- Executar apenas testes com tag `long`:

```bash
robot -d ./logs -i long tests/
```

Relatórios gerados em `logs/`:

- `logs/output.xml`
- `logs/log.html`
- `logs/report.html`

Dica: para manter histórico de execuções, use uma pasta por rodada, por exemplo `-d ./logs/run-01`.

## Versões atuais

Dependências definidas no projeto:

- `appium`: `^2.19.0`
- `appium-uiautomator2-driver`: `^2.45.1`

## Appium Inspector

Configuração de capabilities para abrir o app no Android:

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

Substitua `<CAMINHO_DO_PROJETO>` pelo caminho local do repositório.

## Estrutura do projeto

```text
app/
  yodapp-beta.apk
logs/
  log.html
  output.xml
  report.html
resources/
  base.resource
tests/
  checkbox.robot
  click.robot
  home.robot
package.json
README.md
```

## Observações

- O script `npm test` ainda é placeholder e não executa os testes Robot Framework.
- Sempre mantenha um emulador/dispositivo ativo antes de iniciar a suíte.

## Troubleshooting

- `EADDRINUSE: address already in use 0.0.0.0:4723`
  Já existe uma instância do Appium usando a porta 4723. Inicie em outra porta:

```bash
npx appium -p 4725
```

- `InvalidSelectorException` com XPath no Android
  Se o valor informado for locator (`xpath=...`), use `Click Element` em vez de `Click Text`.

```robot
Click Element    xpath=//android.widget.CheckBox[contains(@text, "Ruby")]
```

- `NoSuchDriverError` / sessão não inicia no Android
  Verifique se o dispositivo está disponível em:

```bash
adb devices
```

E confirme se o `udid` corresponde ao emulador/dispositivo em uso.

- `NotOpenSSLWarning` (urllib3/LibreSSL no macOS)
  É um warning do ambiente Python local. Em geral não bloqueia os testes, mas pode ser removido usando Python com OpenSSL 1.1.1+.
