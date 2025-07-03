// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'DJI Mapper';

  @override
  String get theme => 'Tema';

  @override
  String get github => 'GitHub';

  @override
  String get helpLoadingMission => 'Ajuda para carregar missão';

  @override
  String get dji => 'DJI';

  @override
  String get litchi => 'Litchi';

  @override
  String get updateAvailable => 'Atualização disponível';

  @override
  String get later => 'Depois';

  @override
  String get ignoreThisVersion => 'Ignorar esta versão';

  @override
  String get download => 'Baixar';

  @override
  String get searchLocation => 'Buscar localização';

  @override
  String get info => 'Informações';

  @override
  String get aircraft => 'Aeronave';

  @override
  String get camera => 'Câmera';

  @override
  String get file => 'Arquivo';

  @override
  String get createPhotoPoints => 'Criar Pontos de Foto';

  @override
  String get showPhotoPoints => 'Mostrar Pontos de Foto';

  @override
  String get showWaypoints => 'Mostrar Pontos de Passagem';

  @override
  String get fillGrid => 'Preencher Grade';

  @override
  String numberOfPhotos(int count) {
    return 'Número de fotos: $count';
  }

  @override
  String numberOfWaypoints(int count) {
    return 'Número de pontos de passagem: $count';
  }

  @override
  String flightDistance(int distance) {
    return 'Distância de voo: $distance m';
  }

  @override
  String area(int area) {
    return 'Área: $area m²';
  }

  @override
  String estimatedFlightTime(int time) {
    return 'Tempo de voo estimado: $time minutos';
  }

  @override
  String recommendedShutterSpeed(String speed) {
    return 'Velocidade do obturador recomendada: $speed ou mais rápida';
  }

  @override
  String get altitude => 'Altitude (m)';

  @override
  String get speed => 'Velocidade (m/s)';

  @override
  String get overlap => 'Sobreposição (%)';

  @override
  String get sidelap => 'Sobreposição Lateral (%)';

  @override
  String get rotation => 'Rotação (°)';

  @override
  String get cameraAngle => 'Ângulo da câmera (graus)';

  @override
  String get delayAtWaypoint => 'Atraso no Ponto de Passagem (seg)';

  @override
  String get onFinished => 'Ao Finalizar:';

  @override
  String get hover => 'Pairar';

  @override
  String get rth => 'RTH';

  @override
  String get land => 'Pousar';

  @override
  String get goToFirstWaypoint => 'Ir para primeiro ponto de passagem';

  @override
  String get onRcLost => 'Ao Perder RC:';

  @override
  String get cameraPreset => 'Preset da Câmera:';

  @override
  String get presetTitle => 'Título do Preset';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Salvar';

  @override
  String get add => 'Adicionar';

  @override
  String get delete => 'Excluir';

  @override
  String get sensorWidth => 'Largura do Sensor (mm)';

  @override
  String get sensorHeight => 'Altura do Sensor (mm)';

  @override
  String get focalLength => 'Distância Focal (mm)';

  @override
  String get imageWidth => 'Largura da Imagem (px)';

  @override
  String get imageHeight => 'Altura da Imagem (px)';

  @override
  String get saveAsDjiFlyWaypointMission =>
      'Salvar como Missão de Pontos de Passagem DJI Fly';

  @override
  String get saveAsLitchiMission => 'Salvar como Missão Litchi';

  @override
  String get importExportMappingArea => 'Importar/Exportar Área de Mapeamento';

  @override
  String get importFromKml => 'Importar do KML';

  @override
  String get exportToKml => 'Exportar para KML';

  @override
  String get selectPolygon => 'Selecionar Polígono';

  @override
  String get load => 'Carregar';

  @override
  String get missionExportCancelled => 'Exportação da missão cancelada';

  @override
  String get missionExportedSuccessfully => 'Missão exportada com sucesso';

  @override
  String get areaImportedSuccessfully => 'Área importada com sucesso';

  @override
  String get areaExportCancelled => 'Exportação da área cancelada';

  @override
  String get areaExportedSuccessfully => 'Área exportada com sucesso';

  @override
  String get noWaypointsToExport =>
      'Nenhum ponto de passagem para exportar. Adicione pontos de passagem primeiro';

  @override
  String get noFileSelected =>
      'Nenhum arquivo selecionado. Importação cancelada';

  @override
  String get noPolygonsFound =>
      'Nenhum polígono encontrado no KML. Importação cancelada';

  @override
  String get loadMissionIntoDjiFly => 'Carregar missão no DJI Fly';

  @override
  String get loadMissionIntoLitchi => 'Carregar missão no Litchi';

  @override
  String get step1 => 'Passo 1';

  @override
  String get step2 => 'Passo 2';

  @override
  String get step3 => 'Passo 3';

  @override
  String get step4 => 'Passo 4';

  @override
  String get done => 'Concluído';

  @override
  String get doNotShowThisAgain => 'Não mostrar novamente';

  @override
  String get exportYourSurveyMission => 'Exportar sua Missão de Levantamento';

  @override
  String get importExportMappingAreaTitle =>
      'Importar/Exportar Área de Mapeamento';

  @override
  String get openDjiFly => 'Abrir DJI Fly';

  @override
  String get quitDjiFly => 'Sair do DJI Fly';

  @override
  String get createNewMission =>
      'Criar uma nova Missão [simples como 1wp] e salvar';

  @override
  String get recentDateStamp =>
      'Isso dará um carimbo de data recente facilitando a busca e seleção';

  @override
  String get iosPath => 'iOS - Vá para ARQUIVOS/DJI Fly/wayline_mission/';

  @override
  String get androidPath =>
      'Android/DJI RC = Vá para Android/data/dji.go.v5/files/waypoint';

  @override
  String get selectMissionFolder =>
      'Selecione a pasta de missão criada mais recentemente por data/hora';

  @override
  String get guidExample =>
      'Seu nome será na forma de um GUID. Exemplo: 6103D3C8-E79A-4B48-BBFE-50932D2E1306';

  @override
  String get renameKmzFile =>
      'Renomeie o arquivo KMZ que você está importando para corresponder ao nome desta missão no seu dispositivo.';

  @override
  String get guidExample2 =>
      'Exemplo: 6103D3C8-E79A-4B48-BBFE-50932D2E1306.kmz';

  @override
  String get uploadRenamedKmz =>
      'Faça upload do KMZ renomeado na pasta da missão selecionada no seu dispositivo substituindo o KMZ existente';

  @override
  String get selectUploadedMission =>
      'Selecione a missão que você acabou de fazer upload, deve estar no topo da lista';

  @override
  String get examineWaypoints =>
      'Examine todos os pontos de passagem antes de voar para ter certeza de que estão configurados conforme esperado.';

  @override
  String get doNotModifyMission =>
      'Não modifique ou salve a missão de dentro do DJI Fly, porque ele não suporta curvas retas e quebrará a missão.';

  @override
  String get setSettingsCorrectly =>
      'Configure as configurações corretamente, destacadas em azul são as configurações importantes.';

  @override
  String get finishActionSame =>
      'A Ação de Finalização deve ser definida igual ao DJI Mapper';

  @override
  String get clickMissionsImport =>
      'Clique em \'Missões -> Importar\' e selecione o arquivo da missão.';

  @override
  String get saveMissionName =>
      'Salve a missão com um nome e ela será sincronizada automaticamente com seu dispositivo.';
}
