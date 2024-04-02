// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:stacked_generator/builder.dart' as _i2;
import 'package:freezed/builder.dart' as _i3;
import 'package:json_serializable/builder.dart' as _i4;
import 'package:hive_generator/hive_generator.dart' as _i5;
import 'package:source_gen/builder.dart' as _i6;
import 'package:mockito/src/builder.dart' as _i7;
import 'package:build_config/build_config.dart' as _i8;
import 'package:build_resolvers/builder.dart' as _i9;
import 'dart:isolate' as _i10;
import 'package:build_runner/build_runner.dart' as _i11;
import 'dart:io' as _i12;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'stacked_generator:stackedRouterGenerator',
    [_i2.stackedRouterGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedLoggerGenerator',
    [_i2.stackedLoggerGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedLocatorGenerator',
    [_i2.stackedLocatorGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedFormGenerator',
    [_i2.stackedFormGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedDialogGenerator',
    [_i2.stackedDialogGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'stacked_generator:stackedBottomsheetGenerator',
    [_i2.stackedBottomsheetGenerator],
    _i1.toDependentsOf(r'stacked_generator'),
    hideOutput: false,
  ),
  _i1.apply(
    r'freezed:freezed',
    [_i3.freezed],
    _i1.toDependentsOf(r'freezed'),
    hideOutput: false,
  ),
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i4.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'hive_generator:hive_generator',
    [_i5.getBuilder],
    _i1.toDependentsOf(r'hive_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i6.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'mockito:mockBuilder',
    [_i7.buildMocks],
    _i1.toDependentsOf(r'mockito'),
    hideOutput: false,
    defaultGenerateFor: const _i8.InputSet(include: [r'test/**']),
  ),
  _i1.apply(
    r'build_resolvers:transitive_digests',
    [_i9.transitiveDigestsBuilder],
    _i1.toAllPackages(),
    isOptional: true,
    hideOutput: true,
    appliesBuilders: const [r'build_resolvers:transitive_digest_cleanup'],
  ),
  _i1.applyPostProcess(
    r'build_resolvers:transitive_digest_cleanup',
    _i9.transitiveDigestCleanup,
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i6.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i10.SendPort? sendPort,
]) async {
  var result = await _i11.run(
    args,
    _builders,
  );
  sendPort?.send(result);
  _i12.exitCode = result;
}
