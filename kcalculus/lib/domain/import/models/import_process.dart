import 'package:kcalculus/domain/import/models/import_record.dart';

sealed class ImportProcess {
  const ImportProcess();

  const factory ImportProcess.unavailable() = ImportProcessUnavailable;

  const factory ImportProcess.idle() = ImportProcessIdle;

  const factory ImportProcess.remote() = ImportProcessRemote;

  const factory ImportProcess.localPending() = ImportProcessLocalPending;

  const factory ImportProcess.localActive(ImportRecord importRecord) =
      ImportProcessLocalActive;
}

class ImportProcessUnavailable extends ImportProcess {
  const ImportProcessUnavailable();
}

class ImportProcessIdle extends ImportProcess {
  const ImportProcessIdle();
}

class ImportProcessRemote extends ImportProcess {
  const ImportProcessRemote();
}

class ImportProcessLocalPending extends ImportProcess {
  const ImportProcessLocalPending();
}

class ImportProcessLocalActive extends ImportProcess {
  const ImportProcessLocalActive(this.importRecord);

  final ImportRecord importRecord;
}
