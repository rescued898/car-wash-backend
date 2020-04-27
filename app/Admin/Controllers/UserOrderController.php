<?php

namespace App\Admin\Controllers;

use App\Models\UserOrder;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserOrderController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '订单管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new UserOrder());

        $grid->column('id', __('Id'));
        $grid->column('order_no', __('Order no'));
        $grid->column('user_id', __('User id'));
        $grid->column('point.name', __('Point'));
        $grid->column('machine.machine_no', __('Point machine no'));
        $grid->column('type', __('Type'));
        $grid->column('pay_type', __('Pay type'));
        $grid->column('pay_price', __('Pay price'));
        $grid->column('is_pay', __('Is pay'))->display(function ($status) {
            return $status == 1 ? '是' : '否';
        });
        $grid->column('apply_delete', __('Apply delete'))->display(function ($status) {
            return $status == 1 ? '是' : '否';
        });
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        $grid->disableCreateButton();

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
        $show = new Show(UserOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('type', __('Type'));
        $show->field('pay_type', __('Pay type'));
        $show->field('pay_price', __('Pay price'));
        $show->field('point', __('Point'));
        $show->field('point_id', __('Point id'));
        $show->field('point_machine_id', __('Point machine id'));
        $show->field('order_no', __('Order no'));
        $show->field('apply_delete', __('Apply delete'));
        $show->field('is_pay', __('Is pay'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new UserOrder());

        $form->number('user_id', __('User id'));
        $form->switch('type', __('Type'))->default(1);
        $form->text('pay_type', __('Pay type'));
        $form->number('pay_price', __('Pay price'));
        $form->text('point', __('Point'));
        $form->number('point_id', __('Point id'));
        $form->number('point_machine_id', __('Point machine id'));
        $form->text('order_no', __('Order no'));
        $form->number('apply_delete', __('Apply delete'));
        $form->number('is_pay', __('Is pay'));

        return $form;
    }
}
