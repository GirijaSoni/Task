// ignore_for_file: directives_ordering

import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:built_value_generator/builder.dart' as _i2;
import 'package:moor_generator/moor_generator.dart' as _i3;
import 'package:json_serializable/builder.dart' as _i4;
import 'package:source_gen/builder.dart' as _i5;
import 'package:chopper_generator/chopper_generator.dart' as _i6;
import 'package:build_config/build_config.dart' as _i7;
import 'dart:isolate' as _i8;
import 'package:build_runner/build_runner.dart' as _i9;
import 'dart:io' as _i10;

final _builders = <_i1.BuilderApplication>[
  _i1.apply('built_value_generator:built_value', [_i2.builtValue],
      _i1.toDependentsOf('built_value_generator'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('moor_generator:moor_generator', [_i3.moorBuilder],
      _i1.toDependentsOf('moor_generator'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('json_serializable:json_serializable', [_i4.jsonSerializable],
      _i1.toDependentsOf('json_serializable'),
      hideOutput: true, appliesBuilders: ['source_gen:combining_builder']),
  _i1.apply('source_gen:combining_builder', [_i5.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: ['source_gen:part_cleanup']),
  _i1.apply('chopper_generator:chopper_generator',
      [_i6.chopperGeneratorFactory], _i1.toRoot(),
      hideOutput: false),
  _i1.applyPostProcess('source_gen:part_cleanup', _i5.partCleanup,
      defaultGenerateFor: const _i7.InputSet())
];
main(List<String> args, [_i8.SendPort sendPort]) async {
  var result = await _i9.run(args, _builders);
  sendPort?.send(result);
  _i10.exitCode = result;
}
