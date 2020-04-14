<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Carbon\Carbon;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UserController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '用户管理';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $grid->column('id', __('Id'));
        $grid->column('name', __('Name'));
        $grid->column('nickname', __('Nickname'));

        // $grid->column('password', __('Password'));
        $grid->column('email', __('Email'));
        // $grid->column('auth_key', __('Auth key'));
        // $grid->column('access_token', __('Access token'));
        // $grid->column('remember_token', __('Remember token'));
        // $grid->column('wechat_open_id', __('Wechat open id'));
        // $grid->column('wechat_union_id', __('Wechat union id'));
        $grid->column('binding', __('Binding'));
        // $grid->column('avatar_url', __('Avatar url'));
        $grid->column('money', __('Money'));
        $grid->column('contact_way', __('Contact way'));
        // $grid->column('comments', __('Comments'));
        // $grid->column('blacklist', __('Blacklist'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('created_at', __('Created at'));
        // $grid->column('deleted_at', __('Deleted at'));
        // $grid->column('parent_id', __('Parent id'));
        // $grid->column('is_distributor', __('Is distributor'));
        // $grid->column('distributor_at', __('Distributor at'));
        // $grid->column('distributor_total_price', __('Distributor total price'));
        // $grid->column('distributor_price', __('Distributor price'));
        // $grid->column('level', __('Level'));
        // $grid->column('email_verified_at', __('Email verified at'));

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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Name'));
        $show->field('email', __('Email'));
        $show->field('auth_key', __('Auth key'));
        $show->field('access_token', __('Access token'));
        $show->field('remember_token', __('Remember token'));
        $show->field('binding', __('Binding'));
        $show->field('nickname', __('Nickname'));
        $show->field('avatar_url', __('Avatar url'));
        $show->field('wechat_open_id', __('Wechat open id'));
        $show->field('wechat_union_id', __('Wechat union id'));
        $show->field('money', __('Money'));
        $show->field('contact_way', __('Contact way'));
        $show->field('comments', __('Comments'));
        $show->field('blacklist', __('Blacklist'));
        $show->field('updated_at', __('Updated at'));
        $show->field('created_at', __('Created at'));
        $show->field('deleted_at', __('Deleted at'));
        // $show->field('parent_id', __('Parent id'));
        // $show->field('is_distributor', __('Is distributor'));
        // $show->field('distributor_at', __('Distributor at'));
        // $show->field('distributor_total_price', __('Distributor total price'));
        // $show->field('distributor_price', __('Distributor price'));
        // $show->field('level', __('Level'));

        $show->field('email_verified_at', __('Email verified at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User());

        $form->text('name', __('Name'))->required();
        $form->email('email', __('Email'));
        // $form->password('password', __('Password'));
        // $form->text('auth_key', __('Auth key'));
        // $form->text('access_token', __('Access token'));
        // $form->text('remember_token', __('Remember token'));
        $form->mobile('binding', __('Binding'))->options(['mask' => '999 9999 9999']);
        $form->text('nickname', __('Nickname'));
        $form->image('avatar_url',  __('Avatar url'))->move('images/' .Carbon::now()->toDateString());
        $form->decimal('money', __('Money'))->default(0.00);
        $form->text('contact_way', __('Contact way'));
        $form->text('comments', __('Comments'));
        $form->switch('blacklist', __('Blacklist'));
        // $form->number('parent_id', __('Parent id'));
        // b$form->switch('is_distributor', __('Is distributor'));
        // $form->datetime('distributor_at', __('Distributor at'))->default(date('Y-m-d H:i:s'));
        // $form->decimal('distributor_total_price', __('Distributor total price'))->default(0.00);
        // $form->decimal('distributor_price', __('Distributor price'))->default(0.00);
        $form->number('level', __('Level'))->default(-1);

        // $form->datetime('email_verified_at', __('Email verified at'))->default(date('Y-m-d H:i:s'));

        return $form;
    }
}
