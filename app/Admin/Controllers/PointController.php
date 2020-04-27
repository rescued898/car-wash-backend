<?php

namespace App\Admin\Controllers;

use App\Admin\Extensions\PointExporter;
use App\Models\Point;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PointController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '洗车点管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Point());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('address', __('Address'));
        $grid->column('lat', __('Lat'));
        $grid->column('lng', __('Lng'));
        $grid->column('status', __('Status'))->display(function ($status) {
            return $status == 1 ? '启用' : '禁用';
        });
        $grid->column('updated_at', __('Updated at'));
        $grid->column('created_at', __('Created at'));
        $grid->exporter(new PointExporter());
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
        $show = new Show(Point::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('address', __('Address'));
        $show->field('经纬度')->latlong('lat', 'lng', $height = 400, $zoom = 16);
        $show->field('status', __('Status'));
        $show->field('updated_at', __('Updated at'));
        $show->field('created_at', __('Created at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Point());

        $form->text('name', __('Name'))->required();
        $form->text('address', __('Address'))->required();
        $form->latlong('lat', 'lng', '经纬度')->height(500);
        $form->switch('status', __('Status'))->default(1);

        return $form;
    }
}
