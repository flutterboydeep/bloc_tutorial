import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class InitialImageState extends Equatable {
  final XFile? file;
  InitialImageState({this.file});

  InitialImageState copyWith({XFile? file}) {
    return InitialImageState(file: file ?? this.file);
  }

  @override
  List<Object?> get props => [file];
}
