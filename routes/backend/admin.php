<?php

/**
 * All route names are prefixed with 'admin.'.
 */
Route::redirect('/', '/admin/dashboard', 301);
Route::get('dashboard', 'DashboardController@index')->name('dashboard');

//Route::get(LaravelLocalization::transRoute('routes.dashboard'), 'DashboardController@index')->name('dashboard');

/****************************************************************************
 *	Rename installer file
 * *************************************************************************/
Route::get('remove-installer', 'DashboardController@removeInstaller')->name('installer.remove');

/****************************************************************************
	Site Settings
***************************************************************************/
Route::get('settings/site_settings', 'AdminSettingsController@index')->name('settings');
//Route::post('settings/site-settings', 'AdminSettingsController@store')->name('settings.store');
//Route::get('settings/site-settings/{id}/edit', 'AdminSettingsController@edit')->name('settings.edit');
//Route::put('settings/update', 'AdminSettingsController@update')->name('settings.update');

//Route::get('settings/env', 'AdminEnvController@index')->name('env');

/****************************************************************************
	Course categories
 ***************************************************************************/
Route::get('course/categories', 'AdminCategoryController@index')->name('course.categories');
Route::get('course/categories/{category}/edit', 'AdminCategoryController@edit')->name('course.categories.edit');
Route::put('course/categories/{category}/update', 'AdminCategoryController@update')->name('course.categories.update');
Route::post('course/categories', 'AdminCategoryController@store')->name('course.categories.store');
//Route::post('videos/categories/sort_order', 'AdminCategoryController@orderCategories');
Route::delete('course/categories/{category}/delete', 'AdminCategoryController@destroy')->name('course.destroy');


/****************************************************************************
	Courses
 ***************************************************************************/
Route::get('course/courses', 'AdminCourseController@index')->name('course.courses');
Route::get('course/courses/{course}/details', 'AdminCourseController@details')->name('course.courses.details');
Route::post('course/courses/{course}/approval', 'AdminCourseController@approval')->name('course.courses.approval');

/****************************************************************************
	Finance
 ***************************************************************************/
Route::get('finance/withdrawals', 'AdminWithdrawalController@index')->name('finance.withdrawals');
Route::put('finance/withdrawals/approval', 'AdminWithdrawalController@approval')->name('finance.withdrawals.approval');
Route::get('finance/transactions', 'AdminTransactionController@index')->name('finance.transactions');


/****************************************************************************
	Packages
 ***************************************************************************/
 
Route::get('finance/packages', 'AdminPackageController@index')->name('packages');
Route::get('finance/packages/edit/{package}', 'AdminPackageController@edit')->name('packages.edit');
Route::put('finance/packages/{package}/update', 'AdminPackageController@update')->name('packages.update');
Route::get('finance/packages/create', 'AdminPackageController@create')->name('packages.create');
Route::post('finance/packages/store', 'AdminPackageController@store')->name('packages.store');
Route::delete('finance/packages/{package}', 'AdminPackageController@destroy')->name('packages.delete');


/****************************************************************************
	Coupons
 ***************************************************************************/
Route::get('finance/coupons', 'AdminCouponController@index')->name('finance.coupons');
Route::get('finance/coupons/{id}/activate', 'AdminCouponController@activate')->name('finance.coupons.activation');
Route::post('finance/coupons', 'AdminCouponController@store')->name('finance.coupons.store');
Route::delete('finance/coupons/{id}', 'AdminCouponController@destroy')->name('finance.coupons.destroy');


/****************************************************************************
	Blog and Blog Categories
 ***************************************************************************/

Route::get('blog/categories', 'AdminBlogCategoryController@index')->name('blog.categories');
Route::get('blog/categories/{category}/edit', 'AdminBlogCategoryController@edit')->name('blog.categories.edit');
Route::put('blog/categories/{category}/update', 'AdminBlogCategoryController@update')->name('blog.categories.update');
Route::post('blog/categories', 'AdminBlogCategoryController@store')->name('blog.categories.store');
Route::delete('blog/categories/{category}/destroy', 'AdminBlogCategoryController@destroy')->name('blog.categories.destroy');

Route::get('blog/', 'AdminBlogPostController@index')->name('blog.posts');
Route::get('blog/create', 'AdminBlogPostController@create')->name('blog.create');
Route::post('blog', 'AdminBlogPostController@store')->name('blog.store');
Route::get('blog/{post}/edit', 'AdminBlogPostController@edit')->name('blog.edit');
Route::put('blog/{post}', 'AdminBlogPostController@update')->name('blog.update');
Route::put('blog/{post}/updateMetadata', 'AdminBlogPostController@updateMetadata')->name('blog.updateMetadata');
Route::delete('blog/{post}/delete', 'AdminBlogPostController@destroy')->name('blog.destroy');
Route::get('blog/trash/empty', 'AdminBlogPostController@emptyTrash')->name('blog.empty_trash');




/****************************************************************************
	Board
 ***************************************************************************/



Route::get('board', 'BoardController@index')->name('board.index');
Route::get('finance/coupons/{id}/activate', 'AdminCouponController@activate')->name('finance.coupons.activation');
Route::post('board', 'BoardController@store')->name('board.store');
Route::delete('board/{id}', 'BoardController@destroy')->name('board.destroy');

Route::get('blog/categories/{category}/edit', 'AdminBlogCategoryController@edit')->name('blog.categories.edit');
Route::get('courses/certificates', 'DashboardController@certificates')->name('certificates.index');










