import "dart:io" show File;
import 'package:path/path.dart' as safe_path show join;
import 'package:yaml/yaml.dart' show loadYaml, YamlMap;

String defaultDataPath = safe_path.join('data', 'schedule.yaml');

YamlMap yamlToMap({String path = ""}) {
  if (path == "") {
    path = defaultDataPath;
  }
  File file = File(path);
  String yamlString = file.readAsStringSync();
  YamlMap yaml = loadYaml(yamlString);
  return yaml;
}
