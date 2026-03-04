abstract class StorageAction {
  const StorageAction();
}

class StorageActionCreate extends StorageAction {
  const StorageActionCreate();
}

class StorageActionUpdate extends StorageAction {
  const StorageActionUpdate({
    this.skipAudit = false,
  });

  final bool skipAudit;
}
