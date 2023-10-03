import 'package:bellboy/app/config/theme/app_assets.dart';
import 'package:bellboy/gen/assets.gen.dart';
import 'package:get/get.dart';

import '../model/confirmation_model.dart';
import '../model/vehcle_type.dart';

class PreWorkChecklistController extends GetxController {
  late RxInt currentQuestionIndex = 0.obs;
  late RxInt currentIndex = 0.obs;

  RxInt selectedIndex = RxInt(-1);

  RxList<VehicleType> vehicleTypes = List<VehicleType>.of([]).obs;
  final RxBool isVehicleTypeFetched = false.obs;
  final RxBool isVehicleTypeselelctedcar = false.obs;
  final RxBool isVehicleTypeselelctedmoto = false.obs;
  final RxBool isVehicleTypeselelctedbic = false.obs;

  Future<List<VehicleType>> fetchVehicleTypes() async {
    // simulate network delay

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
    // simulate network delay

    // This is the dummy data
    List<Map<String, dynamic>> data = [
      {
        "name": "Cart",
        "image": Assets.icons.buy,
      },
      {
        "name": "Safety boots",
        "image": Assets.icons.shoes,
      },
      {
        "name": "Hi-vis Vest",
        "image": Assets.icons.vest,
      },
      {
        "name": "Cooler bag or box",
        "image": Assets.icons.icecrystal,
      },
    ];

    return data.map((item) => ConfirmationModel.fromJson(item)).toList();
  }

//Motorcycle
  Future<List<ConfirmationModel>> fetchConfirmationModelMotorcycle() async {
    // simulate network delay

    // This is the dummy data
    List<Map<String, dynamic>> data = [
      {
        "name": "Safety boots",
        "image": Assets.icons.shoes,
      },
      {
        "name": "Helmet",
        "image": Assets.icons.helmet,
      },
      {
        "name": "Hi-vis Vest",
        "image": Assets.icons.vest,
      },
      {
        "name": "Cooler bag or box",
        "image": Assets.icons.icecrystal,
      },
    ];

    return data.map((item) => ConfirmationModel.fromJson(item)).toList();
  }

  final List<bool> termCheckedList = [false, false, false, false].obs;

  bool isTermChecked(int index) {
    return termCheckedList[index];
  }

  void toggleTerm(int index) {
    termCheckedList[index] = !termCheckedList[index];
    update();
  }

  bool areAllTermsSelected() {
    for (var isChecked in termCheckedList) {
      if (!isChecked) {
        return false;
      }
    }
    return true;
  }
}
