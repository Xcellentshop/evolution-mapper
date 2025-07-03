import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations();
  }

  // Home
  String get appTitle => 'Evolution Mapper';
  String get updateAvailable => 'Atualização Disponível';
  String get later => 'Depois';
  String get ignoreThisVersion => 'Ignorar Esta Versão';
  String get download => 'Baixar';
  String get searchLocation => 'Pesquisar localização';
  String get info => 'Informações';
  String get aircraft => 'Aeronave';
  String get camera => 'Câmera';
  String get file => 'Arquivo';

  // Export
  String get noWaypointsToExport => 'Nenhum waypoint para exportar';
  String get missionExportCancelled => 'Exportação da missão cancelada';
  String get missionExportedSuccessfully => 'Missão exportada com sucesso';
  String get noFileSelected => 'Nenhum arquivo selecionado';
  String get noPolygonsFound => 'Nenhum polígono encontrado';
  String get areaImportedSuccessfully => 'Área importada com sucesso';
  String get areaExportCancelled => 'Exportação da área cancelada';
  String get selectPolygon => 'Selecionar Polígono';
  String get importExportMappingAreaTitle => 'Importar/Exportar Área de Mapeamento';
  String get load => 'Carregar';
  String get cancel => 'Cancelar';
  String get areaExportedSuccessfully => 'Área exportada com sucesso';
  String get exportYourSurveyMission => 'Exportar sua missão de levantamento';
  String get saveAsDjiFlyWaypointMission => 'Salvar como missão de waypoints DJI Fly';
  String get saveAsLitchiMission => 'Salvar como missão Litchi';
  String get importFromKml => 'Importar do KML';
  String get exportToKml => 'Exportar para KML';

  // App Bar
  String get theme => 'Tema';
  String get github => 'GitHub';
  String get helpLoadingMission => 'Ajuda para carregar missão';
  String get dji => 'DJI';
  String get litchi => 'Litchi';

  // Aircraft
  String get altitude => 'Altitude';
  String get speed => 'Velocidade';
  String get overlap => 'Sobreposição';
  String get sidelap => 'Sobreposição lateral';
  String get rotation => 'Rotação';
  String get cameraAngle => 'Ângulo da câmera';
  String get delayAtWaypoint => 'Atraso no waypoint';
  String get onFinished => 'Ao finalizar';
  String get hover => 'Pairar';
  String get rth => 'Retornar ao ponto de partida';
  String get land => 'Pousar';
  String get goToFirstWaypoint => 'Ir para o primeiro waypoint';
  String get onRcLost => 'Ao perder controle remoto';

  // Camera
  String get cameraPreset => 'Predefinição da câmera';
  String get add => 'Adicionar';
  String get presetTitle => 'Título da predefinição';
  String get save => 'Salvar';
  String get delete => 'Excluir';
  String get sensorWidth => 'Largura do sensor';
  String get sensorHeight => 'Altura do sensor';
  String get focalLength => 'Distância focal';
  String get imageWidth => 'Largura da imagem';
  String get imageHeight => 'Altura da imagem';

  // Info
  String get createPhotoPoints => 'Criar pontos de foto';
  String get showPhotoPoints => 'Mostrar pontos de foto';
  String get showWaypoints => 'Mostrar waypoints';
  String get fillGrid => 'Preencher grade';
  String numberOfPhotos(int count) => 'Número de fotos: $count';
  String numberOfWaypoints(int count) => 'Número de waypoints: $count';
  String flightDistance(double distance) => 'Distância de voo: ${distance.toStringAsFixed(1)}m';
  String area(double area) => 'Área: ${area.toStringAsFixed(1)}m²';
  String estimatedFlightTime(int minutes) => 'Tempo de voo estimado: ${minutes}min';
  String recommendedShutterSpeed(double speed) => 'Velocidade do obturador recomendada: ${speed.toStringAsFixed(1)}s';

  // DJI Load Alert
  String get loadMissionIntoDjiFly => 'Carregar missão no DJI Fly';
  String get step1 => 'Passo 1:';
  String get openDjiFly => 'Abra o DJI Fly';
  String get createNewMission => 'Crie uma nova missão';
  String get quitDjiFly => 'Saia do DJI Fly';
  String get recentDateStamp => 'Carimbo de data recente';
  String get step2 => 'Passo 2:';
  String get iosPath => 'iOS: Files > On My iPhone > DJI Fly > Missions';
  String get androidPath => 'Android: Internal Storage > DJI Fly > Missions';
  String get selectMissionFolder => 'Selecione a pasta da missão';
  String get guidExample => 'Exemplo de GUID: 12345678-1234-1234-1234-123456789012';
  String get renameKmzFile => 'Renomeie o arquivo .kmz';
  String get guidExample2 => 'Exemplo: 12345678-1234-1234-1234-123456789012.kmz';
  String get uploadRenamedKmz => 'Faça upload do .kmz renomeado';
  String get selectUploadedMission => 'Selecione a missão carregada';
  String get examineWaypoints => 'Examine os waypoints';
  String get doNotModifyMission => 'Não modifique a missão';
  String get doNotShowThisAgain => 'Não mostrar novamente';
  String get done => 'Concluído';

  // Litchi Load Alert
  String get loadMissionIntoLitchi => 'Carregar missão no Litchi';
  String get setSettingsCorrectly => 'Configure as configurações corretamente';
  String get finishActionSame => 'Ação de finalização deve ser a mesma';
  String get step3 => 'Passo 3:';
  String get clickMissionsImport => 'Clique em Missões > Importar';
  String get step4 => 'Passo 4:';
  String get saveMissionName => 'Salve com um nome de missão';
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations();
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
} 