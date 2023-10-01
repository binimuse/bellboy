import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:get/get.dart';

import '../model/confirmation_model.dart';
import '../model/vehcle_type.dart';

class PreWorkChecklistController extends GetxController {
  late RxInt currentQuestionIndex = 0.obs;
  late RxInt currentIndex = 0.obs;
  RxInt selectedIndex = RxInt(-1);

  RxList<VehicleType> vehicleTypes = List<VehicleType>.of([]).obs;
  final RxBool isVehicleTypeFetched = false.obs;

  Future<List<VehicleType>> fetchVehicleTypes() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    // This is the dummy data
    const data = [
      {
        "name": "Car",
        "image": AppAssets.imageCar,
        "date": "~ 23/02/2023",
      },
      {
        "name": "Motorcycle",
        "image": AppAssets.imagemotorcycle,
        "date": "~ 23/02/2024",
      },
      {
        "name": "Bicycle",
        "image": AppAssets.imagebicyle,
        "date": "",
      },
      // Add more questions here
    ];
    isVehicleTypeFetched(true);

    return data.map((item) => VehicleType.fromJson(item)).toList();
  }

//Car
  Future<List<ConfirmationModel>> fetchConfirmationModelCar() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    // This is the dummy data
    const data = [
      {
        "name": "Cart",
        "image": AppAssets.imageCar,
      },
      {
        "name": "Safety boots",
        "image": AppAssets.imagemotorcycle,
      },
      {
        "name": "Hi-vis Vest",
        "image": AppAssets.imagebicyle,
      },
      {
        "name": "Cooler bag or box",
        "image": AppAssets.imagebicyle,
      },
    ];

    return data.map((item) => ConfirmationModel.fromJson(item)).toList();
  }

//Motorcycle
  Future<List<ConfirmationModel>> fetchConfirmationModelMotorcycle() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay

    // This is the dummy data
    const data = [
      {
        "name": "Safety boots",
        "image": AppAssets.imageCar,
      },
      {
        "name": "Safety boots",
        "image": AppAssets.imagemotorcycle,
      },
      {
        "name": "Hi-vis Vest",
        "image": AppAssets.imagebicyle,
      },
      {
        "name": "Cooler bag or box",
        "image": AppAssets.imagebicyle,
      },
    ];

    return data.map((item) => ConfirmationModel.fromJson(item)).toList();
  }
}
