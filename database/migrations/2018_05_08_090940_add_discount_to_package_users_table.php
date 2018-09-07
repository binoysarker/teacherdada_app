<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDiscountToPackageUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('package_users', function (Blueprint $table) {
             $table->dropColumn(['number_of_courses']); 
            $table->date('validity');  
            $table->string('discount');         });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('package_users', function (Blueprint $table) {
               Schema::dropIfExists('package_users');
        });
    }
}
