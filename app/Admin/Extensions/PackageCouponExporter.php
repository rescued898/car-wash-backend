<?php


namespace App\Admin\Extensions;


use Encore\Admin\Grid\Exporters\ExcelExporter;
use Maatwebsite\Excel\Concerns\WithDrawings;
use Maatwebsite\Excel\Concerns\WithMapping;
use PhpOffice\PhpSpreadsheet\Worksheet\Drawing;

class PackageCouponExporter extends ExcelExporter implements WithMapping
    //, WithDrawings
{
    protected $fileName = '优惠包列表.xlsx';

    protected $columns = [
        'id' => 'ID',
        'name' => '名字',
        'desc' => '详情',
        "pic_url" => "图片地址",
        "coupon_type" => "洗车券使用类型",
        "quantity" => "购买洗车券的数量",
        "additional_coupon_type" => "额外送的券的使用类型",
        "additional_quantity" => "购买送的券的数量",
        "price" => "售价",
        "sort" => "排序",
        "user_num" => "每人限制兑换数量",
        "rule" => "使用说明"
    ];

    public function map($invoice) : array
    {
        if ($invoice->coupon_type == 1){
            $coupon_type = '自助洗车';
        }else{
            $coupon_type = '全自助洗车';
        }
        return [
            $invoice->id,
            $invoice->name,
            $invoice->desc,
            $invoice->pic_url,
            $coupon_type,
            $invoice->quantity,
            $invoice->additional_coupon_type == 1 ? '自助洗车' : '全自动洗车',
            $invoice->additional_quantity,
            $invoice->price,
            $invoice->sort,
            $invoice->user_num,
            $invoice->rule,
            // data_get($invoice, 'profile.homepage'),    // 读取关联关系数据
        ];
    }

//    public function drawings()
//    {
//        $drawing = new Drawing();
//        $drawing->setName('Logo');
//        $drawing->setDescription('This is my logo');
//        $drawing->setPath(public_path('/storage/logo.jpg'));
//        $drawing->setHeight(50);
//        $drawing->setCoordinates('B3');
//
//        $drawing2 = new Drawing();
//        $drawing2->setName('Other image');
//        $drawing2->setDescription('This is a second image');
//        $drawing2->setPath(public_path('/storage/logo.jpg'));
//        $drawing2->setHeight(120);
//        $drawing2->setCoordinates('G2');
//
//        return [$drawing, $drawing2];
//    }
}
