<?php

namespace App\Admin\Controllers;

use App\Models\Point;
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
        $grid->column('name', __('Name'));
        $grid->column('point.name', __('Point name'));
        $grid->column('machine_no', __('Machine no'));
        // 1-自助型 2-全自动型
        $grid->column('type', __('Type'))->display(function ($type) {
            return $type == 1 ? '自助型 ' : '全自动型';
        });
        $grid->column('cost', __('Cost'));
        $grid->column('cost_at', __('Cost at'));
        $grid->column('build_at', __('Build at'));
        $grid->column('remark', __('Remark'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show->column('type', __('Type'))->display(function ($type) {
            return $type == 1 ? '自助型' : '全自动型';
        });
        // $show->field('type', __('Type'));
        $show->field('cost', __('Cost'));
        $show->field('cost_at', __('Cost at'));
        $show->field('build_at', __('Build at'));
        $show->field('remark', __('Remark'));
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
        $form = new Form(new PointMachine());
        $form->text('name', __('Name'));
        // 所属洗车点查询
        $points = Point::query()->get(['id','name'])->toArray();
        $directors = [];
        foreach ($points as $point){
            $directors[$point['id']] = $point['name'];
        }
        $form->select('point_id', __('Point id'))->options($directors);
        //机器型号
        $form->text('machine_no', __('Machine no'));
        // 1-自助型 2-全自动型
        $directors = [
            1 => '自助型',
            2 => '全自动型'
        ];
        $form->select('type', __('Type'))->options($directors);
        $form->number('cost', __('Cost'));
        $form->datetime('cost_at', __('Cost at'))->default(date('Y-m-d H:i:s'));
        $form->datetime('build_at', __('Build at'))->default(date('Y-m-d H:i:s'));
        $form->text('remark', __('Remark'));

        return $form;
    }
}
