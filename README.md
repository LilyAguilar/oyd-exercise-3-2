# Exercise 3.2 — Lambda Currency Converter

## Resumen del Ejercicio
Este ejercicio consistió en el desarrollo de un módulo de Terraform reutilizable para aprovisionar una función AWS Lambda integrada con una API Gateway de tipo HTTP. La función actúa como un convertidor de moneda sencillo, ofreciendo endpoints para consultar tasas de cambio (`GET /rates`) y realizar conversiones (`POST /convert`). El proyecto también incluye un pipeline de Integración Continua (CI) en GitHub Actions que automatiza la construcción del artefacto `.zip`, valida la configuración de Terraform y genera planes de ejecución detallados en los Pull Requests.

## Evidence

### Function Metadata
[function.txt](infra/evidence/function.txt)

```json
{
    "FunctionArn": "arn:aws:lambda:us-east-1:237024525365:function:currency-converter",
    "State": "Active",
    "Arch": [
        "arm64"
    ]
}
```

### API Testing
>```INVOKE_URL=$(cd infra ; terraform output -raw invoke_url)```

```powershell
StatusCode        : 200
StatusDescription : OK
Content           : {"rates":{"USD":1,"EUR":0.92,"GBP":0.79,"JPY":149.5,"GTQ":7.78}}
RawContent        : HTTP/1.1 200 OK
                    Connection: keep-alive
                    Apigw-Requestid: dLVzUi8SIAMEbZw=
                    Content-Length: 64
                    Content-Type: application/json
                    Date: Mon, 11 May 2026 01:52:59 GMT

                    {"rates":{"USD":1,"EUR":0.92,"GBP...
Forms             : {}
Headers           : {[Connection, keep-alive], [Apigw-Requestid, dLVzUi8SIAMEbZw=], [Content-Length, 64], [Content-Type, application/json]...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : mshtml.HTMLDocumentClass
RawContentLength  : 64

```

>```curl -X POST ${INVOKE_URL}/convert -H 'Content-Type: application/json' -d '{"from":"USD","to":"GTQ","amount":100}'```

```powershell
StatusCode        : 200
StatusDescription : OK
Content           : {"from":"USD","to":"GTQ","amount":100,"result":778}
RawContent        : HTTP/1.1 200 OK
                    Connection: keep-alive
                    Apigw-Requestid: dLXF2hbTIAMEVPw=
                    Content-Length: 51
                    Content-Type: application/json
                    Date: Mon, 11 May 2026 02:01:47 GMT

                    {"from":"USD","to":"GTQ","amount"...
Forms             : {}
Headers           : {[Connection, keep-alive], [Apigw-Requestid, dLXF2hbTIAMEVPw=], [Content-Length, 51], [Content-Type, application/json]...}
Images            : {}
InputFields       : {}
Links             : {}
ParsedHtml        : mshtml.HTMLDocumentClass
RawContentLength  : 51

```
