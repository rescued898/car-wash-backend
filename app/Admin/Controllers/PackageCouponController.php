<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\PackageCouponExporter;
use App\Models\PackageCoupon;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PackageCouponController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '优惠包管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PackageCoupon());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('desc', __('Desc'));
        // $grid->column('pic_url', __('Pic url'));
        $grid->column('coupon_type', __('Coupon type'))->display(function ($coupon_type) {
            return $coupon_type == 1 ? '自助洗车' : '全自动洗车';
        });
        $grid->column('quantity', __('Quantity'));
        $grid->column('additional_coupon_type', __('Additional coupon type'))->display(function ($coupon_type) {
            return $coupon_type == 1 ? '自助洗车' : '全自动洗车';
        });
        $grid->column('additional_quantity', __('Additional quantity'));
        $grid->column('price', __('Price'));
        // $grid->column('sort', __('Sort'));
        $grid->column('user_num', __('User num'))->display(function ($coupon_type) {
            return $coupon_type == 0 ? '不限制' : $coupon_type;
        });
        $grid->column('rule', __('Rule'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        // $grid->column('deleted_at', __('Deleted at'));
        $grid->exporter(new PackageCouponExporter());
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(PackageCoupon::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('desc', __('Desc'));
        $show->field('pic_url', __('Pic url'));
        $show->field('coupon_type', __('Coupon type'));
        $show->field('quantity', __('Quantity'));
        $show->field('additional_coupon_type', __('Additional coupon  type'));
        $show->field('additional_quantity', __('Additional quantity'));
        $show->field('price', __('Price'));
        $show->field('sort', __('Sort'));
        $show->field('user_num', __('User num'));
        $show->field('rule', __('Rule'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('deleted_at', __('Deleted at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PackageCoupon());

        $form->text('name', __('Name'));
        $form->text('desc', __('Desc'));
        $form->image('pic_url',  __('Pic url'))->move('images/' .Carbon::now()->toDateString());
        // $form->text('pic_url', __('Pic url'));
        $directors = [
            1 => '自助洗车',
            2 => '全自动洗车'
        ];
        $form->select('coupon_type', __('Coupon type'))->options($directors);
        // $form->switch('coupon_type', __('Coupon type'))->default(1);
        $form->number('quantity', __('Quantity'))->default(10);
        // $form->switch('additional_coupon_type', __('Additional coupon type'))->default(1);
        $form->select('additional_coupon_type', __('Additional coupon type'))->options($directors);;
        $form->number('additional_quantity', __('Additional quantity'));
        $form->decimal('price', __('Price'))->default(0.00);
        $form->number('sort', __('Sort'))->default(100);
        $form->number('user_num', __('User num'));
        $form->textarea('rule', __('Rule'));

        return $form;
    }
}
