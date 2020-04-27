<?php


namespace App\Admin\Extensions;


use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\WithMapping;

class PointExporter extends ExcelExporter implements WithMapping
{
    protected $fileName = '洗车点清单.xlsx';

    protected $columns = [
        'id' => 'ID',
        'name' => '名字',
        'address' => '详情地址',
        "lat" => "纬度",
        "lng" => "经度",
        "status" => "状态",
        "updated_at" => "更新时间",
        "created_at" => "创建时间"
    ];

    public function map($invoice) : array
    {
        if ($invoice->status == 1){
            $status = '启用';
        }else{
            $status = '未启用';
        }
        return [
            $invoice->id,
            $invoice->name,
            $invoice->address,
            $invoice->lat,
            $invoice->lng,
            $status,
            $invoice->updated_at,
            $invoice->created_at
        ];
    }

}
