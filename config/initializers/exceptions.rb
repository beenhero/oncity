if defined? ExceptionNotifier
  ExceptionNotifier.exception_recipients = %w(beenhero@gmail.com)
  ExceptionNotifier.delivery_method = :smtp
end