
import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:meta/meta.dart';

/// A [Command] that has its own `run` routine.
abstract class LeafCommand extends Command<int> {
  Logger get logger;

  @override
  @nonVirtual
  Future<int> run() async {
    try {
      return await runCommand();
    } on UsageException catch (e) {
      logger
        ..err(e.message)
        ..info('')
        ..info(usage);

      return ExitCode.usage.code;
    }

    usageException(message)
  }

  Future<int> runCommand();
}
