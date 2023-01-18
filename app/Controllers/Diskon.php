<?php

namespace App\Controllers;

use App\Models\DiskonModel;

class Diskon extends BaseController
{
  public function __construct()
  {
    helper('form');
    $this->diskon = new DiskonModel();
  }

  public function isVoucherExist(){
    if ($this->request->isAJAX()){
      $kode_voucher = $this->request->getGet('kode_voucher');
      $condition = [
        'kode_voucher'=>$kode_voucher,
      ];
      $diskon_data = $this->diskon->where($condition)->first();
      if(!$diskon_data) {
        $response = [
          'success' => false,
          'code' => 404,
          'status' => 'NOT_FOUND',
          'message' => 'Voucher Code not Found',
        ];
        return $this->response->setStatusCode(404)->setJson($response);
      }
      return $this->response->setJSON($diskon_data);
    }
  }
}
