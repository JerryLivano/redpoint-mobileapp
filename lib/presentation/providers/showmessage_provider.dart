import 'package:project_redpoint/domain/usecase/show_message.dart';
import 'package:project_redpoint/presentation/providers/message_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'showmessage_provider.g.dart';

@riverpod
ShowMessage showMessage(ShowMessageRef ref) =>
    ShowMessage(messageRepository: ref.read(messageRepositoryProvider));
