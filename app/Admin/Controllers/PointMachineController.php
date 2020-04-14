<?php

namespace App\Admin\Controllers;

use App\Models\PointMachine;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PointMachineController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '机器管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PointMachine());

        $grid->column('id', __('Id'));
        $grid->column('point_id', __('Point id'));
        $grid->column('name', __('Name'));
        $grid->column('machine_no', __('Machine no'));
        $grid->column('machine_type', __('Machine type'));
        $grid->column('type', __('Type'));
        $grid->column('cost', __('Cost'));
        $grid->column('cost_at', __('Cost at'));
        $grid->column('build_at', __('Build at'));
        $grid->column('remark', __('Remark'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('deleted_at', __('Deleted at'));

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
        $show = new Show(PointMachine::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('point_id', __('Point id'));
        $show->field('name', __('Name'));
        $show->field('machine_no', __('Machine no'));
        $show->field('machine_type', __('Machine type'));
        $show->field('type', __('Type'));
        $show->field('cost', __('Cost'));
        $show->field('cost_at', __('Cost at'));
        $show->field('build_at', __('Build at'));
        $show->field('remark', __('Remark'));
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
        $form = new Form(new PointMachine());

        $form->number('point_id', __('Point id'));
        $form->text('name', __('Name'));
        $form->text('machine_no', __('Machine no'));
        $form->text('machine_type', __('Machine type'));
        $form->switch('type', __('Type'));
        $form->number('cost', __('Cost'));
        $form->datetime('cost_at', __('Cost at'))->default(date('Y-m-d H:i:s'));
        $form->datetime('build_at', __('Build at'))->default(date('Y-m-d H:i:s'));
        $form->text('remark', __('Remark'));

        return $form;
    }
}
