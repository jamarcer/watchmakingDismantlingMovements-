enum BackupStatus { running, verified, failed }

class BackupProgress {
  const BackupProgress({
    required this.status,
    required this.bytesCopied,
    required this.totalBytes,
    required this.path,
    this.error,
  });
  final BackupStatus status;
  final int bytesCopied, totalBytes;
  final String path;
  final String? error;
  double get fraction =>
      totalBytes == 0 ? 0 : (bytesCopied / totalBytes).clamp(0, 1);
}

class BackupResult {
  const BackupResult({
    required this.destinationUri,
    required this.manifestSha256,
    required this.bytesCopied,
    required this.filesCopied,
  });
  final Uri destinationUri;
  final String manifestSha256;
  final int bytesCopied, filesCopied;
}
