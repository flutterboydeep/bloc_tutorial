import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_bloc/Data/image_repo.dart';

import 'package:learn_bloc/bloc/image_event.dart';
import 'package:learn_bloc/bloc/image_state.dart';

class ImageBloc extends Bloc<ImagePickerEvent, InitialImageState> {
  final ImagePickerRepo imagePickerRepo;
  ImageBloc(this.imagePickerRepo) : super(InitialImageState()) {
    on<CameraModeEvent>(_cameraClick);
    on<GalleryModeEvent>(_imageClick);
  }
  void _cameraClick(event, emit) async {
    XFile? CameraMode = await imagePickerRepo.UseCamera();
    emit(state.copyWith(file: CameraMode));
  }

  void _imageClick(event, emit) async {
    XFile? imageFile = await imagePickerRepo.UseGallery();
    emit(state.copyWith(file: imageFile));
  }
}
