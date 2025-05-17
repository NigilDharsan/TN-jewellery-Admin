class DashboardModel {
  Data? data;

  DashboardModel({this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? yetToApproveCustomers;
  int? approvedCustomers;
  int? rejectedCustomers;
  int? nonAssignedOrdersCount;
  int? workInProgressOrdersCount;
  int? deliveryReadyOrdersCount;
  int? overdueOrdersCount;
  int? tagWithoutImages;
  int? cadYetToAssignCount;
  int? cadWorkInProgressCount;
  int? camYetToAssignCount;
  int? camWorkInProgressCount;
  int? productionYetToAssignCount;
  int? productionWorkInProgressCount;

  Data(
      {this.yetToApproveCustomers,
      this.approvedCustomers,
      this.rejectedCustomers,
      this.nonAssignedOrdersCount,
      this.workInProgressOrdersCount,
      this.deliveryReadyOrdersCount,
      this.overdueOrdersCount,
      this.tagWithoutImages,
      this.cadYetToAssignCount,
      this.cadWorkInProgressCount,
      this.camYetToAssignCount,
      this.camWorkInProgressCount,
      this.productionYetToAssignCount,
      this.productionWorkInProgressCount
      });

  Data.fromJson(Map<String, dynamic> json) {
    yetToApproveCustomers = json['yet_to_approve_customers'];
    approvedCustomers = json['approved_customers'];
    rejectedCustomers = json['rejected_customers'];
    nonAssignedOrdersCount = json['non_assigned_orders_count'];
    workInProgressOrdersCount = json['work_in_progress_orders_count'];
    deliveryReadyOrdersCount = json['delivery_ready_orders_count'];
    overdueOrdersCount = json['customer_overdue_count'];
    tagWithoutImages = json['tag_without_images'];
    cadYetToAssignCount = json['cad_yet_to_assign'];
    cadWorkInProgressCount = json['cad_work_in_progress'];
    camYetToAssignCount = json['cam_yet_assign'];
    camWorkInProgressCount = json['cam_work_in_progress'];
    productionYetToAssignCount = json['production_yet_to_assign'];
    productionWorkInProgressCount = json['production_in_progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yet_to_approve_customers'] = this.yetToApproveCustomers;
    data['approved_customers'] = this.approvedCustomers;
    data['rejected_customers'] = this.rejectedCustomers;
    data['non_assigned_orders_count'] = this.nonAssignedOrdersCount;
    data['work_in_progress_orders_count'] = this.workInProgressOrdersCount;
    data['delivery_ready_orders_count'] = this.deliveryReadyOrdersCount;
    data['overdue_orders_count'] = this.overdueOrdersCount;
    data['cad_yet_to_assign'] = this.cadYetToAssignCount;
    data['cad_work_in_progress'] = this.cadWorkInProgressCount;
    data['cam_yet_assign'] = this.camYetToAssignCount;
    data['cam_work_in_progress'] = this.camWorkInProgressCount;
    data['production_yet_to_assign'] = this.productionYetToAssignCount;
    data['production_in_progress'] = this.productionWorkInProgressCount;
    data['tag_without_images'] = this.tagWithoutImages;
    return data;
  }
}
