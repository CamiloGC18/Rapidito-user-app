import 'package:rapidito_user/features/address/domain/models/address_model.dart';
import 'package:rapidito_user/interface/repository_interface.dart';

abstract class AddressRepositoryInterface implements RepositoryInterface<Address>{
  Future<dynamic> updateLastLocation(String lat, String lng, String zoneID);
}