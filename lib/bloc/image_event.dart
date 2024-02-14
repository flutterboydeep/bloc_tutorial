import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {}

class CameraModeEvent extends ImagePickerEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GalleryModeEvent extends ImagePickerEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}
