

import 'package:rapidito_user/data/api_client.dart';

abstract class RefundRequestServiceInterface{
  Future<dynamic> getParcelRefundReasonList();
  Future<dynamic> sendRefundRequest({
    required String tripId,
    required String refundReason,
    String? refundNote,
    required double productApproximatePrice,
    required List<MultipartBody> proofImage,
  });
}