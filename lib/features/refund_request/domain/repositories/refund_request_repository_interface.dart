import 'package:rapidito_user/data/api_client.dart';
import 'package:rapidito_user/interface/repository_interface.dart';

abstract class RefundRequestRepositoryInterface implements RepositoryInterface{
  Future<dynamic> getParcelRefundReasonList();
  Future<dynamic> sendRefundRequest({
    required String tripId,
    required String refundReason,
    String? refundNote,
    required double productApproximatePrice,
    required List<MultipartBody> proofImage,
  });
}