# Evolution Mapper

Sistema multiplataforma para planejamento e criação de missões automáticas de levantamento/fotogrametria para drones DJI e Litchi!

<div>
<img src="https://raw.githubusercontent.com/Xcellentshop/evolution-mapper/refs/heads/main/primeira%20tela.png" height="300px" />
<img src="https://github.com/user-attachments/assets/7ba5ac8f-bac7-4c4c-9671-a2c3f7f0207d" height="300px" />
<img src="https://github.com/user-attachments/assets/f94518bd-5776-42d5-9dc5-267a274b919b" height="250px" />
</div>

## Funcionalidades

- **Multiplataforma**: Funciona no Windows, Linux, MacOS, Android e Web.
- **Fácil de usar**: Planeje missões com poucos cliques.
- **Personalizável**: Ajuste todos os parâmetros da missão conforme sua necessidade.
- **Compatível com DJI Fly**: Para drones DJI que suportam Waypoints.
- **Compatível com Litchi**: Exporte missões para Litchi para drones DJI que não suportam Waypoints nativamente.

## Aeronaves Suportadas

- **DJI Fly**: DJI Mini 4 Pro, DJI Air 3, DJI Mavic 3, Mavic 3 Cine, Mavic 3 Classic
- **Litchi**: Mini 2, Mini SE (NÃO Mini 4K), Air 2S, Mavic Mini 1, Mavic Air 2, Mavic 2 Zoom/Pro, Mavic Air 1, Mavic Pro 1, Phantom 4 (Standard/Advanced/Pro/ProV2), Phantom 3 (Standard/4K/Advanced/Professional), Inspire 1 (X3/Z3/Pro/RAW), Inspire 2 e Spark
- **Litchi Pilot Beta**: Mini 3, Mini 3 Pro, Mavic 3E, Mavic 3T

**ATENÇÃO sobre Litchi Pilot**: O funcionamento com Evolution Mapper não foi totalmente testado, então use com cautela.

## Instalação

1. Baixe a última versão na página de [Releases](https://github.com/Xcellentshop/evolution-mapper/releases/latest).
2. Extraia o arquivo e execute o programa. No Linux, rode `evolution-mapper` pelo terminal.
3. No Windows, se aparecer aviso do Windows Defender, clique em "Mais informações" e depois em "Executar assim mesmo".

## Como usar

1. Encontre a área desejada no mapa.
2. Clique no mapa para adicionar pontos da missão.
3. Defina os parâmetros da aeronave conforme sua necessidade.
4. Selecione a câmera nos presets ou crie uma personalizada.
5. Na aba Info, veja informações gerais da missão.
6. Na aba Exportar, clique para exportar a missão para arquivo.
7. Carregue a missão no seu drone e inicie o voo (instruções detalhadas no menu de ajuda do sistema).

_Nota: Não modifique ou salve a missão dentro do DJI Fly, pois ele não suporta curvas retas e pode corromper a missão._

## Contribuição

Contribuições são muito bem-vindas! Para ideias, sugestões ou problemas, abra uma issue ou pull request.

## Compilando a partir do código-fonte

**Requisitos:**
- Dart SDK
- Flutter SDK

1. Clone o repositório:
   ```sh
   git clone https://github.com/Xcellentshop/evolution-mapper.git
   cd evolution-mapper
   ```
2. Instale as dependências:
   ```sh
   flutter pub get
   ```
3. Rode o sistema:
   ```sh
   flutter run -d chrome # para web
   flutter run -d windows # para Windows
   flutter run -d linux   # para Linux
   ```
4. Para build de produção (web):
   ```sh
   flutter build web
   ```
   Os arquivos estarão em `build/web/`.

- Recomenda-se o uso do VSCode com a extensão Flutter para desenvolvimento (Hot-Reload, debug, etc).

## Observações
- Não envie as pastas `build/`, `.dart_tool/` e arquivos temporários para o repositório.
- O sistema está pronto para internacionalização e já possui tradução para português brasileiro.
- Para dúvidas ou sugestões, abra uma issue no [GitHub](https://github.com/Xcellentshop/evolution-mapper).
